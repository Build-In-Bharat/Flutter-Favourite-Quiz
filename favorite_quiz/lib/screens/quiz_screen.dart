import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:favorite_quiz/providers/quiz_provider.dart'; // Import QuizProvider
import 'package:favorite_quiz/services/api_service.dart';

import 'question_list.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  late Future<List<Map<String, dynamic>>> _futureQuizzes;
  int _currentQuestionIndex = 0;

  @override
  void initState() {
    super.initState();
    _futureQuizzes = ApiService().fetchQuizzes();
  }

  void _skipQuestion() {
    setState(() {
      _currentQuestionIndex++;
    });
  }

  void showToastMessage(String message) => Fluttertoast.showToast(
        msg: message,
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: _skipQuestion,
              icon: const Text(
                "Skip",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ],
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: _futureQuizzes,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No quizzes found'));
          } else {
            final quizzes = snapshot.data!;
            if (_currentQuestionIndex >= quizzes.length) {
              return const Center(child: Text('No more questions'));
            }
            final quiz = quizzes[_currentQuestionIndex];
            final questions = quiz['questions'] as List<dynamic>;
            final currentQuestion =
                questions[_currentQuestionIndex % questions.length];
            final options = currentQuestion['options'] as List<dynamic>;

            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text.rich(
                  TextSpan(
                    text: "Question ${_currentQuestionIndex + 1}",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                    ),
                    children: [
                      TextSpan(
                        text: "/${questions.length}",
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(),
                const SizedBox(height: 20),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              currentQuestion['question_text'] ??
                                  'No question text available',
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                              ),
                            ),
                          ),
                          Consumer<QuizProvider>(
                            builder: (context, quizProvider, child) =>
                                IconButton(
                              icon: const Icon(
                                Icons.favorite_border,
                                color: Colors.black,
                              ),
                              onPressed: () {
                                final quizzes = quizProvider.quizzes;
                                if (_currentQuestionIndex < quizzes.length) {
                                  final quiz = quizzes[_currentQuestionIndex];
                                  final questions =
                                      quiz['questions'] as List<dynamic>;
                                  final currentQuestion = questions[
                                      _currentQuestionIndex % questions.length];
                                  quizProvider.addFavorite(currentQuestion);
                                  showToastMessage("Added to favorites");
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      ...options.map((option) {
                        return Option(
                          optionText: option['option_text'] ??
                              'No option text available',
                        );
                      }),
                    ],
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
