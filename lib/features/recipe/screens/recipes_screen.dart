import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fogonesia/features/recipe/controller/recipe_controller.dart';
import 'package:fogonesia/shared/remove_saved_recipe_dialog.dart';
import 'package:go_router/go_router.dart';

class RecipesScreen extends ConsumerWidget {
  const RecipesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recipesAsync = ref.watch(recipeControllerProvider);
    final recipeController = ref.read(recipeControllerProvider.notifier);

    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: SearchBar(
              leading: const Icon(Icons.search),
              hintText: 'Search saved recipes...',
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
              child: recipesAsync.when(
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (e, _) => Center(child: Text('Error: $e')),
                data: (recipes) => recipes.isEmpty
                    ? const Center(child: Text('No saved recipes yet 🍳'))
                    : ListView.builder(
                        itemCount: recipes.length,
                        itemBuilder: (context, index) {
                          final recipe = recipes[index];
                          final id = recipe.id;
                          if (id == null) {
                            return const SizedBox.shrink();
                          }
                          return Dismissible(
                            key: ValueKey('saved_$id'),
                            direction: DismissDirection.endToStart,
                            confirmDismiss: (_) async {
                              final confirm =
                                  await showRemoveSavedRecipeDialog(context);
                              if (!confirm) return false;
                              final ok = await ref
                                  .read(recipeControllerProvider.notifier)
                                  .deleteSavedRecipe(id);
                              if (!ok && context.mounted) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                      'Could not remove recipe. Try again.',
                                    ),
                                  ),
                                );
                              }
                              return ok;
                            },
                            background: Container(
                              alignment: Alignment.centerRight,
                              padding: const EdgeInsets.only(right: 20),
                              decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.error,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Icon(
                                Icons.delete_outline,
                                color: Colors.white,
                                size: 28,
                              ),
                            ),
                            child: Card(
                              elevation: 2,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              margin: const EdgeInsets.symmetric(vertical: 6),
                              child: ListTile(
                                contentPadding: const EdgeInsets.all(12),
                                title: Text(
                                  recipe.title,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium,
                                ),
                                subtitle: Text(
                                  recipe.description,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                trailing: const Icon(Icons.chevron_right),
                                onTap: () {
                                  context.push('/recipe/$id');
                                },
                              ),
                            ),
                          );
                        },
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
