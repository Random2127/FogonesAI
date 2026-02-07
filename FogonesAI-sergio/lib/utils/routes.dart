import 'package:flutter/material.dart';
import 'package:fogonesia/screens/chat_screen.dart';
import 'package:fogonesia/screens/dietary_screen.dart';
import 'package:fogonesia/screens/home_page.dart';
import 'package:fogonesia/screens/login.dart';
import 'package:fogonesia/screens/recipes_screen.dart';
import 'package:fogonesia/screens/register.dart';
import 'package:fogonesia/screens/splash_screen.dart';

class Routes {
  static const String splash = '/';  //La raíz ahora es el splash
  static const String home = '/home';
  static const String chat = '/chat';
  static const String login = '/login';
  static const String register = '/register';
  static const String recipes = '/recipes';
  static const String dietary = '/dietary';
  
  
  //Estas se manejan en onGenerateRoute por los argumentos, 
  //pero es bueno tener la constante aquí.
  static const String editRecipe = '/editRecipe';
  static const String recipeDetails = '/recipeDetails';

  //Mapa de rutas estáticas
  static Map<String, WidgetBuilder> routes = {
    splash: (context) => const SplashScreen(), 
    home: (context) => const HomePage(),
    chat: (context) => const ChatScreen(),
    login: (context) => const Login(),
    register: (context) => const Register(),
    recipes: (context) => const RecipesScreen(),
    dietary: (context) => const DietaryScreen(),
  };
}
