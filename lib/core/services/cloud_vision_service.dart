import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

class CloudVisionService {
  Future<List<String>> detectLogosWithCloudVision(String imagePath, String apiKey) async {
    final bytes = await File(imagePath).readAsBytes();
    final base64Image = base64Encode(bytes);

    final url = 'https://vision.googleapis.com/v1/images:annotate?key=$apiKey';
    final body = jsonEncode({
      "requests": [
        {
          "image": {"content": base64Image},
          "features": [
            {"type": "LOGO_DETECTION", "maxResults": 5}
          ]
        }
      ]
    });

    final response = await http.post(
      Uri.parse(url),
      headers: {"Content-Type": "application/json"},
      body: body,
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final logos = data['responses'][0]['logoAnnotations'] as List<dynamic>?;
      if (logos != null) {
        return logos.map((logo) => logo['description'] as String).toList();
      }
    }
    return [];
  }
}

// NOTE: Ensure 'http' is in your pubspec.yaml dependencies. 