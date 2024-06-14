import 'package:flutter/material.dart';
import 'package:quiz_app/models/quiz.dart';
import 'package:quiz_app/repositories/quiz_repository.dart';

class QuizProvider with ChangeNotifier {
  List<Quiz> _quizzes = [];
  final List<Quiz> _favoriteQuizzes = [];
  bool _isLoading = false;

  List<Quiz> get quizzes => _quizzes;

  List<Quiz> get favoriteQuizzes => _favoriteQuizzes;

  bool get isLoading => _isLoading;

  final QuizRepository _quizRepository = QuizRepository();

  QuizProvider() {
    fetchQuizzes();
  }

  Future<void> fetchQuizzes() async {
    _isLoading = true;
    notifyListeners();
    _quizzes = await _quizRepository.fetchQuizzes();
    _isLoading = false;
    notifyListeners();
  }

  void toggleFavorite(Quiz quiz) {
    if (_favoriteQuizzes.contains(quiz)) {
      _favoriteQuizzes.remove(quiz);
    } else {
      _favoriteQuizzes.add(quiz);
    }
    notifyListeners();
  }
}
