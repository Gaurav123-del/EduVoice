import 'dart:convert';
import 'package:http/http.dart' as http;

class GeminiService {
  static const String apiKey = "AIzaSyA9lpirw4oVkkuJpR01YzoDerWaFghcZ9E";

  static Future<String> sendMessage(String message) async {
    final url = Uri.parse(
  "https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash:generateContent?key=$apiKey",
);

    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "contents": [
          {
            "parts": [
              {"text": message}
            ]
          }
        ]
      }),
    );

    final data = jsonDecode(response.body);

    return data["candidates"][0]["content"]["parts"][0]["text"];
  }
}
