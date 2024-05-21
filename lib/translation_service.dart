import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>> fetchWordDetails(String word) async {
  final response = await http.get(
    Uri.parse('https://api.dictionaryapi.dev/api/v2/entries/en/word'),
  );

  if (response.statusCode == 200) {
    return json.decode(response.body)[0];
  } else {
    throw Exception('Failed to fetch word details: ${response.statusCode}');
  }
}

Future<String> translateToTurkish(String text) async {
  final response = await http.post(
    Uri.parse('https://libretranslate.de/translate'),
    headers: {'Content-Type': 'application/json'},
    body: json.encode({
      'q': text,
      'source': 'en',
      'target': 'tr',
    }),
  );

  if (response.statusCode == 200) {
    final responseBody = json.decode(response.body);
    return responseBody['translatedText'];
  } else {
    throw Exception('Failed to translate text: ${response.statusCode}');
  }
}