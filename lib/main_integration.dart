import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fogonesia/core/settings/theme_controller.dart';
import 'package:fogonesia/main.dart';
import 'package:fogonesia/shared/app_router.dart';
import 'package:fogonesia/shared/app_router_integration.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Entry point for integration tests: skips Firebase and Google Sign-In; uses
/// [createIntegrationTestGoRouter] so routes work while signed out.
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await dotenv.load(fileName: '.env');
  } catch (_) {
    // Optional for local runs.
  }

  final sharedPrefs = await SharedPreferences.getInstance();

  runApp(
    ProviderScope(
      overrides: [
        sharedPreferencesProvider.overrideWithValue(sharedPrefs),
        appRouterProvider.overrideWith(
          (ref) => createIntegrationTestGoRouter(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}
