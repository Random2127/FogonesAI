import 'package:flutter/material.dart';
import 'package:fogonesia/controllers/chat_controller.dart';
import 'package:fogonesia/controllers/dietary_controller.dart';
import 'package:fogonesia/controllers/theme_controller.dart';
import 'package:fogonesia/main.dart';
import 'package:fogonesia/controllers/app_config_controller.dart';
import 'package:fogonesia/services/gemini_service.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppBootStrap extends StatelessWidget {
  final SharedPreferences sharedPrefs;

  const AppBootStrap({super.key, required this.sharedPrefs});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<SharedPreferences>.value(value: sharedPrefs),
        ChangeNotifierProvider(create: (_) => AppConfigController(sharedPrefs)),
        ChangeNotifierProvider(create: (_) => ThemeController(sharedPrefs)),
        ChangeNotifierProvider(create: (_) => ChatController(GeminiService())),
        ChangeNotifierProvider(create: (_) => DietaryController(sharedPrefs)),

        // Add other providers here as needed
      ],
      child: MyApp(),
    );
  }
}
