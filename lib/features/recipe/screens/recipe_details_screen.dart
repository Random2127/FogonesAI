import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fogonesia/features/recipe/controller/recipe_controller.dart';
import 'package:fogonesia/features/recipe/model/recipe.dart';
import 'package:go_router/go_router.dart';

class RecipeDetailsScreen extends ConsumerWidget {
  final String recipeTitle;
  const RecipeDetailsScreen({super.key, required this.recipeTitle});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recipesAsync = ref.watch(recipeControllerProvider);

    return recipesAsync.when(
      loading: () =>
          const Scaffold(body: Center(child: CircularProgressIndicator())),
      error: (e, _) => Scaffold(body: Center(child: Text('Error: $e'))),
      data: (recipes) {
        final recipe = recipes.cast<Recipe?>().firstWhere(
          (r) => r?.title == recipeTitle,
          orElse: () => null,
        );
        if (recipe == null) {
          return const Scaffold(body: Center(child: Text('Recipe not found')));
        }

        return Scaffold(
          appBar: AppBar(
            title: Text(recipe.title),
            actions: [
              IconButton(
                icon: const Icon(Icons.edit),
                onPressed: () {
                  context.push('/editRecipe', extra: recipe);
                },
              ),
            ],
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _section('Description', recipe.description),
                _ingredients(recipe.ingredients),
                _instructions(recipe.instructions),
                _meta(recipe.time),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _sectionTitle(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        text,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _section(String title, String content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _sectionTitle(title),
        Text(content),
        const SizedBox(height: 24),
      ],
    );
  }

  Widget _ingredients(List<String> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _sectionTitle('Ingredients'),
        ...items.map(
          (i) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Text('• $i'),
          ),
        ),
        const SizedBox(height: 24),
      ],
    );
  }

  Widget _instructions(List<String> steps) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _sectionTitle('Instructions'),
        ...steps.asMap().entries.map(
          (e) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 6),
            child: Text('${e.key + 1}. ${e.value}'),
          ),
        ),
        const SizedBox(height: 24),
      ],
    );
  }

  Widget _meta(int time) {
    return Row(
      children: [
        const Icon(Icons.schedule, size: 18),
        const SizedBox(width: 6),
        Text('$time minutes'),
      ],
    );
  }
}
