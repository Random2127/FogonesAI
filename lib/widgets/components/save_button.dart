import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fogonesia/features/recipe/controller/recipe_controller.dart';
import 'package:fogonesia/features/recipe/model/recipe.dart';

/// Heart toggle: saves a new recipe row (UUID) or removes by [Recipe.id].
///
/// **Flow:** [RecipeController.toggleFavourite] → [recipeRepositoryProvider] → `recipes` table.
/// [select] limits rebuilds to whether this [recipe.id] appears in the saved list.
///
/// [onPersisted] runs when a recipe is **saved or re-starred** (not on unfavourite),
/// e.g. chat can replace the in-memory [Recipe] so the heart reflects the new id.
class SaveButton extends ConsumerWidget {
  final Recipe recipe;
  final void Function(Recipe persisted)? onPersisted;

  const SaveButton({super.key, required this.recipe, this.onPersisted});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.read(recipeControllerProvider.notifier);

    final isFavourite = ref.watch(
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
      onPressed: () async {
        final persisted = await controller.toggleFavourite(recipe);
        if (persisted != null) {
          onPersisted?.call(persisted);
        }
      },
      child: Icon(isFavourite ? Icons.favorite : Icons.favorite_border),
    );
  }
}
