import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fogonesia/features/dietary/controller/dietary_controller.dart';
import 'package:fogonesia/features/dietary/widgets/dietary_tile.dart';

class DietaryScreen extends ConsumerWidget {
  const DietaryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final options = ref.watch(dietaryControllerProvider);
    final dietary = ref.read(dietaryControllerProvider.notifier);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            DietaryTile(
              label: 'vegan',
              value: options.isVegan,
              onChanged: (value) => dietary.updateOption(isVegan: value),
            ),
            DietaryTile(
              label: 'vegetarian',
              value: options.isVegetarian,
              onChanged: (value) => dietary.updateOption(isVegetarian: value),
            ),
            DietaryTile(
              label: 'gluten free',
              value: options.isGlutenFree,
              onChanged: (value) => dietary.updateOption(isGlutenFree: value),
            ),
            DietaryTile(
              label: 'nut allergy',
              value: options.nutAllergy,
              onChanged: (value) => dietary.updateOption(nutAllergy: value),
            ),
            DietaryTile(
              label: 'fish allergy',
              value: options.fishAllergy,
              onChanged: (value) => dietary.updateOption(fishAllergy: value),
            ),
            DietaryTile(
              label: 'shellfish allergy',
              value: options.shellfishAllergy,
              onChanged: (value) =>
                  dietary.updateOption(shellfishAllergy: value),
            ),
            DietaryTile(
              label: 'egg allergy',
              value: options.eggAllergy,
              onChanged: (value) => dietary.updateOption(eggAllergy: value),
            ),
          ],
        ),
      ),
    );
  }
}
