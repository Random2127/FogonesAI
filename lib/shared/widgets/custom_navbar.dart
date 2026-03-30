import 'package:flutter/material.dart';

/// Bottom navigation for [HomeShell] tab switching.
class CustomNavbar extends StatelessWidget {
  const CustomNavbar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  final int currentIndex;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return BottomNavigationBar(
      backgroundColor: scheme.primaryContainer,
      selectedItemColor: scheme.onPrimaryContainer,
      currentIndex: currentIndex,
      onTap: onTap,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chat'),
        BottomNavigationBarItem(icon: Icon(Icons.receipt), label: 'Recipes'),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Dietary Prefs',
        ),
      ],
    );
  }
}
