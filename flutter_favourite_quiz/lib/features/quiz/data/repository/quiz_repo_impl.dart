import 'package:flutter_favourite_quiz/features/quiz/data/datasource/quiz_api.dart';
import 'package:flutter_favourite_quiz/features/quiz/data/models/quiz_model.dart';
import 'package:flutter_favourite_quiz/features/quiz/domain/repository/quiz_repo.dart';

class QuizRepoImpl extends QuizRepo {
  final QuizRemoteDataSource remoteDataSource;

  QuizRepoImpl({required this.remoteDataSource});

  @override
  Future<List<QuizModel>> getQuizzes() async {
    return await remoteDataSource.getQuizzes();
  }
}
