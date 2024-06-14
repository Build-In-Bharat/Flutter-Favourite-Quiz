import 'package:flutter/material.dart';
import '../models/quiz.dart';
import 'package:provider/provider.dart';
import '../providers/quiz_provider.dart';
import 'package:quiz_app/utils/constants.dart';

class QuizTile extends StatelessWidget {
  final Quiz quiz;

  const QuizTile({super.key, required this.quiz});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      color: kColorSecondary,
      child: ListTile(
        title:
            Text(quiz.title, style: const TextStyle(color: kColorBackground)),
        subtitle: Text('Questions: ${quiz.numberOfQuestions}',
            style: const TextStyle(color: kColorBackground)),
        trailing: IconButton(
          icon: Icon(
            Provider.of<QuizProvider>(context).favoriteQuizzes.contains(quiz)
                ? Icons.favorite
                : Icons.favorite_border,
            color: kColorAccent,
          ),
          onPressed: () {
            Provider.of<QuizProvider>(context, listen: false)
                .toggleFavorite(quiz);
          },
        ),
      ),
    );
  }
}
