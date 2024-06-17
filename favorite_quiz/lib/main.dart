import 'package:favorite_quiz/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:favorite_quiz/providers/quiz_provider.dart';
import 'package:favorite_quiz/repositories/quiz_repository.dart';
import 'package:favorite_quiz/services/api_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final apiService = ApiService();
    final quizRepository = QuizRepository(apiService: apiService);

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => QuizProvider(quizRepository: quizRepository),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Quiz App',
        home: WelcomeScreen(),
      ),
    );
  }
}
