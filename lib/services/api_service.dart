import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/quiz.dart';

class ApiService {
  final String _baseUrl = 'https://core.id8devhub.com/api/v1/quizzes/';

  Future<List<Quiz>> fetchQuizzes() async {
    final response = await http.get(Uri.parse(_baseUrl));
    if (response.statusCode == 200) {
      List<dynamic> body = json.decode(response.body);
      return body.map((dynamic item) => Quiz.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load quizzes');
    }
  }
}
