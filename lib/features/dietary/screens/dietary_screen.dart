import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fogonesia/features/dietary/controller/dietary_controller.dart';
import 'package:fogonesia/features/dietary/widgets/dietary_tile.dart';

class DietaryScreen extends ConsumerWidget {
  const DietaryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncOpts = ref.watch(dietaryControllerProvider);
    final dietary = ref.read(dietaryControllerProvider.notifier);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: asyncOpts.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (e, _) => Center(child: Text('Error: $e')),
          data: (options) {
            return ListView(
              children: [
                DietaryTile(
                  label: 'Dairy Free',
                  value: options.isDairyFree,
                  onChanged: (value) => dietary.updateOption(isDairyFree: value),
                ),
                DietaryTile(
                  label: 'Egg Allergy',
                  value: options.eggAllergy,
                  onChanged: (value) => dietary.updateOption(eggAllergy: value),
                ),
                DietaryTile(
                  label: 'Fish Allergy',
                  value: options.fishAllergy,
                  onChanged: (value) => dietary.updateOption(fishAllergy: value),
                ),
                DietaryTile(
                  label: 'Gluten Free',
                  value: options.isGlutenFree,
                  onChanged: (value) =>
                      dietary.updateOption(isGlutenFree: value),
                ),
                DietaryTile(
                  label: 'Nut Allergy',
                  value: options.nutAllergy,
                  onChanged: (value) => dietary.updateOption(nutAllergy: value),
                ),
                DietaryTile(
                  label: 'Shellfish Allergy',
                  value: options.shellfishAllergy,
                  onChanged: (value) =>
                      dietary.updateOption(shellfishAllergy: value),
                ),
                DietaryTile(
                  label: 'Vegan',
                  value: options.isVegan,
                  onChanged: (value) => dietary.updateOption(isVegan: value),
                ),
                DietaryTile(
                  label: 'Vegetarian',
                  value: options.isVegetarian,
                  onChanged: (value) =>
                      dietary.updateOption(isVegetarian: value),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
