import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppConfigController extends ChangeNotifier {
  final SharedPreferences _prefs;

  AppConfigController(this._prefs);

  static const _onboardingCompleteKey = 'onboardingComplete';

  bool get onboardingComplete =>
      _prefs.getBool(_onboardingCompleteKey) ?? false;

  Future<void> markOnboardingCompleted() async {
    await _prefs.setBool(_onboardingCompleteKey, true);
    notifyListeners();
  }

  // Helper to reset if you want to test the flow again
  Future<void> resetOnboarding() async {
    await _prefs.setBool(_onboardingCompleteKey, false);
    notifyListeners();
  }
}
