import 'package:flutter_test/flutter_test.dart';
import 'package:fogonesia/features/recipe/model/recipe.dart';

void main() {
  test('valid map parses into Recipe', () {
    final json = <String, dynamic>{
      'title': 'Pasta',
      'description': 'Tasty',
      'time': 30,
      'ingredients': <String>['pasta'],
      'instructions': <String>['boil water'],
    };

    final recipe = Recipe.fromJson(json);

    expect(recipe.title, 'Pasta');
    expect(recipe.ingredients.length, 1);
    expect(recipe.description, 'Tasty');
    expect(recipe.time, 30);
  });

  test('missing required fields does not produce a valid Recipe', () {
    final invalidJson = <String, dynamic>{'title': 'Missing fields'};

    expect(() => Recipe.fromJson(invalidJson), throwsA(isA<TypeError>()));
  });
}
