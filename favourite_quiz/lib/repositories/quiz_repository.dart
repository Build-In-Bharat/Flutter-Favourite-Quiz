import 'package:dio/dio.dart';
import '../models/quiz.dart';

// class responsible for fetching data from api
class QuizRepository {
  final Dio _dio = Dio();
  final String apiUrl = 'https://core.id8devhub.com/api/v1/quizzes/';

  Future<List<Quiz>> fetchQuizzes() async {
    try {
      // make a get request from api
      final response = await _dio.get(apiUrl);
      // check if the response status is 200 (OK).
      if (response.statusCode == 200) {
        List<dynamic> data = response.data;
        return data.map((json) => Quiz.fromJson(json)).toList();
      }
      //if the status code is not 200, throw exception
      else {
        throw Exception('Failed to load quizzes');
      }
    } catch (error) {
      // throw an exception if an error occurs
      throw Exception('Failed to load quizzes: $error');
    }
  }
}
