import 'package:flutter/material.dart';
import '../repositories/quiz_repository.dart';

class QuizProvider with ChangeNotifier {
  final QuizRepository quizRepository;
  List<Map<String, dynamic>> _quizzes = [];
  final List<Map<String, dynamic>> _favorites = [];
  int _currentQuestionIndex = 0;

  QuizProvider({required this.quizRepository}) {
    fetchQuizzes();
  }

  List<Map<String, dynamic>> get quizzes => _quizzes;
  List<Map<String, dynamic>> get favorites => _favorites;
  int get currentQuestionIndex => _currentQuestionIndex;

  Future<void> fetchQuizzes() async {
    _quizzes = await quizRepository.fetchQuizzes();
    notifyListeners();
  }

  void nextQuestion() {
    if (_currentQuestionIndex < _quizzes.length - 1) {
      _currentQuestionIndex++;
      notifyListeners();
    }
  }

  void addFavorite(Map<String, dynamic> question) {
    _favorites.add(question);
    notifyListeners();
  }
}
