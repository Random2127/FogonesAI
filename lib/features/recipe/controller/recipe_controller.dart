import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fogonesia/data/providers/database_providers.dart';
import 'package:fogonesia/features/recipe/model/recipe.dart';

/// Exposes the list of **saved (favourite) recipes** for the recipe feature UI.
///
/// **Persistence:** all reads/writes go through [favouritesRepositoryProvider]
/// ([FavouritesRepository]), not Drift/SQLite directly — see `lib/domain` + `lib/data`.
final recipeControllerProvider =
    AsyncNotifierProvider<RecipeController, List<Recipe>>(RecipeController.new);

/// Coordinates favourite recipes in memory and keeps the DB in sync.
///
/// **State:** [AsyncNotifier] state is the **filtered** list for the UI; the full
/// list lives in [_allFavourites]. [filterRecipes] only affects what is shown,
/// not what is stored.
class RecipeController extends AsyncNotifier<List<Recipe>> {
  List<Recipe> _allFavourites = [];
  String _filterQuery = '';

  /// Loads every favourite from local storage once when this provider is first read.
  @override
  Future<List<Recipe>> build() async {
    final repo = ref.read(favouritesRepositoryProvider);
    _allFavourites = await repo.getAll();
    return _allFavourites;
  }

  /// Applies [_filterQuery] to [_allFavourites] for display (no I/O).
  List<Recipe> get _filtered {
    if (_filterQuery.isEmpty) return List.from(_allFavourites);
    final query = _filterQuery.toLowerCase();
    return _allFavourites
        .where(
          (r) =>
              r.title.toLowerCase().contains(query) ||
              r.description.toLowerCase().contains(query),
        )
        .toList();
  }

  /// Add or remove [recipe] in SQLite (by title), then refresh in-memory list + UI state.
  Future<void> toggleFavourite(Recipe recipe) async {
    final isFav = _allFavourites.any((r) => r.title == recipe.title);

    final repo = ref.read(favouritesRepositoryProvider);
    if (isFav) {
      await repo.deleteByTitle(recipe.title);
      _allFavourites.removeWhere((r) => r.title == recipe.title);
    } else {
      await repo.upsert(recipe);
      _allFavourites.add(recipe);
    }

    state = AsyncData([..._filtered]);
  }

  /// In-memory check only; does not query the DB (list was loaded in [build]).
  bool isFavourite(Recipe recipe) {
    return _allFavourites.any((r) => r.title == recipe.title);
  }

  /// Persists edits for an already-saved favourite (matched by [Recipe.title]).
  Future<void> updateRecipe(Recipe updatedRecipe) async {
    final index = _allFavourites.indexWhere(
      (r) => r.title == updatedRecipe.title,
    );
    if (index == -1) return;

    await ref.read(favouritesRepositoryProvider).update(updatedRecipe);
    _allFavourites[index] = updatedRecipe;

    state = AsyncData([..._filtered]);
  }

  void filterRecipes(String value) {
    _filterQuery = value;
    state = AsyncData([..._filtered]);
  }
}
