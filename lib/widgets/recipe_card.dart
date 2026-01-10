import 'package:flutter/material.dart';
import 'package:fogonesia/models/recipe.dart';
import 'package:fogonesia/services/db_service.dart';

class RecipeCard extends StatefulWidget {
  final Recipe recipe;
  const RecipeCard({super.key, required this.recipe});

  @override
  State<RecipeCard> createState() => _RecipeCardState();
}

class _RecipeCardState extends State<RecipeCard> {
  bool isFavourite = false;

  @override
  void initState() {
    super.initState();
    _loadFavourites();
  }

  Future<void> _loadFavourites() async {
    final favourites = await DatabaseService.isFavourite(widget.recipe.title);
    setState(() => isFavourite = favourites);
  }

  Future<void> _toggleFavourite() async {
    if (isFavourite) {
      await DatabaseService.deleteFavourite(widget.recipe.title);
    } else {
      await DatabaseService.insertFavourite(widget.recipe);
    }

    setState(() => isFavourite = !isFavourite);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        // Semi-transparent background for that "glass" effect
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
                      widget.recipe.title,
                      style: Theme.of(context).textTheme.headlineSmall
                          ?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                    ),
                  ),
                  _buildTimeChip(context, widget.recipe.time),
                ],
              ),
              const SizedBox(height: 12),

              // Description
              Text(
                widget.recipe.description,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  height: 1.4,
                ),
              ),

              const Divider(height: 32, color: Colors.white24),

              // Ingredients Section
              _buildSectionTitle(context, Icons.restaurant_menu, 'Ingredients'),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: widget.recipe.ingredients
                    .map((ing) => _buildIngredientTag(ing))
                    .toList(),
              ),

              const SizedBox(height: 24),

              // Instructions Section
              _buildSectionTitle(
                context,
                Icons.format_list_numbered,
                'Instructions',
              ),
              const SizedBox(height: 12),
              ...widget.recipe.instructions.asMap().entries.map(
                (entry) => _buildInstructionStep(entry.key + 1, entry.value),
              ),

              Align(
                alignment: Alignment.centerRight,
                child: FloatingActionButton(
                  mini: true,
                  onPressed: _toggleFavourite,
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

  // Helper Widget for the Time Badge
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

  // Helper Widget for Section Headers
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

  // Helper for Ingredient Tags
  Widget _buildIngredientTag(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),

      child: Row(
        children: [
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 13,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Helper for Instruction Steps
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
