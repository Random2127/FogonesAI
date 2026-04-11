import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fogonesia/data/providers/database_providers.dart';
import 'package:fogonesia/features/auth/auth_providers.dart';
import 'package:fogonesia/features/recipe/model/recipe.dart';

/// Exposes **saved** recipes for the signed-in user (`favorites` ⋈ `recipes`).
///
/// **Persistence:** [recipeRepositoryProvider] + Firebase uid.
final recipeControllerProvider =
    AsyncNotifierProvider<RecipeController, List<Recipe>>(RecipeController.new);

/// Keeps the saved list in memory and syncs with Drift.
class RecipeController extends AsyncNotifier<List<Recipe>> {
  List<Recipe> _allSaved = [];
  String _filterQuery = '';

  @override
  Future<List<Recipe>> build() async {
    final user = ref.read(firebaseAuthProvider).currentUser;
    if (user == null) {
      _allSaved = [];
      return _allSaved;
    }
    final repo = ref.read(recipeRepositoryProvider);
    await repo.ensureUserForFirebaseAccount(
      uid: user.uid,
      email: user.email,
      displayName: user.displayName,
    );
    _allSaved = await repo.listFavoritedRecipesForUser(user.uid);
    return _allSaved;
  }

  List<Recipe> get _filtered {
    if (_filterQuery.isEmpty) return List.from(_allSaved);
    final query = _filterQuery.toLowerCase();
    return _allSaved
        .where(
          (r) =>
              r.title.toLowerCase().contains(query) ||
              r.description.toLowerCase().contains(query),
        )
        .toList();
  }

  /// Persists a new recipe or stars an existing row; does **not** remove saves.
  /// Call only when [isSaved] is false; when already saved, the UI shows a snackbar.
  Future<Recipe?> saveRecipe(Recipe recipe) async {
    final user = ref.read(firebaseAuthProvider).currentUser;
    if (user == null) return null;

    final repo = ref.read(recipeRepositoryProvider);
    try {
      if (recipe.id == null) {
        final saved = await repo.createAndFavoriteRecipe(recipe, user.uid);
        _allSaved.add(saved);
        state = AsyncData([..._filtered]);
        return saved;
      }
      await repo.addFavorite(user.uid, recipe.id!);
      final existing = await repo.getRecipeById(recipe.id!);
      if (existing != null) {
        _allSaved.add(existing);
      }
      state = AsyncData([..._filtered]);
      return existing;
    } catch (e, st) {
      state = AsyncError(e, st);
      return null;
    }
  }

  /// Deletes the recipe row and related data after the user confirms in the UI.
  Future<bool> deleteSavedRecipe(String recipeId) async {
    final user = ref.read(firebaseAuthProvider).currentUser;
    if (user == null) return false;

    final repo = ref.read(recipeRepositoryProvider);
    try {
      await repo.unfavoriteAndDeleteRecipe(user.uid, recipeId);
      _allSaved.removeWhere((r) => r.id == recipeId);
      state = AsyncData([..._filtered]);
      return true;
    } catch (e, st) {
      state = AsyncError(e, st);
      return false;
    }
  }

  bool isSaved(Recipe recipe) {
    if (recipe.id == null) return false;
    return _allSaved.any((r) => r.id == recipe.id);
  }

  Future<void> updateRecipe(Recipe updatedRecipe) async {
    final id = updatedRecipe.id;
    if (id == null) return;
    final index = _allSaved.indexWhere((r) => r.id == id);
    if (index == -1) return;

    try {
      await ref.read(recipeRepositoryProvider).updateRecipe(updatedRecipe);
      _allSaved[index] = updatedRecipe;
      state = AsyncData([..._filtered]);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  void filterRecipes(String value) {
    _filterQuery = value;
    state = AsyncData([..._filtered]);
  }
}
