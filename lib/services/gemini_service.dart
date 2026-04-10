import 'dart:convert';
import 'package:fogonesia/key/api.dart';
import 'package:http/http.dart' as http;

class GeminiService {
  static const _model = 'gemini-3-flash-preview';

  Future<Map<String, dynamic>> generateRecipe(String prompt) async {
    // Implementation for calling the Gemini API with the provided prompt
    // and returning the generated recipe as a string.

    final apiKey = Api.apiKey();
    final uri = Uri.parse(
      'https://generativelanguage.googleapis.com/v1beta/models/$_model:generateContent?key=$apiKey',
    );

    final response = await _postWithRetry(
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
    ).timeout(const Duration(seconds: 60));
    if (response.statusCode != 200) {
      throw Exception(
        'Failed to generate recipe (${response.statusCode}): ${response.body}',
      );
    }

    final decoded = jsonDecode(response.body);
    if (decoded is! Map<String, dynamic>) {
      throw Exception('Unexpected Gemini response shape: ${response.body}');
    }

    final candidates = decoded['candidates'];
    if (candidates is! List || candidates.isEmpty) {
      throw Exception('No candidates returned: ${response.body}');
    }

    final candidate0 = candidates.first;
    final content = (candidate0 is Map) ? candidate0['content'] : null;
    final parts = (content is Map) ? content['parts'] : null;
    final part0 = (parts is List && parts.isNotEmpty) ? parts.first : null;
    final textResponse = (part0 is Map) ? part0['text'] : null;

    if (textResponse is! String || textResponse.trim().isEmpty) {
      throw Exception('No text returned: ${response.body}');
    }

    try {
      return jsonDecode(textResponse) as Map<String, dynamic>;
    } catch (e) {
      throw Exception(
        'Model returned non-JSON text. Error: $e. Text: $textResponse',
      );
    }
  }

  Future<http.Response> _postWithRetry(
    Uri uri, {
    required Map<String, String> headers,
    required String body,
  }) async {
    // Retry on transient upstream failures and quota throttling.
    const maxAttempts = 4;
    const retryStatusCodes = {429, 500, 502, 503, 504};

    for (var attempt = 1; attempt <= maxAttempts; attempt++) {
      final response = await http.post(uri, headers: headers, body: body);
      if (!retryStatusCodes.contains(response.statusCode) ||
          attempt == maxAttempts) {
        return response;
      }

      // Exponential backoff: 0.5s, 1s, 2s...
      final backoffMs = 500 * (1 << (attempt - 1));
      await Future<void>.delayed(Duration(milliseconds: backoffMs));
    }

    // Unreachable, but keeps Dart analyzer happy.
    return http.post(uri, headers: headers, body: body);
  }
}
