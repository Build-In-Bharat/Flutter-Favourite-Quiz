import 'package:flutter/material.dart';
import '../models/quiz.dart';
import 'quiz_item.dart';

class QuizList extends StatelessWidget {
  final List<Quiz> quizzes;

  const QuizList({super.key, required this.quizzes});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: quizzes.length,
      itemBuilder: (context, index) {
        return QuizItem(quiz: quizzes[index]);
      },
    );
  }
}
