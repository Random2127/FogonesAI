import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fogonesia/data/providers/database_providers.dart';
import 'package:fogonesia/features/recipe/controller/recipe_controller.dart';
import 'package:fogonesia/features/recipe/model/nutrition_info.dart';
import 'package:fogonesia/features/recipe/model/recipe.dart';
import 'package:go_router/go_router.dart';

class RecipeDetailsScreen extends ConsumerWidget {
  final String recipeId;
  const RecipeDetailsScreen({super.key, required this.recipeId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recipesAsync = ref.watch(recipeControllerProvider);
    final labelsAsync = ref.watch(recipeDietaryLabelsProvider(recipeId));
    final nutritionAsync = ref.watch(nutritionForRecipeProvider(recipeId));

    return recipesAsync.when(
      loading: () =>
          const Scaffold(body: Center(child: CircularProgressIndicator())),
      error: (e, _) => Scaffold(body: Center(child: Text('Error: $e'))),
      data: (recipes) {
        Recipe? recipe;
        for (final r in recipes) {
          if (r.id == recipeId) {
            recipe = r;
            break;
          }
        }
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
                labelsAsync.when(
                  loading: () => const SizedBox.shrink(),
                  error: (_, __) => const SizedBox.shrink(),
                  data: (labels) {
                    if (labels.isEmpty) return const SizedBox.shrink();
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: labels
                            .map(
                              (l) => Chip(
                                label: Text(l),
                                visualDensity: VisualDensity.compact,
                              ),
                            )
                            .toList(),
                      ),
                    );
                  },
                ),
                _section('Description', recipe.description),
                _ingredients(recipe.ingredients),
                _instructions(recipe.instructions),
                _meta(recipe.displayTimeMinutes),
                nutritionAsync.when(
                  loading: () => const SizedBox.shrink(),
                  error: (_, __) => const SizedBox.shrink(),
                  data: (n) {
                    if (n == null || !n.hasAnyData) {
                      return const SizedBox.shrink();
                    }
                    return _nutritionSection(n);
                  },
                ),
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

  Widget _meta(int minutes) {
    return Row(
      children: [
        const Icon(Icons.schedule, size: 18),
        const SizedBox(width: 6),
        Text(
          minutes > 0 ? '$minutes minutes' : 'Time not set',
        ),
      ],
    );
  }

  Widget _nutritionSection(NutritionInfo n) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 8),
        _sectionTitle('Nutrition (estimate)'),
        if (n.calories != null) Text('Calories: ${n.calories} kcal'),
        if (n.proteins != null) Text('Protein: ${n.proteins} g'),
        if (n.carbohydrates != null) Text('Carbohydrates: ${n.carbohydrates} g'),
        if (n.fiber != null) Text('Fiber: ${n.fiber} g'),
        const SizedBox(height: 16),
      ],
    );
  }
}
