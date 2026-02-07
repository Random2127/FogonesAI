import 'package:flutter/material.dart';

final ThemeData darkMode = ThemeData(
  useMaterial3: true, //Corregido
  brightness: Brightness.dark,
  fontFamily: 'Poppins',
  scaffoldBackgroundColor: const Color(0xFF1F1A16),
  colorScheme: const ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xFFD8A373), 
    onPrimary: Color(0xFF2B2520),
    secondary: Color(0xFF9C8A72), 
    onSecondary: Color(0xFF2B2520),
    error: Color(0xFFE07A7A),
    onError: Colors.black,
    surface: Color(0xFF2B2520),
    onSurface: Color(0xFFE8DED4),
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFF1F1A16),
    foregroundColor: Color(0xFFE8DED4),
    elevation: 0,
  ),
);

final ThemeData lightMode = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  fontFamily: 'Poppins',
  scaffoldBackgroundColor: const Color(0xFFFAF7F2),
  colorScheme: const ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xFFC97A4A), 
    onPrimary: Colors.white,
    secondary: Color(0xFFB8A58D), 
    onSecondary: Color(0xFF3A2E28),
    error: Color(0xFFB94A48),
    onError: Colors.white,
    surface: Color(0xFFFFFFFF),
    onSurface: Color(0xFF3A2E28),
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFFFAF7F2),
    foregroundColor: Color(0xFF3A2E28),
    elevation: 0,
  ),
);