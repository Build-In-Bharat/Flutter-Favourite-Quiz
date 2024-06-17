import '../models/quiz.dart';
import '../services/api_service.dart';

class QuizRepository {
  final ApiService apiService;

  QuizRepository({required this.apiService});

  Future<List<Quiz>> getQuizzes() async {
    return await apiService.fetchQuizzes();
  }
}
