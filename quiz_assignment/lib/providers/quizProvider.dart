
import 'package:flutter/material.dart';
import '../models/quizModel.dart';
import '../repository/quizRepository.dart';

class QuizProvider with ChangeNotifier {
  final QuizRepository quizRepository;
  List<Quiz> _quizzes = [];
  List<Quiz> _favoriteQuizzes = [];
  bool _isLoading = false;
  String? _errorMessage;

  QuizProvider({required this.quizRepository});

  List<Quiz> get quizzes => _quizzes;
  List<Quiz> get favoriteQuizzes => _favoriteQuizzes; // Getter for favorite quizzes
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> fetchQuizzes() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _quizzes = await quizRepository.fetchQuizzes();
    } catch (e) {
      _errorMessage = e.toString();
    }

    _isLoading = false;
    notifyListeners();
  }

  void cleanFavorite(){
    _favoriteQuizzes.clear();
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
