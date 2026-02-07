import 'package:flutter/material.dart';
import 'package:fogonesia/models/recipe.dart';
import 'package:fogonesia/services/database_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RecipeController extends ChangeNotifier {
  //Elimino el campo _prefs si no se va a usar para evitar el warning.
  
  List<Recipe> _favourites = [];
  List<Recipe> _filteredFavourites = [];

  List<Recipe> get favourites => _filteredFavourites;


  RecipeController(SharedPreferences prefs) {
    loadFavourites();
  }

  Future<void> loadFavourites() async {
    _favourites = await DatabaseService.getFavourites();
    _filteredFavourites = List.from(_favourites); // Copia segura
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
    
    //Al modificar favoritos, reaplicamos el filtro actual si lo hubiera
    _filteredFavourites = List.from(_favourites); 
    notifyListeners();
  }

  bool isFavourite(Recipe recipe) {
    return _favourites.any((r) => r.title == recipe.title);
  }

  Future<void> updateRecipe(Recipe updatedRecipe) async {
    final index = _favourites.indexWhere((r) => r.title == updatedRecipe.title);

    if (index == -1) return;

    await DatabaseService.updateFavourite(updatedRecipe);
    _favourites[index] = updatedRecipe;
    
    // Sincronizamos la lista filtrada
    final filteredIndex = _filteredFavourites.indexWhere((r) => r.title == updatedRecipe.title);
    if (filteredIndex != -1) {
      _filteredFavourites[filteredIndex] = updatedRecipe;
    }

    notifyListeners();
  }

  void filterRecipes(String value) {
    if (value.isEmpty) {
      _filteredFavourites = List.from(_favourites);
    } else {
      final searchTerm = value.toLowerCase();
      _filteredFavourites = _favourites
          .where(
            (recipe) =>
                recipe.title.toLowerCase().contains(searchTerm) ||
                recipe.description.toLowerCase().contains(searchTerm), // <--- Aquí quitamos el ?.
          )
          .toList();
    }
    notifyListeners();
  }
}
