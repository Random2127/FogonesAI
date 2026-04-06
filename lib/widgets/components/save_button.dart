import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fogonesia/features/recipe/controller/recipe_controller.dart';
import 'package:fogonesia/features/recipe/model/recipe.dart';

/// Heart toggle on a recipe card: **UI entry point** for the favourites flow.
///
/// **Flow (tap → disk):** `toggleFavourite` on [RecipeController] →
/// [favouritesRepositoryProvider] (see `database_providers.dart`) → SQLite via Drift.
///
/// Uses [recipeControllerProvider.select] so only this button rebuilds when
/// “is this title in the list?” changes, not on every controller update.
class SaveButton extends ConsumerWidget {
  final Recipe recipe;

  const SaveButton({super.key, required this.recipe});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.read(recipeControllerProvider.notifier);

    final isFavourite = ref.watch(
      recipeControllerProvider.select(
        (state) =>
            state.whenOrNull(
              data: (recipes) => recipes.any((r) => r.title == recipe.title),
            ) ??
            false,
      ),
    );

    return FloatingActionButton(
      mini: true,
      onPressed: () => controller.toggleFavourite(recipe),
      child: Icon(isFavourite ? Icons.favorite : Icons.favorite_border),
    );
  }
}
