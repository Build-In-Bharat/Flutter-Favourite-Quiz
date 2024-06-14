import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'repositories/quiz_repository.dart';
import 'viewmodels/quiz_view_model.dart';
import 'screens/quiz_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        Provider<QuizRepository>(create: (_) => QuizRepository()),
        ChangeNotifierProxyProvider<QuizRepository, QuizViewModel>(
          create: (context) => QuizViewModel(context.read<QuizRepository>()),
          update: (context, quizRepository, viewModel) =>
              viewModel!..quizRepository = quizRepository,
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: AppBarTheme(
          color: Colors.purple.shade300,
          centerTitle: true,
          titleTextStyle: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
          iconTheme: const IconThemeData(color: Colors.white),
        ),
        scaffoldBackgroundColor: Colors.grey[100],
      ),
      home: const QuizScreen(),
    );
  }
}
