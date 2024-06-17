import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/quiz_provider.dart';
import '../widgets/quiz_list.dart';

class LikedQuizesScreen extends StatelessWidget {
  const LikedQuizesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final favoriteQuizzes = Provider.of<QuizProvider>(context).favoriteQuizzes;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite Quizzes'),
      ),
      body: QuizList(quizzes: favoriteQuizzes),
    );
  }
}
