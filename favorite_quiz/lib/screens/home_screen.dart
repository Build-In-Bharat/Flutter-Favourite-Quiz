import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/quiz_provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final quizProvider = Provider.of<QuizProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz App'),
      ),
      body: quizProvider.quizzes.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: quizProvider.quizzes.length,
              itemBuilder: (context, index) {
                final quiz = quizProvider.quizzes[index];
                return ListTile(
                  title: Text(quiz.title),
                  onTap: () {
                    // Navigate to quiz details or another screen
                  },
                );
              },
            ),
    );
  }
}
