import 'dart:convert';
import 'package:fogonesia/key/api.dart';
import 'package:http/http.dart' as http;

class GeminiService {
  static const _model = 'gemini-2.5-flash';

  Future<Map<String, dynamic>> generateRecipe(String prompt) async {
    // Implementation for calling the Gemini API with the provided prompt
    // and returning the generated recipe as a string.

    // old code for dotenv usage
    // final apiKey = dotenv.env['GEMINI_API_KEY'];
    // if (apiKey == null) {
    //  throw Exception('GEMINI_API_KEY not found');
    // }

    final apiKey = Api.apiKey();
    final uri = Uri.parse(
      'https://generativelanguage.googleapis.com/v1beta/models/$_model:generateContent?key=$apiKey',
    );

    final response = await http.post(
      uri,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        "contents": [
          {
            "parts": [
              {"text": prompt},
            ],
          },
        ],
      }),
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to generate recipe: ${response.body}');
    }

    final decoded = jsonDecode(response.body);
    final textResponse =
        decoded['candidates'][0]['content']['parts'][0]['text'];
    return jsonDecode(textResponse) as Map<String, dynamic>;
  }
}
