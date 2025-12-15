import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppConfigProvider extends ChangeNotifier {
  final SharedPreferences _prefs;

  AppConfigProvider(this._prefs);

  // --- Keys ---
  static const _firstRunKey = 'is_first_run';

  // --- Values ---
  bool get isFirstRun => _prefs.getBool(_firstRunKey) ?? true;

  void markFirstRunComplete() {
    _prefs.setBool(_firstRunKey, false);
    notifyListeners();
  }
}
