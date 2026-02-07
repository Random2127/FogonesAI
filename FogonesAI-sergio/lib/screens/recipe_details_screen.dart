import 'package:flutter/material.dart';
import 'package:fogonesia/controllers/recipe_controller.dart';
import 'package:fogonesia/utils/routes.dart';
import 'package:provider/provider.dart';

class RecipeDetailsScreen extends StatelessWidget {
  final String recipeTitle;
  const RecipeDetailsScreen({super.key, required this.recipeTitle});

  @override
  Widget build(BuildContext context) {
    final recipe = context.watch<RecipeController>().favourites.firstWhere(
      (r) => r.title == recipeTitle,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(recipe.title),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              Navigator.pushNamed(
                context,
                Routes.editRecipe,
                arguments: recipe,
              );
            },
          ),
        ],
      ),
      // I could extract body but for now it's ok
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
