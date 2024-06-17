import 'package:dio/dio.dart';
import 'package:id8nxt_quiz_app/core/api.dart';
import 'package:id8nxt_quiz_app/data/models/quiz_model.dart';

/// Repository class for fetching quiz data from an API.
class QuizRepository {
  final Api _api = Api(); // Instance of Api class for API requests

  /// Fetches quiz data from the API.
  ///
  /// Returns a list of [QuizModel] objects wrapped in a Future.
  /// Throws an error message if the API request fails or if the response status code is not 200.
  Future<List<QuizModel>> getQuizData() async {
    try {
      // Send GET request to "/quizzes" endpoint using _api instance
      Response response = await _api.sendRequest.get("/quizzes");

      // Check if response status code is 200 (OK)
      if (response.statusCode == 200) {
        // Extract data from response (assuming data is a List<dynamic>)
        List<dynamic> data = response.data;

        // Map each item in data list to QuizModel object using fromJson constructor
        List<QuizModel> quizzes =
            data.map((quiz) => QuizModel.fromJson(quiz)).toList();

        // Return list of QuizModel objects
        return quizzes;
      } else {
        // Throw error if response status code is not 200
        throw "Status code from the response is not 200 (Error from Quiz Repository)";
      }
    } catch (e) {
      // Catch any exceptions thrown during API request or data processing
      throw "Exception while fetching Api Data => $e (Error from Quiz Repository)";
    }
  }
}
