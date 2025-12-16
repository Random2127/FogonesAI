import 'package:flutter/material.dart';
import 'package:fogonesia/screens/home_page.dart';
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
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
      ),
      home: HomePage(),
    );
  }
}
