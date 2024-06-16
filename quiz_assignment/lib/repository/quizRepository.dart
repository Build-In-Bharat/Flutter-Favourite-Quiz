import 'dart:convert';
import 'package:http/http.dart' as http;
import '../constants/strings.dart';
import '../models/quizModel.dart';

class QuizRepository {
  final String quizEndPoint = BaseUrl+"quizzes";

  Future<List<Quiz>> fetchQuizzes() async {
    print("API CALLED");

    final response = await http.get(Uri.parse(quizEndPoint));
    if (response.statusCode == 200) {print(response.body);
      List<dynamic> data = jsonDecode(response.body);
      List<Quiz> quizzes = data.map((quizJson) => Quiz.fromJson(quizJson)).toList();
      return quizzes;
    }  else if (response.statusCode == 404) {
      throw Exception('404 Not Found');
    } else if (response.statusCode == 401) {
      throw Exception('401 Unauthorized');
    } else if (response.statusCode == 403) {
      throw Exception('403 Forbidden');
    } else if (response.statusCode == 500) {
      throw Exception('500 Internal Server Error');
    } else {
      throw Exception('Failed to load quizzes. Status Code: ${response.statusCode}');
    }
  }
}
