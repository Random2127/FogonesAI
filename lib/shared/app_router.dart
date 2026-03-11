import 'package:fogonesia/core/home_shell.dart';
import 'package:fogonesia/features/auth/screens/login.dart';
import 'package:fogonesia/features/auth/screens/register.dart';
import 'package:fogonesia/features/chat/screens/chat_screen.dart';
import 'package:fogonesia/features/dietary/screens/dietary_screen.dart';
import 'package:fogonesia/features/recipe/model/recipe.dart';
import 'package:fogonesia/features/recipe/screens/edit_recipe_screen.dart';
import 'package:fogonesia/features/recipe/screens/recipe_details_screen.dart';
import 'package:fogonesia/features/recipe/screens/recipes_screen.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/home',
    routes: [
      GoRoute(path: '/home', builder: (context, state) => const HomeShell()),

      GoRoute(path: '/chat', builder: (context, state) => const ChatScreen()),

      GoRoute(path: '/login', builder: (context, state) => const Login()),

      GoRoute(path: '/register', builder: (context, state) => const Register()),

      GoRoute(
        path: '/recipes',
        builder: (context, state) => const RecipesScreen(),
      ),

      GoRoute(
        path: '/dietary',
        builder: (context, state) => const DietaryScreen(),
      ),

      // 🔥 RECIPE DETAILS WITH PARAM
      GoRoute(
        path: '/recipe/:title',
        builder: (context, state) {
          final title = state.pathParameters['title']!;
          return RecipeDetailsScreen(recipeTitle: title);
        },
      ),

      // 🔥 EDIT RECIPE (object via extra)
      GoRoute(
        path: '/editRecipe',
        builder: (context, state) {
          final recipe = state.extra as Recipe;
          return EditRecipeScreen(recipe: recipe);
        },
      ),
    ],
  );
}
