import 'package:flutter_favourite_quiz/features/quiz/data/datasource/quiz_api.dart';
import 'package:flutter_favourite_quiz/features/quiz/data/repository/quiz_repo_impl.dart';
import 'package:flutter_favourite_quiz/features/quiz/domain/usecases/quiz_usecase.dart';
import 'package:get_it/get_it.dart';

class DependencyInjection {
  static void setDependencyInjection() {
    final getIt = GetIt.instance;

    // Register the QuizRemoteDataSource
    getIt.registerSingleton<QuizRemoteDataSource>(QuizRemoteDataSource());

    // Register the QuizRepoImpl with dependency on QuizRemoteDataSource
    getIt.registerSingleton<QuizRepoImpl>(
        QuizRepoImpl(remoteDataSource: getIt<QuizRemoteDataSource>()));

    // Register the QuizUsecase with dependency on QuizRepoImpl
    getIt.registerSingleton<QuizUsecase>(QuizUsecase(getIt<QuizRepoImpl>()));
  }
}
