import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:fogonesia/data/local/dao/dietary_dao.dart';
import 'package:fogonesia/data/local/dao/favorites_dao.dart';
import 'package:fogonesia/data/local/dao/nutrition_dao.dart';
import 'package:fogonesia/data/local/dao/recipes_dao.dart';
import 'package:fogonesia/data/local/dao/users_dao.dart';
import 'package:fogonesia/data/local/database/app_database.dart';
import 'package:fogonesia/domain/repositories/recipe_repository.dart';
import 'package:fogonesia/features/recipe/model/nutrition_info.dart';
import 'package:fogonesia/features/recipe/model/recipe.dart';
import 'package:uuid/uuid.dart';

/// Maps Drift rows ↔ [Recipe]; coordinates recipes, favorites, dietary, nutrition.
class RecipeRepositoryImpl implements RecipeRepository {
  RecipeRepositoryImpl(
    this._usersDao,
    this._recipesDao,
    this._favoritesDao,
    this._dietaryDao,
    this._nutritionDao, {
    Uuid? uuid,
  }) : _uuid = uuid ?? const Uuid();

  final UsersDao _usersDao;
  final RecipesDao _recipesDao;
  final FavoritesDao _favoritesDao;
  final DietaryDao _dietaryDao;
  final NutritionDao _nutritionDao;
  final Uuid _uuid;

  List<String> _decodeList(String? json) {
    if (json == null || json.isEmpty) return [];
    try {
      final decoded = jsonDecode(json);
      if (decoded is List) {
        return List<String>.from(decoded.map((e) => e.toString()));
      }
    } catch (_) {}
    return [];
  }

  Recipe _rowToRecipe(RecipeRow row) {
    return Recipe(
      id: row.id,
      userId: row.userId,
      title: row.title,
      description: row.description ?? '',
      ingredients: _decodeList(row.ingredients),
      instructions: _decodeList(row.instructions),
      prepTime: row.prepTime,
      cookTime: row.cookTime,
      servings: row.servings,
      difficulty: row.difficulty,
      imageUrl: row.imageUrl,
    );
  }

  Future<void> _deleteRecipeDependencies(String recipeId) async {
    await _nutritionDao.deleteByRecipeId(recipeId);
    await _dietaryDao.deleteRecipeDietaryLinks(recipeId);
    await _favoritesDao.deleteByRecipeId(recipeId);
  }

  @override
  Future<void> ensureUserForFirebaseAccount({
    required String uid,
    String? email,
    String? displayName,
  }) async {
    final emailNorm =
        (email != null && email.isNotEmpty) ? email : '$uid@users.local';
    final username = (displayName != null && displayName.isNotEmpty)
        ? displayName
        : emailNorm.split('@').first;
    await _usersDao.upsertUser(
      UsersCompanion.insert(
        id: uid,
        userHash: uid,
        username: username,
        email: emailNorm,
        passwordHash: '',
        createdAt: Value(DateTime.now()),
      ),
    );
  }

  @override
  Future<List<Recipe>> listFavoritedRecipesForUser(String userId) async {
    final rows = await _favoritesDao.listFavoritedRecipesForUser(userId);
    return rows.map(_rowToRecipe).toList();
  }

  @override
  Future<Recipe?> getRecipeById(String id) async {
    final row = await _recipesDao.getById(id);
    return row == null ? null : _rowToRecipe(row);
  }

