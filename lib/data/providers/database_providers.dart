import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fogonesia/data/local/database/app_database.dart';
import 'package:fogonesia/data/local/dao/dietary_dao.dart';
import 'package:fogonesia/data/local/dao/favorites_dao.dart';
import 'package:fogonesia/data/local/dao/nutrition_dao.dart';
import 'package:fogonesia/data/local/dao/recipes_dao.dart';
import 'package:fogonesia/data/local/dao/users_dao.dart';
import 'package:fogonesia/data/repositories/dietary_repository_impl.dart';
import 'package:fogonesia/data/repositories/recipe_repository_impl.dart';
import 'package:fogonesia/domain/repositories/dietary_repository.dart';
import 'package:fogonesia/domain/repositories/recipe_repository.dart';
import 'package:fogonesia/features/recipe/model/nutrition_info.dart';

/// Riverpod wiring for Drift: **database → DAOs → repositories**.
///
/// Features should depend on repository providers, not [appDatabaseProvider],
/// so persistence can be overridden in tests.

// --- Database & DAOs (data layer only) ---

/// Single [AppDatabase] for the app process; closed when the provider is disposed.
final appDatabaseProvider = Provider<AppDatabase>((ref) {
  final db = AppDatabase();
  ref.onDispose(db.close);
  return db;
});

final usersDaoProvider = Provider<UsersDao>((ref) {
  return ref.watch(appDatabaseProvider).usersDao;
});

final recipesDaoProvider = Provider<RecipesDao>((ref) {
  return ref.watch(appDatabaseProvider).recipesDao;
});

final favoritesDaoProvider = Provider<FavoritesDao>((ref) {
  return ref.watch(appDatabaseProvider).favoritesDao;
});

final dietaryDaoProvider = Provider<DietaryDao>((ref) {
  return ref.watch(appDatabaseProvider).dietaryDao;
});

final nutritionDaoProvider = Provider<NutritionDao>((ref) {
  return ref.watch(appDatabaseProvider).nutritionDao;
});

// --- Repositories (feature-facing persistence API) ---

final dietaryRepositoryProvider = Provider<DietaryRepository>((ref) {
  return DietaryRepositoryImpl(ref.watch(dietaryDaoProvider));
});

final recipeRepositoryProvider = Provider<RecipeRepository>((ref) {
  return RecipeRepositoryImpl(
    ref.watch(usersDaoProvider),
    ref.watch(recipesDaoProvider),
    ref.watch(favoritesDaoProvider),
    ref.watch(dietaryDaoProvider),
    ref.watch(nutritionDaoProvider),
  );
});

// --- Recipe detail helpers (repository-backed) ---

/// Loads `nutrition` row for a recipe (detail screen).
final nutritionForRecipeProvider =
    FutureProvider.autoDispose.family<NutritionInfo?, String>((ref, recipeId) {
  return ref.watch(recipeRepositoryProvider).getNutrition(recipeId);
});

/// Dietary tag names stored on the recipe when it was saved.
final recipeDietaryLabelsProvider =
    FutureProvider.autoDispose.family<List<String>, String>((ref, recipeId) {
  return ref.watch(recipeRepositoryProvider).getRecipeDietaryLabels(recipeId);
});
