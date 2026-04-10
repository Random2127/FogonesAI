import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fogonesia/data/providers/database_providers.dart';
import 'package:fogonesia/features/auth/auth_providers.dart';
import 'package:fogonesia/features/recipe/model/recipe.dart';

/// Exposes **favorited** recipes for the signed-in user (`favorites` ⋈ `recipes`).
///
/// **Persistence:** [recipeRepositoryProvider] + Firebase uid.
final recipeControllerProvider =
    AsyncNotifierProvider<RecipeController, List<Recipe>>(RecipeController.new);

/// Keeps the favorited list in memory and syncs with Drift.
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

  /// New recipe: `recipes` + `favorites`. Remove: drop link + delete recipe row.
  ///
  /// Returns the persisted recipe when a **new** favourite is created or an
  /// existing row is starred; `null` when removing a favourite or on error
  /// before state is updated.
  Future<Recipe?> toggleFavourite(Recipe recipe) async {
    final user = ref.read(firebaseAuthProvider).currentUser;
    if (user == null) return null;

    final repo = ref.read(recipeRepositoryProvider);
    try {
      final isSaved = recipe.id != null &&
          _allSaved.any((r) => r.id == recipe.id);
      if (isSaved) {
        await repo.unfavoriteAndDeleteRecipe(user.uid, recipe.id!);
        _allSaved.removeWhere((r) => r.id == recipe.id);
        state = AsyncData([..._filtered]);
        return null;
      }
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

  bool isFavourite(Recipe recipe) {
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
