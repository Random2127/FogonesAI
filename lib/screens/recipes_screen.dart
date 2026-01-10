import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fogonesia/controllers/recipe_controller.dart';

class RecipesScreen extends StatelessWidget {
  const RecipesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final recipeController = context.watch<RecipeController>();

    final recipes = recipeController.favourites;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: recipes.isEmpty
            ? const Center(child: Text('No saved recipes yet 🍳'))
            : ListView.builder(
                itemCount: recipes.length,
                itemBuilder: (context, index) {
                  final recipe = recipes[index];
                  return ListTile(
                    title: Text(recipe.title),
                    subtitle: Text(recipe.description),
                  );
                },
              ),
      ),
    );
  }
}
