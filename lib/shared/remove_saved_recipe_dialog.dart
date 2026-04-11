import 'package:flutter/material.dart';

/// Confirmation before removing a recipe from the user’s saved list (destructive).
Future<bool> showRemoveSavedRecipeDialog(BuildContext context) async {
  final result = await showDialog<bool>(
    context: context,
    builder: (ctx) => AlertDialog(
      title: const Text('Remove from saved?'),
      content: const Text(
        'This deletes the recipe from your device. You can save a new one from chat anytime.',
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(ctx).pop(false),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () => Navigator.of(ctx).pop(true),
          style: TextButton.styleFrom(
            foregroundColor: Theme.of(ctx).colorScheme.error,
          ),
          child: const Text('Remove'),
        ),
      ],
    ),
  );
  return result ?? false;
}
