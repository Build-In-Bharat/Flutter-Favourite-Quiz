import 'package:flutter/material.dart';
import '../models/quiz.dart';
import '../repositories/quiz_repository.dart';

class QuizProvider extends ChangeNotifier {
  final QuizRepository quizRepository;
  List<Quiz> _quizzes = [];
  List<Quiz> favoriteQuizzes = [];
  List<int> idsFavorite = [];

  QuizProvider({required this.quizRepository});

  List<Quiz> get quizzes => _quizzes;

  Future<void> fetchQuizzes() async {
    _quizzes = await quizRepository.getQuizzes();
    //notifyListeners();
  }

  void toggleFavorite(int id, Quiz quiz) {
    if (idsFavorite.contains(id)) {
      idsFavorite.remove(id);
      favoriteQuizzes.remove(quiz);
      notifyListeners();
    } else {
      idsFavorite.add(id);
      favoriteQuizzes.add(quiz);
      notifyListeners();
    }
  }
}
