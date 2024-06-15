import 'package:flutter/material.dart';
import '../models/quiz.dart';
import '../repositories/quiz_repository.dart';

class QuizProvider extends ChangeNotifier {
  final QuizRepository quizRepository;

  List<Quiz> _quizzes = [];
  List<Quiz> get quizzes => _quizzes;

  QuizProvider({required this.quizRepository});

  Future<void> fetchQuizzes() async {
    try {
      _quizzes = await quizRepository.getQuizzes();
      notifyListeners();
    } catch (e) {
      print("Error in QuizProvider fetchQuizzes: $e");
    }
  }
}
