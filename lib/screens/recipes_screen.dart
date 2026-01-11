import 'package:flutter/material.dart';
import 'package:fogonesia/utils/routes.dart';
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
                  // card for each recipe
                  return Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    margin: const EdgeInsets.symmetric(vertical: 6),
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(12),
                      title: Text(
                        recipe.title,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      subtitle: Text(
                        recipe.description,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      trailing: const Icon(Icons.chevron_right),
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          Routes.recipeDetails,
                          arguments: recipe.title,
                        );
                      },
                    ),
                  );
                },
              ),
      ),
    );
  }
}
