import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = 'https://core.id8devhub.com/api/v1/quizzes/';

  Future<List<Map<String, dynamic>>> fetchQuizzes() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      List<dynamic> body = json.decode(response.body);
      return body.cast<Map<String, dynamic>>();
    } else {
      throw Exception('Failed to load quizzes');
    }
  }
}
