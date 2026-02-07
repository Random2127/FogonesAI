import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppConfigController extends ChangeNotifier {
  final SharedPreferences _prefs;

  AppConfigController(this._prefs);
  // This would allow to control what should happen in the first run (Language, permissions,tutorial, etc.) Onboarding
  // --- Keys ---
  static const _onboardingCompleteKey = 'onboardingComplete';
  // Null-aware operator true if the key does not exist
  bool get onboardingComplete => _prefs.getBool(_onboardingCompleteKey) ?? true;

  void markonboardingCompletee() {
    _prefs.setBool(_onboardingCompleteKey, false);
    notifyListeners();
  }
}
