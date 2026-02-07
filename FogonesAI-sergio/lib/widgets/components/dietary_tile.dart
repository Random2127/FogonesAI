import 'package:flutter/material.dart';

class DietaryTile extends StatelessWidget {
  final String label;
  final bool value;
  final ValueChanged<bool?>? onChanged;

  const DietaryTile({
    super.key,
    required this.label,
    required this.value,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        title: Text(label, style: TextStyle(fontSize: 18.0)),

        trailing: Switch(value: value, onChanged: onChanged),
      ),
    );
  }
}
