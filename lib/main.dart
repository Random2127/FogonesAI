import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fogonesia/app/app_bootstrap.dart';
import 'package:fogonesia/core/settings/theme_controller.dart';
import 'package:fogonesia/core/theme/app_theme.dart' as app_theme;
import 'package:fogonesia/shared/app_router.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await dotenv.load(fileName: '.env');
  } catch (_) {
    // .env is optional; GOOGLE_WEB_CLIENT_ID may be omitted if google-services.json has oauth clients.
  }
  await Firebase.initializeApp();

  final webClientId = dotenv.env['GOOGLE_WEB_CLIENT_ID']?.trim();
  await GoogleSignIn.instance.initialize(
    serverClientId:
        (webClientId != null && webClientId.isNotEmpty) ? webClientId : null,
  );

  final sharedPrefs = await SharedPreferences.getInstance();

  runApp(AppBootStrap(sharedPrefs: sharedPrefs));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeControllerProvider);
    final router = ref.watch(appRouterProvider);
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: app_theme.lightMode,
      darkTheme: app_theme.darkMode,
      themeMode: themeMode,
      routerConfig: router,
    );
  }
}
