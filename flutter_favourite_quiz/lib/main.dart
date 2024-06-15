import 'package:flutter/material.dart';
import 'package:flutter_favourite_quiz/core/dependency_injection/dependency_injection.dart';
import 'package:flutter_favourite_quiz/core/routes/routes.dart';
import 'package:flutter_favourite_quiz/features/quiz/domain/usecases/quiz_usecase.dart';
import 'package:flutter_favourite_quiz/features/quiz/presentation/provider/quiz_provider.dart';
import 'package:flutter_favourite_quiz/features/quiz/presentation/view/home_screen.dart';
import 'package:flutter_favourite_quiz/features/quiz/presentation/view/splash_screen.dart';
import 'package:flutter_favourite_quiz/utils/theme.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

void main() {
  DependencyInjection.setDependencyInjection();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (context) => QuizProvider(GetIt.instance<QuizUsecase>())),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Quiz App',
        theme: ThemeClass.themeData,
        routes: Routes.getRoute(),
        home: Consumer<QuizProvider>(
          builder: (context, quizProvider, child) {
            return quizProvider.quizzes.isEmpty
                ? const SplashScreen()
                : const HomeScreen();
          },
        ),
      ),
    );
  }
}
