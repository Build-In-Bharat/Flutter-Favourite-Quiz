import 'package:quiz_app/models/quiz.dart';
import 'package:quiz_app/services/api_service.dart';

class QuizRepository {
  final ApiService _apiService = ApiService();

  Future<List<Quiz>> fetchQuizzes() async {
    final response = await _apiService.getQuizzes();
    return response.map((quiz) => Quiz.fromJson(quiz)).toList();
  }
}
