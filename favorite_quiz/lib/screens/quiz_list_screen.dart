import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/quiz_provider.dart';
import '../models/quiz.dart';

class QuizListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quizzes'),
      ),
      body: Consumer<QuizProvider>(
        builder: (context, quizProvider, child) {
          return FutureBuilder(
            future: quizProvider.fetchQuizzes(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (quizProvider.quizzes.isEmpty) {
                return Center(child: Text('No quizzes available'));
              } else {
                return ListView.builder(
                  itemCount: quizProvider.quizzes.length,
                  itemBuilder: (context, index) {
                    Quiz quiz = quizProvider.quizzes[index];
                    return ExpansionTile(
                      title: Text(quiz.title),
                      children: quiz.questions.map((question) {
                        return ListTile(
                          title: Text(question.questionText),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: question.options.map((option) {
                              return Text(option.optionText);
                            }).toList(),
                          ),
                        );
                      }).toList(),
                    );
                  },
                );
              }
            },
          );
        },
      ),
    );
  }
}
