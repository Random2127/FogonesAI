import 'package:flutter/material.dart';
import 'package:fogonesia/controllers/dietary_controller.dart';
import 'package:fogonesia/widgets/components/dietary_tile.dart';
import 'package:provider/provider.dart';

class DietaryScreen extends StatefulWidget {
  const DietaryScreen({super.key});

  @override
  State<DietaryScreen> createState() => _DietaryScreenState();
}

class _DietaryScreenState extends State<DietaryScreen> {
  @override
  Widget build(BuildContext context) {
    final dietary = context.watch<DietaryController>();

    return Scaffold(
      body: Padding(
        padding: EdgeInsetsGeometry.all(16),
        child: ListView(
          children: [
            DietaryTile(
              label: 'vegan',
              value: dietary.options.isVegan,
              onChanged: (value) => dietary.updateOption(isVegan: value),
            ),
            DietaryTile(
              label: 'vegetarian',
              value: dietary.options.isVegetarian,
              onChanged: (value) => dietary.updateOption(isVegetarian: value),
            ),
            DietaryTile(
              label: 'gluten free',
              value: dietary.options.isGlutenFree,
              onChanged: (value) => dietary.updateOption(isGlutenFree: value),
            ),
            DietaryTile(
              label: 'nut allergy',
              value: dietary.options.nutAllergy,
              onChanged: (value) => dietary.updateOption(nutAllergy: value),
            ),
            DietaryTile(
              label: 'fish allergy',
              value: dietary.options.fishAllergy,
              onChanged: (value) => dietary.updateOption(fishAllergy: value),
            ),
            DietaryTile(
              label: 'shellfish allergy',
              value: dietary.options.shellfishAllergy,
              onChanged: (value) =>
                  dietary.updateOption(shellfishAllergy: value),
            ),
            DietaryTile(
              label: 'egg allergy',
              value: dietary.options.eggAllergy,
              onChanged: (value) => dietary.updateOption(eggAllergy: value),
            ),
          ],
        ),
      ),
    );
  }
}
