import 'package:fogonesia/core/home_shell.dart';
import 'package:fogonesia/features/auth/auth_providers.dart';
import 'package:fogonesia/features/auth/screens/login_screen.dart';
import 'package:fogonesia/features/auth/screens/register_screen.dart';
import 'package:fogonesia/features/chat/screens/chat_screen.dart';
import 'package:fogonesia/features/dietary/screens/dietary_screen.dart';
import 'package:fogonesia/features/recipe/model/recipe.dart';
import 'package:fogonesia/features/recipe/screens/edit_recipe_screen.dart';
import 'package:fogonesia/features/recipe/screens/recipe_details_screen.dart';
import 'package:fogonesia/features/recipe/screens/recipes_screen.dart';
import 'package:fogonesia/shared/go_router_refresh_stream.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  final auth = ref.watch(firebaseAuthProvider);
  final refresh = GoRouterRefreshStream(auth.authStateChanges());
  ref.onDispose(refresh.dispose);

  return GoRouter(
    // If the user is not authenticated, we want to land on the login page.
    // When auth state changes, `redirect` will keep the UI consistent.
    initialLocation: '/login',
    refreshListenable: refresh,
    redirect: (context, state) {
      final loggedIn = auth.currentUser != null;
      final path = state.matchedLocation;
      final atAuth = path == '/login' || path == '/register';
      // Signed out: force auth pages (login/register).
      if (!loggedIn && !atAuth) {
        return '/login';
      }

      // Signed in: prevent re-visiting auth pages.
      if (loggedIn && atAuth) {
        return '/home';
      }
      return null;
    },
    routes: [
      GoRoute(path: '/home', builder: (context, state) => const HomeShell()),
      GoRoute(path: '/chat', builder: (context, state) => const ChatScreen()),
      GoRoute(path: '/login', builder: (context, state) => const Login()),
      GoRoute(
        path: '/register',
        builder: (context, state) => const Register(),
      ),
      GoRoute(
        path: '/recipes',
        builder: (context, state) => const RecipesScreen(),
      ),
      GoRoute(
        path: '/dietary',
        builder: (context, state) => const DietaryScreen(),
      ),
      GoRoute(
        path: '/recipe/:id',
        builder: (context, state) {
          final id = state.pathParameters['id']!;
          return RecipeDetailsScreen(recipeId: id);
        },
      ),
      GoRoute(
        path: '/editRecipe',
        builder: (context, state) {
          final recipe = state.extra as Recipe;
          return EditRecipeScreen(recipe: recipe);
        },
      ),
    ],
  );
});
