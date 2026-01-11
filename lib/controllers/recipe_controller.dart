import 'package:flutter/material.dart';
import 'package:fogonesia/models/recipe.dart';
import 'package:fogonesia/services/database_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RecipeController extends ChangeNotifier {
  final SharedPreferences _prefs;

  List<Recipe> _favourites = [];
  List<Recipe> get favourites => _favourites;

  RecipeController(this._prefs) {
    loadFavourites();
  }

  Future<void> loadFavourites() async {
    _favourites = await DatabaseService.getFavourites();
    notifyListeners();
  }

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
}
