import 'package:flutter/material.dart';
import 'package:flutter_favourite_quiz/features/quiz/data/models/quiz_model.dart';
import 'package:flutter_favourite_quiz/features/quiz/domain/usecases/quiz_usecase.dart';

class QuizProvider extends ChangeNotifier {
  final QuizUsecase _quizUsecase;

  QuizProvider(this._quizUsecase);

  List<QuizModel> _quizzes = [];
  List<QuizModel> get quizzes => _quizzes;
  bool _hasError = false;
  bool get hasError => _hasError;

// Get all the quizzes
  Future<void> getQuizzes() async {
    try {
      _quizzes = await _quizUsecase.getQuizzes();
    } catch (e) {
      _hasError = true;
      _quizzes = [];
    } finally {
      notifyListeners();
    }
  }

// Toggle the favourite status of a quiz
  void toggleFavourite({required QuizModel quiz}) {
    final index = _quizzes.indexOf(quiz);
    _quizzes[index] = quiz.copyWith(isFavourite: !quiz.isFavourite);
    notifyListeners();
  }
}
