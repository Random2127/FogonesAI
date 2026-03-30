import 'package:flutter/material.dart';
import 'package:fogonesia/features/chat/screens/chat_screen.dart';
import 'package:fogonesia/features/dietary/screens/dietary_screen.dart';
import 'package:fogonesia/features/recipe/screens/recipes_screen.dart';
import 'package:fogonesia/shared/widgets/custom_appbar.dart';
import 'package:fogonesia/shared/widgets/custom_drawer.dart';
import 'package:fogonesia/shared/widgets/custom_navbar.dart';

class HomeShell extends StatefulWidget {
  const HomeShell({super.key});

  @override
  State<HomeShell> createState() => _HomeShellState();
}

class _HomeShellState extends State<HomeShell> {
  int _selectedIndex = 0;
  late final List<Widget> _screens = [
    const ChatScreen(),
    const RecipesScreen(),
    const DietaryScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      drawer: const CustomDrawer(),
      body: IndexedStack(index: _selectedIndex, children: _screens),
      bottomNavigationBar: CustomNavbar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
