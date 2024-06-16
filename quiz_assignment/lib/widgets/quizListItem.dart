import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../screens/favoriteQuizzesScreen.dart';
import '../models/quizModel.dart';
import '../providers/quizProvider.dart';


class QuizListItem extends StatelessWidget {
  final Quiz quiz;
  final bool isFavorite;
  final VoidCallback onFavoritePressed;

  QuizListItem({
    required this.quiz,
    required this.isFavorite,
    required this.onFavoritePressed,
  });

  @override
  Widget build(BuildContext context) {
    bool isRecent = quiz.wasPublishedRecently;
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.black, Colors.deepPurple, Colors.deepPurpleAccent],
            stops: [0.0, 0.8, 1.0],
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    quiz.title,
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: isFavorite ? Colors.red : null,
                    ),
                    onPressed: onFavoritePressed,
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
                margin: EdgeInsets.only(top: 4.0),
                decoration: BoxDecoration(
                  color: isRecent ? Colors.white : Colors.grey,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Text(
                  isRecent ? 'New' : 'Old',
                  style: TextStyle(color: isRecent?Colors.green:Colors.white),
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                'Number of questions: ${quiz.numberOfQuestions}',
                style: Theme.of(context).textTheme.bodyText2,
              ),
              SizedBox(height: 8.0),
              Text(
                'Views: ${quiz.views}',
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}