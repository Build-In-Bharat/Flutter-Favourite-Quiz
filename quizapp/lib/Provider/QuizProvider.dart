import 'package:flutter/material.dart';
import 'package:quizapp/Classes/Quiz.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class QuizProvider extends ChangeNotifier {
  List<QuizDetail> quizes = [];

  void getQuiz() async {
    var url = Uri.parse('https://core.id8devhub.com/api/v1/quizzes/');
    var response = await http.get(url);
    var body = jsonDecode(response.body);
    body.forEach((e) {
      quizes.add(QuizDetail.fromJson(e));
    });
    notifyListeners();
  }

  QuizProvider() {
    getQuiz();
  }
}
