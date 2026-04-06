import 'package:fogonesia/features/auth/auth_providers.dart';
import 'package:fogonesia/shared/app_route_table.dart';
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
    routes: buildFogonesiaRoutes(),
  );
});
