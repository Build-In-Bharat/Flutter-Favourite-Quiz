import 'package:favorite_quiz/services/api_service.dart'; // Import your ApiService or relevant service

class QuizRepository {
  final ApiService apiService;

  QuizRepository({required this.apiService});

  Future<List<Map<String, dynamic>>> fetchQuizzes() async {
    try {
      // Use apiService to fetch quizzes
      return await apiService.fetchQuizzes();
    } catch (e) {
      // Handle any errors that occur during fetching
      throw Exception('Failed to fetch quizzes: $e');
    }
  }

  // Other methods related to quiz repository can be added here
}
