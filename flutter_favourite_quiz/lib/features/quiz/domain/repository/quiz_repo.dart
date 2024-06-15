import 'package:flutter_favourite_quiz/features/quiz/data/models/quiz_model.dart';

abstract class QuizRepo {
  // Get all the quizzes
  Future<List<QuizModel>> getQuizzes();
}
