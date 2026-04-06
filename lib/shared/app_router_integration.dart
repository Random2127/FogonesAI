import 'package:fogonesia/shared/app_route_table.dart';
import 'package:go_router/go_router.dart';

/// Router without Firebase auth: no redirect, starts on chat for integration tests.
GoRouter createIntegrationTestGoRouter() {
  return GoRouter(
    initialLocation: '/chat',
    routes: buildFogonesiaRoutes(),
  );
}
