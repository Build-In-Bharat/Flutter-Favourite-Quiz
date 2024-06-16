import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_assignment/providers/quizProvider.dart';
import 'package:quiz_assignment/repository/quizRepository.dart';
import 'package:quiz_assignment/screens/quizListScreen.dart';


void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => QuizProvider(quizRepository: QuizRepository()),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quiz App',
      theme: ThemeData(
        primaryColor: Colors.deepPurple,
        hintColor: Colors.deepOrange,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: AppBarTheme(
          color: Colors.deepPurple,
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.deepPurple,
        ),
        cardColor: Colors.grey[900],
        textTheme:  TextTheme(
          bodyLarge: TextStyle(color: Colors.white),
          bodyMedium: TextStyle(color: Colors.white70),
        ),
      ),
      home: QuizListScreen(),
    );
  }
}
