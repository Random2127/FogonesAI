import 'package:flutter/material.dart';

/// App bar used by [HomeShell] and other main scaffolds.
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return AppBar(
      title: Text(
        'FogonesIA',
        style: TextStyle(
          color: scheme.onPrimaryContainer,
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: scheme.primaryContainer,
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
