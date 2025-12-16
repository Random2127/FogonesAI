import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppConfigProvider extends ChangeNotifier {
  final SharedPreferences _prefs;

  AppConfigProvider(this._prefs);
  // This would allow to control what should happen in the first run (Language, permissions,tutorial, etc.) Onboarding
  // --- Keys ---
  static const _firstRunKey = 'is_first_run';
  // Null-aware operator true if the key does not exist
  bool get isFirstRun => _prefs.getBool(_firstRunKey) ?? true;

  void markFirstRunComplete() {
    _prefs.setBool(_firstRunKey, false);
    notifyListeners();
  }
}
