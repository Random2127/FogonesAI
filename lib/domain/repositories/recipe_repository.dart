import 'package:fogonesia/features/recipe/model/nutrition_info.dart';
import 'package:fogonesia/features/recipe/model/recipe.dart';

/// Persistence for **recipes** + **favorites** ([DATABASE SCHEMA.md]).
///
/// The Recipes list UI shows recipes that have a row in `favorites` for the user.
abstract class RecipeRepository {
  /// Ensures a `users` row exists for the signed-in Firebase account.
  Future<void> ensureUserForFirebaseAccount({
    required String uid,
    String? email,
    String? displayName,
  });

  /// Recipes starred by this user (`favorites` ⋈ `recipes`).
  Future<List<Recipe>> listFavoritedRecipesForUser(String userId);

  Future<Recipe?> getRecipeById(String id);

  /// Insert `recipes` + `favorites` in one transaction ([draft.id] must be null).
  Future<Recipe> createAndFavoriteRecipe(Recipe draft, String userId);

  /// Star an existing recipe (row must already exist in `recipes`).
  Future<void> addFavorite(String userId, String recipeId);

  /// Removes the favorite link and deletes the recipe row (same UX as Stage 1).
  Future<void> unfavoriteAndDeleteRecipe(String userId, String recipeId);

  Future<bool> isFavorited(String userId, String recipeId);

  /// Updates an existing row; [recipe.id] must be non-null.
  Future<void> updateRecipe(Recipe recipe);

  /// Deletes nutrition, recipe–dietary links, favorites, then the recipe row.
  Future<void> deleteRecipe(String id);

  /// Single `nutrition` row per recipe, if present.
  Future<NutritionInfo?> getNutrition(String recipeId);

  /// Human-readable dietary tags saved for this recipe.
  Future<List<String>> getRecipeDietaryLabels(String recipeId);
}
