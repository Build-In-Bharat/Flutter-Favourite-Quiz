import 'dart:convert';

import 'package:flutter_favourite_quiz/features/quiz/data/models/quiz_model.dart';
import 'package:flutter_favourite_quiz/utils/global.dart';
import 'package:http/http.dart' as http;

class QuizRemoteDataSource {

  // Fetch quizzes from the API
  Future<List<QuizModel>> getQuizzes() async {
    try {
      Uri url = Uri.parse(GlobalVariable.url);
      final response = await http.get(url);

      if (response.statusCode == 200) {
        List<dynamic> body = json.decode(response.body);
        return List<QuizModel>.from(
          body.map<QuizModel>(
            (x) => QuizModel.fromMap(x as Map<String, dynamic>),
          ),
        );
      } else {
        switch (response.statusCode) {
          case 400:
            throw Exception('Bad request. Please try again later.');
          case 401:
            throw Exception('Unauthorized. Please check your credentials.');
          case 403:
            throw Exception('Forbidden. You do not have permission.');
          case 404:
            throw Exception('Not found. The requested resource was not found.');
          case 500:
            throw Exception('Internal server error. Please try again later.');
          default:
            throw Exception(
                'Failed to load quizzes. Status code: ${response.statusCode}');
        }
      }
    } on Exception catch (e) {
      throw Exception('Unexpected error: ${e.toString()}');
    }
  }
}
