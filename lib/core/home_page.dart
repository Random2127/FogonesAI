import 'package:flutter/material.dart';
import 'package:fogonesia/features/chat/screens/chat_screen.dart';
import 'package:fogonesia/features/dietary/screens/dietary_screen.dart';
import 'package:fogonesia/features/recipe/screens/recipes_screen.dart';
import 'package:fogonesia/shared/widgets/custom_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  late final List<Widget> _screens = [
    const ChatScreen(),
    const RecipesScreen(),
    const DietaryScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FogonesIA'),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      drawer: const CustomDrawer(),
      body: IndexedStack(index: _selectedIndex, children: _screens),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        selectedItemColor: Theme.of(context).colorScheme.onPrimaryContainer,
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chat'),
          BottomNavigationBarItem(icon: Icon(Icons.receipt), label: 'Recipes'),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Dietary Prefs',
          ),
        ],
      ),
    );
  }
}
