import 'package:flutter/material.dart';
import 'package:fogonesia/controllers/theme_controller.dart';
import 'package:fogonesia/theme/app_theme.dart' as AppTheme;
import 'package:fogonesia/utils/routes.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fogonesia/app/app_bootstrap.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final sharedPrefs = await SharedPreferences.getInstance();

  runApp(AppBootStrap(sharedPrefs: sharedPrefs));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.watch<ThemeController>();
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.lightMode,
      darkTheme: AppTheme.darkMode,
      themeMode: theme.themeMode,
      initialRoute: Routes.home,
      //home: HomePage(),
    );
  }
}
