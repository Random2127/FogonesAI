import 'package:flutter/material.dart';
import 'package:fogonesia/main.dart';
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
        // Add other providers here as needed
      ],
      child: MyApp(),
    );
  }
}
