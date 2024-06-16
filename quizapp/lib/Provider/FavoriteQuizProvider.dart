import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:quizapp/Models/Quiz.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoriteProvider extends ChangeNotifier {
  List<QuizDetail> quizes = [];
  List<String> quizID = [];
  late SharedPreferences ref;

  FavoriteProvider() {
    getInstance();
  }

  void getInstance() async {
    ref = await SharedPreferences.getInstance();
    List<String>? tempList = ref.getStringList('quizesList');
    quizID = ref.getStringList('quizesIDList')!;

    tempList!.forEach((e) {
      quizes.add(QuizDetail.fromJson(jsonDecode(e)));
    });
    notifyListeners();
  }

  void addFavorite(QuizDetail quiz) {
    quizes.add(quiz);
    quizID.add(quiz.id.toString());
    List<String> temp = [];
    for (var i = 0; i < quizes.length; i++) {
      temp.add(jsonEncode(quizes[i].toJson()));
    }
    ref.setStringList('quizesList', temp);
    ref.setStringList('quizesIDList', quizID);
    notifyListeners();
  }

  void removeFavorite(QuizDetail quiz) {
    int index = quizID.indexOf(quiz.id.toString());
    quizes.removeAt(index);
    quizID.removeAt(index);
    List<String> temp = [];
    for (var i = 0; i < quizes.length; i++) {
      temp.add(jsonEncode(quizes[i].toJson()));
    }
    ref.setStringList('quizesList', temp);
    ref.setStringList('quizesIDList', quizID);
    notifyListeners();
  }
}
