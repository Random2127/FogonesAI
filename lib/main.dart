import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:fogonesia/controllers/theme_controller.dart';
import 'package:fogonesia/models/recipe.dart';
import 'package:fogonesia/screens/edit_recipe_screen.dart';
import 'package:fogonesia/screens/recipe_details_screen.dart';
import 'package:fogonesia/screens/splash_screen.dart'; 
import 'package:fogonesia/screens/home_page.dart';
import 'package:fogonesia/theme/app_theme.dart' as app_theme;
import 'package:fogonesia/utils/routes.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fogonesia/app/app_bootstrap.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  final sharedPrefs = await SharedPreferences.getInstance();

  runApp(AppBootStrap(sharedPrefs: sharedPrefs));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.watch<ThemeController>();
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: app_theme.lightMode,
      darkTheme: app_theme.darkMode,
      themeMode: theme.themeMode,
      
      initialRoute: Routes.splash, 

      onGenerateRoute: (settings) {
        switch (settings.name) {
          case Routes.splash:
            return MaterialPageRoute(builder: (_) => const SplashScreen());
          
          case Routes.home:
            return MaterialPageRoute(builder: (_) => const HomePage());

          case Routes.recipeDetails:
            if (settings.arguments is String) {
              final title = settings.arguments as String;
              return MaterialPageRoute(
                builder: (_) => RecipeDetailsScreen(recipeTitle: title),
              );
            }
            return null;

          case Routes.editRecipe:
            if (settings.arguments is Recipe) {
              final recipe = settings.arguments as Recipe;
              return MaterialPageRoute(
                builder: (_) => EditRecipeScreen(recipe: recipe),
              );
            }
            return null;
            
          default:
            // Si la ruta no existe, mandamos al Home para evitar la "X"
            return MaterialPageRoute(builder: (_) => const HomePage());
        }
      },
    );
  
  }
}