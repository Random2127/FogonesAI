import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeController extends ChangeNotifier {
  final SharedPreferences _prefs;

  ThemeController(this._prefs);

  static const _themeKey = 'theme_mode';

  ThemeMode get themeMode {
    final value = _prefs.getString(_themeKey);
    return ThemeMode.values.firstWhere(
      (e) => e.name == value,
      orElse: () => ThemeMode.system,
    );
  }

  void setThemeMode(ThemeMode mode) {
    _prefs.setString(_themeKey, mode.name);
    notifyListeners();
  }
}
