import 'package:flutter/material.dart';
import 'package:quizapp/Classes/Quiz.dart';

class FavoriteProvider extends ChangeNotifier {
  List<QuizDetail> quizes = [];
  List<dynamic> quizID = [];
  void addFavorite(QuizDetail quiz) {
    quizes.add(quiz);
    quizID.add(quiz.id);
    notifyListeners();
  }

  void removeFavorite(QuizDetail quiz) {
    int index = quizID.indexOf(quiz.id);
    quizes.removeAt(index);
    quizID.removeAt(index);
    notifyListeners();
  }
}
