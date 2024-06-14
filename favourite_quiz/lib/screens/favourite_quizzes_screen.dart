import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/quiz_view_model.dart';
import '../widgets/quiz_list.dart';

class FavoriteQuizzesScreen extends StatelessWidget {
  const FavoriteQuizzesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final quizViewModel = context.watch<QuizViewModel>();

    return Scaffold(
      appBar: AppBar(title: const Text('Favorite Quizzes')),
      // displaying favourite quizzes
      body: QuizList(quizViewModel.favouriteQuizzes, isFavouriteList: true),
    );
  }
}
