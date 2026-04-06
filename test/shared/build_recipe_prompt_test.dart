import 'package:flutter_test/flutter_test.dart';
import 'package:fogonesia/features/dietary/model/dietary_options.dart';
import 'package:fogonesia/shared/build_recipe_prompt.dart';

void main() {
  test('prompt includes user text and JSON contract line', () {
    final prompt = buildRecipePrompt(
      userPrompt: 'pasta',
      options: DietaryOptions(),
    );

    expect(prompt.contains('pasta'), isTrue);
    expect(prompt.contains('Return exactly ONE JSON object'), isTrue);
  });
}
