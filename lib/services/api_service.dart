import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/article_model.dart';

class ApiService {
  final endPointUrl = "newsapi.org";
  final client = http.Client();

  Future<List<Article>> getArticle() async {
    const apiKey = '7b0e0ffb6f2e4c869e2e665973e473ae'; // Replace with your actual key
    final queryParameters = {
      'country': 'us',
      'category': 'technology',
      'apiKey': apiKey,
    };

    try {
      final uri = Uri.https(endPointUrl, '/v2/top-headlines', queryParameters);
      final response = await client.get(uri);

      if (response.statusCode == 200) {
        print("API success: ${response.statusCode}");
        final json = jsonDecode(response.body) as Map<String, dynamic>;
        print("JSON Response: $json");
        final List<dynamic> body = json['articles'];
        return body.map((item) => Article.fromJson(item)).toList();
      } else if (response.statusCode == 401) {
        print("API Error 401: Unauthorized. Check your API key.");
        throw Exception("Invalid API key or unauthorized access.");
      } else {
        print("API Error: ${response.statusCode}");
        throw Exception("Failed to load articles: ${response.statusCode}");
      }
    } catch (e) {
      print("Network error: $e");
      throw Exception("Failed to fetch data: $e");
    }
  }
}
