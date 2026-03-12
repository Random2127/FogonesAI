import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fogonesia/features/recipe/controller/recipe_controller.dart';
import 'package:fogonesia/features/recipe/model/recipe.dart';

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
