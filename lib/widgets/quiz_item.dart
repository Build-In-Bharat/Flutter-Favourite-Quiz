import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/quiz.dart';
import '../providers/quiz_provider.dart';

class QuizItem extends StatelessWidget {
  final Quiz quiz;

  const QuizItem({super.key, required this.quiz});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Container(
        width: double.infinity,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.purple.shade100,
        ),
        child: Row(
          children: [
            const SizedBox(width: 10),
            const Icon(Icons.scuba_diving),
            const SizedBox(width: 10),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(quiz.title),
                Text('${quiz.numberOfQuestions} questions'),
              ],
            ),
            const Spacer(),
            Consumer<QuizProvider>(
              builder: (context, quizProvider, _) => IconButton(
                icon: Icon(
                  quizProvider.idsFavorite.contains(quiz.id)
                      ? Icons.favorite
                      : Icons.favorite_border,
                ),
                onPressed: () {
                  quizProvider.toggleFavorite(quiz.id, quiz);
                },
              ),
            ),
            const SizedBox(width: 10),
          ],
        ),
      ),
    );
  }
}

//  ListTile(
//       title: Text(quiz.title),
//       subtitle: Text('${quiz.numberOfQuestions} questions'),
//       trailing: Consumer<QuizProvider>(
//         builder: (context, quizProvider, _) => IconButton(
//           icon: Icon(
//             quizProvider.favoriteQuizzes.contains(quiz)
//                 ? Icons.favorite
//                 : Icons.favorite_border,
//           ),
//           onPressed: () {
//             quizProvider.toggleFavorite(quiz);
//           },
//         ),
//       ),
//     );
//   }