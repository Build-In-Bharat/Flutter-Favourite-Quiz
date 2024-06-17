import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:id8nxt_quiz_app/data/models/quiz_model.dart';

/// Provider class for managing favorite quizzes.
///
/// Extends [ChangeNotifier] to provide change notification to listeners.
class FavouritesProvider extends ChangeNotifier {
  List<QuizModel> _quizes = []; // List to store favorite quizzes

  /// Getter for retrieving the list of favorite quizzes.
  List<QuizModel> get quizes => _quizes;

  /// Adds a quiz to the list of favorite quizzes.
  ///
  /// If [quiz] is not already in [_quizes], adds it to the list.
  /// Logs a message if [quiz] is already in [_quizes].
  ///
  /// After modifying [_quizes], calls [notifyListeners] to notify listeners of the change.
  void addToFavourite(QuizModel quiz) {
    if (!_quizes.contains(quiz)) {
      _quizes.add(quiz);
    } else {
      log("Quiz already is in Favourite");
    }

    notifyListeners();
  }

  /// Removes a quiz from the list of favorite quizzes.
  ///
  /// Removes [quiz] from [_quizes].
  ///
  /// After modifying [_quizes], calls [notifyListeners] to notify listeners of the change.
  void removeFromFavourite(QuizModel quiz) {
    _quizes.remove(quiz);
    notifyListeners();
  }

  /// Checks if a quiz is in the list of favorite quizzes.
  ///
  /// Returns `true` if [quiz] is in [_quizes], otherwise returns `false`.
  bool isFavourite(QuizModel quiz) {
    return _quizes.contains(quiz);
  }
}
