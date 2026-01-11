import 'package:flutter/material.dart';
import 'package:fogonesia/models/recipe.dart';
import 'package:fogonesia/services/database_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RecipeController extends ChangeNotifier {
  final SharedPreferences _prefs;

  List<Recipe> _favourites = [];
  // List for SearchBar filtering
  List<Recipe> _filteredFavourites = [];

  List<Recipe> get favourites => _filteredFavourites;

  RecipeController(this._prefs) {
    loadFavourites();
  }

  Future<void> loadFavourites() async {
    _favourites = await DatabaseService.getFavourites();
    _filteredFavourites = _favourites;
    notifyListeners();
  }

  //
  Future<void> toggleFavourite(Recipe recipe) async {
    final isFav = _favourites.any((r) => r.title == recipe.title);

    if (isFav) {
      await DatabaseService.deleteFavourite(recipe.title);
      _favourites.removeWhere((r) => r.title == recipe.title);
    } else {
      await DatabaseService.insertFavourite(recipe);
      _favourites.add(recipe);
    }

    notifyListeners();
  }

  bool isFavourite(Recipe recipe) {
    return _favourites.any((r) => r.title == recipe.title);
  }

  Future<void> updateRecipe(Recipe updatedRecipe) async {
    final index = _favourites.indexWhere((r) => r.title == updatedRecipe.title);

    if (index == -1) {
      return; // recipe not found, safety guard
    }

    // Update database first
    await DatabaseService.updateFavourite(updatedRecipe);

    // Update in-memory list
    _favourites[index] = updatedRecipe;

    notifyListeners();
  }

  void filterRecipes(String value) {
    if (value.isEmpty) {
      _filteredFavourites = _favourites;
    } else {
      _filteredFavourites = _favourites
          .where(
            (recipe) =>
                recipe.title.toLowerCase().contains(value.toLowerCase()) ||
                recipe.description.toLowerCase().contains(value.toLowerCase()),
          )
          .toList();
    }
    notifyListeners();
  }
}
