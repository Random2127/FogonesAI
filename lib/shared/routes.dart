import 'package:flutter/material.dart';
import 'package:fogonesia/core/home_page.dart';
import 'package:fogonesia/features/auth/screens/login.dart';
import 'package:fogonesia/features/auth/screens/register.dart';
import 'package:fogonesia/features/chat/screens/chat_screen.dart';
import 'package:fogonesia/features/dietary/screens/dietary_screen.dart';
import 'package:fogonesia/features/recipe/screens/recipes_screen.dart';

class Routes {
  static const String home = '/home';
  static const String chat = '/chat';
  static const String login = '/login';
  static const String register = '/register';
  static const String recipes = '/recipes';
  static const String dietary = '/dietary';
  static const String editRecipe = '/editRecipe';
  static const String recipeDetails = '/recipeDetails';

  static Map<String, WidgetBuilder> routes = {
    home: (context) => const HomePage(),
    chat: (context) => const ChatScreen(),
    login: (context) => const Login(),
    register: (context) => const Register(),
    recipes: (context) => const RecipesScreen(),
    dietary: (context) => const DietaryScreen(),
  };
}
