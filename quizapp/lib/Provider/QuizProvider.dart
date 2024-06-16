import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:quizapp/Models/Quiz.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class QuizProvider extends ChangeNotifier {
  List<QuizDetail>? quizes;
  String? error;

  Future<List<QuizDetail>?> getQuiz() async {
    try {
      var url = Uri.parse('https://core.id8devhub.com/api/v1/quizzes/');
      var response = await http.get(url).timeout(const Duration(seconds: 5));

      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        quizes = [];
        body.forEach((e) {
          quizes!.add(QuizDetail.fromJson(e));
        });
      } else {
        error = 'Failed to load quizzes, close the app and try again later';
      }
    } on SocketException {
      error = 'No Internet connection, Check your connection and try again';
    } on HttpException {
      error = 'Failed to load quizzes, close the app and try again later';
    } on FormatException {
      error = 'Bad response format';
    } on TimeoutException {
      error = 'Request timed out';
    } catch (e) {
      error = e.toString();
    }
    notifyListeners();

    return null;
  }

  QuizProvider() {
    getQuiz();
  }

  Future<void> refreshData() async {
    quizes?.clear();
    quizes = null;
    error = null;
    getQuiz();
  }
}
