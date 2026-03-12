import 'package:flutter/material.dart';

class AppColours {
  // LIGHT THEME
  static const Color primaryLight = Color(0xFFEB8407);
  static const Color secondaryLight = Color(0xFFE07A3F);
  static const Color accentLight = Color(0xFFC94C4C);
  static const Color backgroundLight = Color(0xFFF6F1EB);
  static const Color surfaceLight = Color(0xFFFAEBD7);
  static const Color textPrimaryLight = Color(0xFF411900);
  static const Color textSecondaryLight = Color(0xFF2E2A26);

  // DARK THEME
  static const Color primaryDark = Color(0xF6DF8837);
  static const Color secondaryDark = Color(0xFFCC5500);
  static const Color accentDark = Color(0xFFA52A2A);
  static const Color backgroundDark = Color(0xFF1B2A3E);
  static const Color surfaceDark = Color(0xE4CC5500);
  static const Color textPrimaryDark = Color(0xFFE8EEF5);
  static const Color textSecondaryDark = Color(0xFFF6F1EB);
}

final ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  fontFamily: 'Inter',
  scaffoldBackgroundColor: AppColours.backgroundLight,

  colorScheme: const ColorScheme(
    brightness: Brightness.light,
    primary: AppColours.primaryLight,
    onPrimary: Colors.white,
    secondary: AppColours.secondaryLight,
    onSecondary: Colors.white,
    error: AppColours.accentLight,
    onError: Colors.white,
    surface: AppColours.surfaceLight,
    onSurface: AppColours.textPrimaryLight,
  ),

  appBarTheme: const AppBarTheme(
    backgroundColor: AppColours.backgroundLight,
    foregroundColor: AppColours.textPrimaryLight,
    elevation: 0,
    centerTitle: true,

    titleTextStyle: TextStyle(
      fontFamily: 'PlayfairDisplay', 
      fontSize: 22,
      fontWeight: FontWeight.bold,
      color: AppColours.textPrimaryLight,
    ),
  ),
  
  textTheme: const TextTheme(
    displayLarge: TextStyle(fontFamily: 'PlayfairDisplay', fontWeight: FontWeight.bold),
    bodyLarge: TextStyle(color: AppColours.textPrimaryLight),
    bodyMedium: TextStyle(color: AppColours.textSecondaryLight),
  ),

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColours.primaryLight,
      foregroundColor: Colors.white,
      textStyle: const TextStyle(fontWeight: FontWeight.w600),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
   ),
  ),

);

final ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  fontFamily: 'Inter',
  scaffoldBackgroundColor: AppColours.backgroundDark,

  colorScheme: const ColorScheme(
    brightness: Brightness.dark,
    primary: AppColours.primaryDark,
    onPrimary: Colors.white,
    secondary: AppColours.secondaryDark,
    onSecondary: Colors.white,
    error: AppColours.accentDark,
    onError: Colors.white,
    surface: AppColours.surfaceDark,
    onSurface: AppColours.textPrimaryDark,
  ),

  appBarTheme: const AppBarTheme(
    backgroundColor: AppColours.backgroundDark,
    foregroundColor: AppColours.textPrimaryDark,
    elevation: 0,
    centerTitle: true,

    titleTextStyle: TextStyle(
      fontFamily: 'PlayfairDisplay', 
      fontSize: 22,
      fontWeight: FontWeight.bold,
      color: AppColours.textPrimaryDark,
    ),
  ),

  textTheme: const TextTheme(
    displayLarge: TextStyle(fontFamily: 'PlayfairDisplay', fontWeight: FontWeight.bold),
    bodyLarge: TextStyle(color: AppColours.textPrimaryDark),
    bodyMedium: TextStyle(color: AppColours.textSecondaryDark),
  ),

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColours.primaryDark,
      foregroundColor: Colors.white,
      textStyle: const TextStyle(fontWeight: FontWeight.w600),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
    ),
  ),
);