import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fogonesia/features/recipe/controller/recipe_controller.dart';
import 'package:fogonesia/features/recipe/model/recipe.dart';

/// Heart: **save only** (no delete). When already saved, shows a snackbar.
///
/// **Flow:** [RecipeController.saveRecipe] → [recipeRepositoryProvider] → Drift.
/// [select] limits rebuilds to whether this recipe appears in the saved list.
///
/// [onPersisted] runs when a recipe is newly saved so chat can update [Recipe.id].
class SaveButton extends ConsumerWidget {
  final Recipe recipe;
  final void Function(Recipe persisted)? onPersisted;

  const SaveButton({super.key, required this.recipe, this.onPersisted});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.read(recipeControllerProvider.notifier);

    final isRecipeSaved = ref.watch(
      recipeControllerProvider.select(
        (state) =>
            state.whenOrNull(
              data: (recipes) =>
                  recipe.id != null &&
                  recipes.any((r) => r.id == recipe.id),
            ) ??
            false,
      ),
    );

    return FloatingActionButton(
      mini: true,
      tooltip: isRecipeSaved ? 'Saved' : 'Save recipe',
      onPressed: () async {
        if (isRecipeSaved) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Recipe already saved')),
          );
          return;
        }
        final persisted = await controller.saveRecipe(recipe);
        if (persisted != null) {
          onPersisted?.call(persisted);
        }
      },
      child: Icon(isRecipeSaved ? Icons.favorite : Icons.favorite_border),
    );
  }
}
