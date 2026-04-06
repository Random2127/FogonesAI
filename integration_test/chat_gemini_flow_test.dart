import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fogonesia/features/recipe/widgets/recipe_card.dart';
import 'package:fogonesia/main_integration.dart' as integration_entry;
import 'package:integration_test/integration_test.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() {
    if (Platform.isLinux || Platform.isWindows || Platform.isMacOS) {
      sqfliteFfiInit();
      databaseFactory = databaseFactoryFfi;
    }
  });

  testWidgets('chat: type, send, receive recipe from Gemini', (tester) async {
    await integration_entry.main();
    await tester.pump();
    await tester.pump(const Duration(seconds: 1));

    final field = find.byType(TextField);
    expect(field, findsOneWidget);

    await tester.enterText(field, 'simple pasta with garlic');
    await tester.tap(find.byIcon(Icons.send));
    await tester.pump();

    // Loading uses [CircularProgressIndicator], which never idles — avoid pumpAndSettle.
    final deadline = DateTime.now().add(const Duration(seconds: 120));
    while (DateTime.now().isBefore(deadline)) {
      await tester.pump(const Duration(seconds: 2));
      if (find.byType(RecipeCard).evaluate().isNotEmpty) {
        break;
      }
    }

    expect(find.byType(RecipeCard), findsOneWidget);
  });
}
