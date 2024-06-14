import 'package:flutter/material.dart';
import '../models/quiz.dart';
import 'package:quiz_app/utils/constants.dart';

class QuizDetailScreen extends StatefulWidget {
  final Quiz quiz;

  const QuizDetailScreen({super.key, required this.quiz});

  @override
  QuizDetailScreenState createState() => QuizDetailScreenState();
}

class QuizDetailScreenState extends State<QuizDetailScreen> {
  int _currentQuestionIndex = 0;

  void _nextQuestion() {
    setState(() {
      if (_currentQuestionIndex < widget.quiz.questions.length - 1) {
        _currentQuestionIndex++;
      }
    });
  }

  void _prevQuestion() {
    setState(() {
      if (_currentQuestionIndex > 0) {
        _currentQuestionIndex--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final question = widget.quiz.questions[_currentQuestionIndex];

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.quiz.title),
      ),
      body: Card(
        margin: const EdgeInsets.fromLTRB(35.0, 80.0, 35.0, 80.0),
        color: kColorPrimary,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Question ${_currentQuestionIndex + 1}: ${question.questionText}',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: kColorBackground,
                ),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: question.options.map((option) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: kColorSecondary,
                          child: Text(
                            '${question.options.indexOf(option) + 1}',
                            style: const TextStyle(
                              color: kColorBackground,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        title: Text(option.optionText,
                            style: const TextStyle(color: kColorBackground)),
                        subtitle: option.shortDescription != null
                            ? Text(option.shortDescription!,
                                style: const TextStyle(color: kColorSecondary))
                            : null,
                      ),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (_currentQuestionIndex > 0)
                      GestureDetector(
                        onTap: _prevQuestion,
                        child: Container(
                          width: 75,
                          padding: const EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            color: kColorSecondary,
                            border: Border.all(color: kColorBackground),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: const Center(
                            child: Text('Prev',
                                style: TextStyle(color: kColorBackground)),
                          ),
                        ),
                      ),
                    const SizedBox(width: 20),
                    if (_currentQuestionIndex <
                        widget.quiz.questions.length - 1)
                      GestureDetector(
                        onTap: _nextQuestion,
                        child: Container(
                          width: 75,
                          padding: const EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            color: kColorSecondary,
                            border: Border.all(color: kColorBackground),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: const Center(
                            child: Text('Next',
                                style: TextStyle(color: kColorBackground)),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
