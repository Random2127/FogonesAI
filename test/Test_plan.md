



## Test 1: Prompt Builder
```dart
void main() {
  test('Prompt should include user input', () {
    final prompt = buildPrompt("pasta", []);

    expect(prompt.contains("pasta"), true);
    expect(prompt.contains("Return exactly ONE JSON object"), true);
  });
}
```

## Test 2: JSON Parsing
```dart
void main() {
  test('Valid JSON should parse into Recipe', () {
    final json = {
      "title": "Pasta",
      "description": "Tasty",
      "time": 30,
      "servings": 2,
      "cuisine": "Italian",
      "ingredients": ["pasta"],
      "instructions": ["boil water"]
    };

    final recipe = Recipe.fromJson(json);

    expect(recipe.title, "Pasta");
    expect(recipe.ingredients.length, 1);
  });
}
```

## Test 3: Invalid JSON Handling
```dart
void main() {
  test('Invalid JSON should throw error', () {
    final invalidJson = {"title": "Missing fields"};

    expect(() => Recipe.fromJson(invalidJson), throwsException);
  });
}
```

## E2E Test
```dart
testWidgets('Full recipe flow works', (tester) async {
  await tester.pumpWidget(MyApp());

  // Enter text
  await tester.enterText(find.byType(TextField), 'vegan pasta');

  // Tap button
  await tester.tap(find.byType(ElevatedButton));
  await tester.pumpAndSettle();

  // Verify result appears
  expect(find.textContaining('pasta'), findsWidgets);
});

```