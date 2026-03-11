import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fogonesia/app/app_bootstrap.dart';
import 'package:fogonesia/core/settings/theme_controller.dart';
import 'package:fogonesia/core/theme/app_theme.dart' as app_theme;
import 'package:fogonesia/shared/app_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final sharedPrefs = await SharedPreferences.getInstance();

  runApp(AppBootStrap(sharedPrefs: sharedPrefs));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeControllerProvider);
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: app_theme.lightMode,
      darkTheme: app_theme.darkMode,
      themeMode: themeMode,
      routerConfig: AppRouter.router,
    );
  }
}
