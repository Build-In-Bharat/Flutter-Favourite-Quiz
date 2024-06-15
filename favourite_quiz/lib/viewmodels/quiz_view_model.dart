import 'package:flutter/foundation.dart';
import '../models/quiz.dart';
import '../repositories/quiz_repository.dart';

// for quiz data and state
class QuizViewModel with ChangeNotifier {
  QuizRepository quizRepository;
  // list to store all quizzes
  List<Quiz> _quizzes = [];
  // list to store favourite quizzes
  final List<Quiz> _favouriteQuizzes = [];

  QuizViewModel(this.quizRepository);

  List<Quiz> get quizzes => _quizzes;
  List<Quiz> get favouriteQuizzes => _favouriteQuizzes;

  // method to load quizzes from repository
  Future<void> loadQuizzes() async {
    _quizzes = await quizRepository.fetchQuizzes();
    notifyListeners();
  }

  // method to toggle the favourite status of quiz
  void toggleFavourite(Quiz quiz) {
    quiz.isFavourite = !quiz.isFavourite;
    // add or remove the quiz from the favourite list
    if (quiz.isFavourite) {
      _favouriteQuizzes.add(quiz);
    } else {
      _favouriteQuizzes.removeWhere((q) => q.id == quiz.id);
    }
    notifyListeners();
  }
}
