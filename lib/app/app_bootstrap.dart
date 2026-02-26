import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fogonesia/core/settings/theme_controller.dart';
import 'package:fogonesia/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppBootStrap extends StatelessWidget {
  final SharedPreferences sharedPrefs;

  const AppBootStrap({super.key, required this.sharedPrefs});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      overrides: [
        sharedPreferencesProvider.overrideWithValue(sharedPrefs),
      ],
      child: MyApp(),
    );
  }
}
