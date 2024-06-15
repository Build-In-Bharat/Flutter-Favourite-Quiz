import '../models/quiz.dart';
import '../services/api_service.dart';

class QuizRepository {
  final ApiService apiService;

  QuizRepository({required this.apiService});

  Future<List<Quiz>> getQuizzes() async {
    try {
      final response = await apiService.fetchQuizzes();
      return response.map<Quiz>((quizJson) => Quiz.fromJson(quizJson)).toList();
    } catch (e) {
      print("Error in QuizRepository getQuizzes: $e");
      throw e;
    }
  }
}
