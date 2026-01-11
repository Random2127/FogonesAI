// edit saved recipe
import 'package:flutter/material.dart';
import 'package:fogonesia/models/recipe.dart';

class EditRecipeScreen extends StatelessWidget {
  final Recipe recipe;
  const EditRecipeScreen({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Edit Recipe $recipe.title')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Text(recipe.description),
      ),
    );
  }
}
