import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fogonesia/core/settings/theme_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

final appConfigControllerProvider =
    NotifierProvider<AppConfigController, bool>(AppConfigController.new);

class AppConfigController extends Notifier<bool> {
  static const _onboardingCompleteKey = 'onboardingComplete';

  SharedPreferences get _prefs => ref.read(sharedPreferencesProvider);

  @override
  bool build() {
    return _prefs.getBool(_onboardingCompleteKey) ?? false;
  }

  Future<void> markOnboardingCompleted() async {
    await _prefs.setBool(_onboardingCompleteKey, true);
    state = true;
  }

  Future<void> resetOnboarding() async {
    await _prefs.setBool(_onboardingCompleteKey, false);
    state = false;
  }
}
