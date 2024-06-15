import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/quiz_view_model.dart';
import '../models/quiz.dart';

class QuizList extends StatelessWidget {
  final List<Quiz> quizzes;
  //flag to determine if the list is favourite list or not
  final bool isFavouriteList;

  const QuizList(this.quizzes, {super.key, this.isFavouriteList = false});

  @override
  Widget build(BuildContext context) {
    // get the QuizViewModel instance from the provider.
    final quizViewModel = context.read<QuizViewModel>();
    // return a Listview to display the list of quizzes
    return ListView.builder(
      itemCount: quizzes.length,
      itemBuilder: (context, index) {
        final quiz = quizzes[index];
        return Card(
          elevation: 4,
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: ListTile(
            title: Text(
              quiz.title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            subtitle: Text('Questions: ${quiz.numberOfQuestions}'),
            trailing: IconButton(
              icon: Icon(
                quiz.isFavourite ? Icons.favorite : Icons.favorite_border,
                color: quiz.isFavourite ? Colors.red : null,
              ),
              // toggle the favourite status
              onPressed: () => quizViewModel.toggleFavourite(quiz),
            ),
          ),
        );
      },
    );
  }
}
