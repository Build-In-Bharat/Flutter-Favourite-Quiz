import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/quiz_provider.dart';
import '../widgets/quiz_tile.dart';
import 'quiz_detail_screen.dart';

class FavoriteQuizScreen extends StatelessWidget {
  const FavoriteQuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<QuizProvider>(
      builder: (context, quizProvider, child) {
        if (quizProvider.favoriteQuizzes.isEmpty) {
          return const Center(
              child: Text('No favorite quizzes',
                  style: TextStyle(color: Colors.white)));
        }

        return ListView.builder(
          itemCount: quizProvider.favoriteQuizzes.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => QuizDetailScreen(
                        quiz: quizProvider.favoriteQuizzes[index]),
                  ),
                );
              },
              child: QuizTile(quiz: quizProvider.favoriteQuizzes[index]),
            );
          },
        );
      },
    );
  }
}