  @override
  Future<Recipe> createAndFavoriteRecipe(Recipe draft, String userId) async {
    if (draft.id != null) {
      throw ArgumentError('draft.id must be null for createAndFavoriteRecipe');
    }
    final newId = _uuid.v4();
    await _recipesDao.attachedDatabase.transaction(() async {
      await _recipesDao.insertRecipe(
        RecipesCompanion.insert(
          id: newId,
          userId: userId,
          title: draft.title,
          description: Value(draft.description),
          ingredients: Value(jsonEncode(draft.ingredients)),
          instructions: Value(jsonEncode(draft.instructions)),
          prepTime: Value(draft.prepTime),
          cookTime: Value(draft.cookTime),
          servings: Value(draft.servings),
          difficulty: Value(draft.difficulty),
          imageUrl: Value(draft.imageUrl),
        ),
      );
      await _favoritesDao.insertFavorite(
        FavoritesCompanion.insert(
          id: _uuid.v4(),
          userId: userId,
          recipeId: newId,
          createdAt: Value(DateTime.now()),
        ),
      );

      final userPrefs = await _dietaryDao.getUserOptionIds(userId);
      for (final oid in userPrefs) {
        await _dietaryDao.insertRecipeDietaryLink(newId, oid);
      }

      final n = draft.nutrition;
      if (n != null && n.hasAnyData) {
        await _nutritionDao.insertNutrition(
          NutritionFactsCompanion.insert(
            id: _uuid.v4(),
            recipeId: newId,
            calories: Value(n.calories),
            proteins: Value(n.proteins),
            carbohydrates: Value(n.carbohydrates),
            fiber: Value(n.fiber),
          ),
        );
      }
    });
    final row = await _recipesDao.getById(newId);
    if (row == null) {
      throw StateError('Recipe insert failed for id $newId');
    }
    return _rowToRecipe(row);
  }

  @override
  Future<void> addFavorite(String userId, String recipeId) async {
    await _recipesDao.attachedDatabase.transaction(() async {
      await _favoritesDao.insertFavorite(
        FavoritesCompanion.insert(
          id: _uuid.v4(),
          userId: userId,
          recipeId: recipeId,
          createdAt: Value(DateTime.now()),
        ),
      );
      final existingLinks = await _dietaryDao.getRecipeOptionIds(recipeId);
      if (existingLinks.isEmpty) {
        final userPrefs = await _dietaryDao.getUserOptionIds(userId);
        for (final oid in userPrefs) {
          await _dietaryDao.insertRecipeDietaryLink(recipeId, oid);
        }
      }
    });
  }

  @override
  Future<void> unfavoriteAndDeleteRecipe(
    String userId,
    String recipeId,
  ) async {
    await _recipesDao.attachedDatabase.transaction(() async {
      await _favoritesDao.deleteByUserAndRecipe(userId, recipeId);
      await _deleteRecipeDependencies(recipeId);
      await _recipesDao.deleteById(recipeId);
    });
  }

  @override
  Future<bool> isFavorited(String userId, String recipeId) {
    return _favoritesDao.isFavorited(userId, recipeId);
  }

  @override
  Future<void> updateRecipe(Recipe recipe) async {
    final id = recipe.id;
    if (id == null) {
      throw ArgumentError('Recipe.id is required to update');
    }
    await _recipesDao.updateRecipe(
      id,
      RecipesCompanion(
        title: Value(recipe.title),
        description: Value(recipe.description),
        ingredients: Value(jsonEncode(recipe.ingredients)),
        instructions: Value(jsonEncode(recipe.instructions)),
        prepTime: Value(recipe.prepTime),
        cookTime: Value(recipe.cookTime),
        servings: Value(recipe.servings),
        difficulty: Value(recipe.difficulty),
        imageUrl: Value(recipe.imageUrl),
      ),
    );
  }

  @override
  Future<void> deleteRecipe(String id) async {
    await _deleteRecipeDependencies(id);
    await _recipesDao.deleteById(id);
  }

  @override
  Future<NutritionInfo?> getNutrition(String recipeId) async {
    final row = await _nutritionDao.getByRecipeId(recipeId);
    if (row == null) return null;
    return NutritionInfo(
      calories: row.calories,
      proteins: row.proteins,
      carbohydrates: row.carbohydrates,
      fiber: row.fiber,
    );
  }

  @override
  Future<List<String>> getRecipeDietaryLabels(String recipeId) async {
    final ids = await _dietaryDao.getRecipeOptionIds(recipeId);
    return _dietaryDao.namesForOptionIds(ids);
  }
}
