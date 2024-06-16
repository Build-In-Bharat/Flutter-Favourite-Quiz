import 'package:flutter/material.dart';
import '../models/quizModel.dart';

class QuizDetailsScreen extends StatelessWidget {
  final Quiz quiz;

  QuizDetailsScreen({required this.quiz});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(quiz.title),
      ),
      body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.deepPurpleAccent, Colors.deepPurple, Colors.black54],
              stops: [0.0, 0.05, 1.0],
            ),),
        child: ListView.builder(
          itemCount: quiz.questions.length,
          itemBuilder: (context, index) {
            final question = quiz.questions[index];
            return Container(
              child: Card(
                margin: EdgeInsets.symmetric(vertical: 8.0,horizontal: 16),
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
                      children: [
                        Text(
                          question.questionText,
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: question.options.map((option) {
                            return Padding(
                              padding: EdgeInsets.symmetric(vertical: 4.0),
                              child: Text(
                                option.optionText,
                                style: TextStyle(fontSize: 16),
                              ),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
