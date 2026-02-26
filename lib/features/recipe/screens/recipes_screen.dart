import 'package:flutter/material.dart';
import 'package:fogonesia/features/recipe/controller/recipe_controller.dart';
import 'package:fogonesia/shared/routes.dart';
import 'package:provider/provider.dart';

class RecipesScreen extends StatelessWidget {
  const RecipesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final recipeController = context.watch<RecipeController>();
    final recipes = recipeController.favourites;

    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: SearchBar(
              leading: const Icon(Icons.search),
              hintText: 'Search recipes...',
              hintStyle: WidgetStateProperty.all(
                const TextStyle(color: Colors.grey),
              ),
              onChanged: (value) {
                recipeController.filterRecipes(value);
              },
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: recipes.isEmpty
                  ? const Center(child: Text('No saved recipes yet 🍳'))
                  : ListView.builder(
                      itemCount: recipes.length,
                      itemBuilder: (context, index) {
                        final recipe = recipes[index];
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
          ),
        ],
      ),
    );
  }
}
