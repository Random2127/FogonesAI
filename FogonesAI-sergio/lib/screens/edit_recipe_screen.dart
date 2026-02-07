// edit saved recipe
import 'package:flutter/material.dart';
import 'package:fogonesia/controllers/recipe_controller.dart';
import 'package:fogonesia/models/recipe.dart';
import 'package:provider/provider.dart';

class EditRecipeScreen extends StatefulWidget {
  final Recipe recipe;
  const EditRecipeScreen({super.key, required this.recipe});

  @override
  State<EditRecipeScreen> createState() => _EditRecipeScreenState();
}

class _EditRecipeScreenState extends State<EditRecipeScreen> {
  late final TextEditingController _titleController;
  late final TextEditingController _descriptionController;
  late final TextEditingController _ingredientsController;
  late final TextEditingController _instructionsController;
  late final TextEditingController _timeController;

  @override
  void initState() {
    super.initState();
    final recipe = widget.recipe;
    _titleController = TextEditingController(text: recipe.title);
    _descriptionController = TextEditingController(text: recipe.description);
    _ingredientsController = TextEditingController(
      text: recipe.ingredients.join('\n'),
    );
    _instructionsController = TextEditingController(
      text: recipe.instructions.join('\n'),
    );
    _timeController = TextEditingController(text: recipe.time.toString());
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _ingredientsController.dispose();
    _instructionsController.dispose();
    _timeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit ${widget.recipe.title}'),
        actions: [IconButton(onPressed: _saveRecipe, icon: Icon(Icons.save))],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _field('Title', _titleController),
              _field('Description', _descriptionController, maxLines: 3),
              _field(
                'Ingredients (comma separated)',
                _ingredientsController,
                maxLines: 3,
              ),
              _field(
                'Instructions (one per line)',
                _instructionsController,
                maxLines: 5,
              ),
              _field(
                'Time (minutes)',
                _timeController,
                keyboardType: TextInputType.number,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _field(
    String label,
    TextEditingController controller, {
    int maxLines = 1,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextField(
        controller: controller,
        maxLines: maxLines,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }

  void _saveRecipe() {
    final updatedRecipe = widget.recipe.copyWith(
      title: _titleController.text.trim(),
      description: _descriptionController.text.trim(),
      ingredients: _ingredientsController.text
          .split(',')
          .map((e) => e.trim())
          .where((e) => e.isNotEmpty)
          .toList(),
      instructions: _instructionsController.text
          .split('\n')
          .map((e) => e.trim())
          .where((e) => e.isNotEmpty)
          .toList(),
      time: int.tryParse(_timeController.text) ?? widget.recipe.time,
    );

    context.read<RecipeController>().updateRecipe(updatedRecipe);

    Navigator.pop(context);
  }
}
