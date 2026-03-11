import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fogonesia/features/recipe/model/recipe.dart';
import 'package:fogonesia/services/database_service.dart';

final recipeControllerProvider =
    AsyncNotifierProvider<RecipeController, List<Recipe>>(RecipeController.new);

class RecipeController extends AsyncNotifier<List<Recipe>> {
  List<Recipe> _allFavourites = [];
  String _filterQuery = '';

  @override
  Future<List<Recipe>> build() async {
    _allFavourites = await DatabaseService.getFavourites();
    return _allFavourites;
  }

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

  Future<void> toggleFavourite(Recipe recipe) async {
    final isFav = _allFavourites.any((r) => r.title == recipe.title);

    if (isFav) {
      await DatabaseService.deleteFavourite(recipe.title);
      _allFavourites.removeWhere((r) => r.title == recipe.title);
    } else {
      await DatabaseService.insertFavourite(recipe);
      _allFavourites.add(recipe);
    }

    state = AsyncData([..._filtered]);
  }

  bool isFavourite(Recipe recipe) {
    return _allFavourites.any((r) => r.title == recipe.title);
  }

  Future<void> updateRecipe(Recipe updatedRecipe) async {
    final index = _allFavourites.indexWhere(
      (r) => r.title == updatedRecipe.title,
    );
    if (index == -1) return;

    await DatabaseService.updateFavourite(updatedRecipe);
    _allFavourites[index] = updatedRecipe;

    state = AsyncData([..._filtered]);
  }

  void filterRecipes(String value) {
    _filterQuery = value;
    state = AsyncData([..._filtered]);
  }
}
