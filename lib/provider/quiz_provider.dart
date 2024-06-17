import 'package:flutter/foundation.dart';
import 'package:id8nxt_quiz_app/data/models/quiz_model.dart';
import 'package:id8nxt_quiz_app/data/repositories/quiz_repository.dart';
import 'package:id8nxt_quiz_app/data/services/connectivity_check_service.dart';

/// Enum representing different states of quiz data fetching.
enum QuizStates {
  initialQuizState,
  loadingQuizState,
  loadedQuizState,
  errorQuizState,
  noInternetQuizState
}

/// Provider class for managing quiz data and its state.
///
/// Extends [ChangeNotifier] to provide change notification to listeners.
class QuizProvider extends ChangeNotifier {
  QuizStates _state = QuizStates.initialQuizState; // Current state of quiz data fetching
  List<QuizModel> _quizes = []; // List to store fetched quiz data
  String _error = ""; // Error message if fetching quiz data fails

  /// Getter for retrieving the current state of quiz data fetching.
  QuizStates get state => _state;

  /// Getter for retrieving the list of fetched quiz data.
  List<QuizModel> get quizes => _quizes;

  /// Getter for retrieving the error message if fetching quiz data fails.
  String get error => _error;

  final QuizRepository _quizRepository = QuizRepository(); // Instance of QuizRepository for fetching quiz data

  /// Asynchronously fetches quiz data from the API.
  ///
  /// Sets [_state] to [QuizStates.loadingQuizState] and notifies listeners.
  /// Tries to fetch quiz data using [_quizRepository.getQuizData()].
  /// Handles connectivity checks and sets appropriate states ([QuizStates.loadedQuizState],
  /// [QuizStates.errorQuizState], [QuizStates.noInternetQuizState]) based on connectivity status.
  ///
  /// Throws an error if any exception occurs during the process.
  Future<void> getQuizes() async {
    _state = QuizStates.loadingQuizState;
    notifyListeners();

    try {
      await InternetConnectivityCheck(
        onConnected: () async {
          try {
            _quizes = await _quizRepository.getQuizData();
          } catch (e) {
            _state = QuizStates.errorQuizState;
            _error = e.toString();
            notifyListeners();
            throw "Error Retrieving Quiz Data";
          }
          _state = QuizStates.loadedQuizState;
          notifyListeners();
        },
        onDisconnected: () {
          _state = QuizStates.noInternetQuizState;
          notifyListeners();
        },
      );
    } catch (e) {
      _state = QuizStates.errorQuizState;
      _error = e.toString();
      notifyListeners();
      throw "Exception while retrieving API data => $e (Error from Quiz Provider)";
    }
  }
}