import 'package:flutter_favourite_quiz/features/quiz/data/models/quiz_model.dart';
import 'package:flutter_favourite_quiz/features/quiz/domain/repository/quiz_repo.dart';

class QuizUsecase {
  final QuizRepo repository;

  QuizUsecase(this.repository);

// Get all the quizzes
  Future<List<QuizModel>> getQuizzes() async {
    return await repository.getQuizzes();
  }
}
