import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../constants/strings.dart';
import '../models/quizModel.dart';

class QuizRepository {
  final String quizEndPoint = BaseUrl+"quizzes";

  Future<List<Quiz>> fetchQuizzes() async {
    print("API CALLED");
    try {
      final response = await http.get(Uri.parse(quizEndPoint));

      if (response.statusCode == 200) {
        print("DATA");
        List<dynamic> data = jsonDecode(response.body);
        List<Quiz> quizzes = data.map((quizJson) => Quiz.fromJson(quizJson)).toList();
        return quizzes;
      } else if (response.statusCode == 404) {
        // Handle not found error
        throw Exception('404 Not Found');
      } else if (response.statusCode == 401) {
        // Handle unauthorized error
        throw Exception('401 Unauthorized');
      } else if (response.statusCode == 403) {
        // Handle forbidden error
        throw Exception('403 Forbidden');
      } else if (response.statusCode == 500) {
        // Handle internal server error
        throw Exception('500 Internal Server Error');
      } else {
        // Handle other status codes
        throw Exception('Failed to load quizzes. Status Code: ${response.statusCode}');
      }
    } on SocketException {
      // Handle no internet connection
      throw Exception('No Internet connection');
    } on TimeoutException {
      // Handle timeout
      throw Exception('The connection has timed out, Please try again');
    } catch (e) {
      // Handle any other type of exception
      throw Exception('An unexpected error occurred: $e');
    }
  }
}
