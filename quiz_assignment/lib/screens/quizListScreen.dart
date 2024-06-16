import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_assignment/screens/quizDetailsScreen.dart';

import '../providers/quizProvider.dart';
import '../widgets/quizListItem.dart';
import 'favoriteQuizzesScreen.dart';


class QuizListScreen extends StatefulWidget {
  @override
  _QuizListScreenState createState() => _QuizListScreenState();
}

class _QuizListScreenState extends State<QuizListScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      Provider.of<QuizProvider>(context, listen: false).fetchQuizzes();
    });
  }

  @override
  Widget build(BuildContext context) {
    final quizProvider = Provider.of<QuizProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Quizzes'),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FavoriteQuizzesScreen()),
              );
            },
          ),
        ],
      ),
      body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.deepPurpleAccent, Colors.deepPurple, Colors.black54],
                stops: [0.0, 0.05, 1.0],
              ),),
          child: _buildBody(quizProvider)),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          quizProvider.cleanFavorite();
          quizProvider.fetchQuizzes();
        },
        child: Icon(Icons.refresh),
      ),
    );
  }

  Widget _buildBody(QuizProvider quizProvider) {
    if (quizProvider.isLoading) {
      return Center(child: CircularProgressIndicator());
    } else if (quizProvider.errorMessage != null) {
      return Center(child: Text('Error: Check your internet connection and try again'));
    } else {
      return ListView.builder(
        itemCount: quizProvider.quizzes.length,
        itemBuilder: (context, index) {
          final quiz = quizProvider.quizzes[index];
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => QuizDetailsScreen(quiz: quiz)),
                );
              },
              child: QuizListItem(
                quiz: quiz,
                isFavorite: quizProvider.favoriteQuizzes.contains(quiz),
                onFavoritePressed: () {
                  quizProvider.toggleFavorite(quiz);
                },
              ),
            ),
          );
        },
      );
    }
  }
}
