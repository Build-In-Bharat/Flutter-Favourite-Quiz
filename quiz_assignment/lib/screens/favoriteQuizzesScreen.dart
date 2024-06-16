import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_assignment/screens/quizDetailsScreen.dart';

import '../providers/quizProvider.dart';
import '../widgets/quizListItem.dart';



class FavoriteQuizzesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final quizProvider = Provider.of<QuizProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite Quizzes'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.deepPurpleAccent, Colors.deepPurple, Colors.black54],
            stops: [0.0, 0.05, 1.0],
          ),
        ),
        child: quizProvider.favoriteQuizzes.isEmpty
            ? Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.favorite_border,
                size: 100,
                color: Colors.grey,
              ),
              SizedBox(height: 16),
              Text(
                'No favorite quizzes yet!',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        )
            : ListView.builder(
          itemCount: quizProvider.favoriteQuizzes.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => QuizDetailsScreen(
                      quiz: quizProvider.favoriteQuizzes[index],
                    ),
                  ),
                );
              },
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: QuizListItem(
                  quiz: quizProvider.favoriteQuizzes[index],
                  isFavorite: true,
                  onFavoritePressed: () {
                    quizProvider.toggleFavorite(quizProvider.favoriteQuizzes[index]);
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
