import 'package:flutter/material.dart';
import 'package:fogonesia/controllers/recipe_controller.dart';
import 'package:fogonesia/models/recipe.dart';
import 'package:provider/provider.dart';

class RecipeCard extends StatelessWidget {
  final Recipe recipe;
  const RecipeCard({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    final recipeController = context.watch<RecipeController>();
    final isFavourite = recipeController.isFavourite(recipe);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.blueGrey,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.purple),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Row: Title + Time Chip
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      recipe.title,
                      style: Theme.of(context).textTheme.headlineSmall
                          ?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                    ),
                  ),
                  _buildTimeChip(context, recipe.time),
                ],
              ),
              const SizedBox(height: 12),

              // Description
              Text(
                recipe.description,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  height: 1.4,
                ),
              ),

              const Divider(height: 32, color: Colors.white24),

              // Ingredients
              _buildSectionTitle(context, Icons.restaurant_menu, 'Ingredients'),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: recipe.ingredients.map(_buildIngredientTag).toList(),
              ),

              const SizedBox(height: 24),

              // Instructions
              _buildSectionTitle(
                context,
                Icons.format_list_numbered,
                'Instructions',
              ),
              const SizedBox(height: 12),
              ...recipe.instructions.asMap().entries.map(
                (entry) => _buildInstructionStep(entry.key + 1, entry.value),
              ),

              // Favourite Button
              Align(
                alignment: Alignment.centerRight,
                child: FloatingActionButton(
                  mini: true,
                  onPressed: () => recipeController.toggleFavourite(recipe),
                  child: Icon(
                    isFavourite ? Icons.favorite : Icons.favorite_border,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTimeChip(BuildContext context, int time) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.orangeAccent,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          const Icon(Icons.timer_outlined, size: 16, color: Colors.white),
          const SizedBox(width: 4),
          Text(
            '$time mins',
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, IconData icon, String title) {
    return Row(
      children: [
        Icon(icon, size: 18, color: Colors.orangeAccent),
        const SizedBox(width: 8),
        Text(
          title.toUpperCase(),
          style: const TextStyle(
            color: Colors.orangeAccent,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
            fontSize: 13,
          ),
        ),
      ],
    );
  }

  Widget _buildIngredientTag(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 13,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildInstructionStep(int number, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 10,
            backgroundColor: Colors.white24,
            child: Text(
              number.toString(),
              style: const TextStyle(fontSize: 10, color: Colors.white),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
