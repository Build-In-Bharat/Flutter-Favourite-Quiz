import 'package:favourite_quiz/screens/favourite_quizzes_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/quiz_view_model.dart';
import '../widgets/quiz_list.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  Future<void>? _quizFuture;

  @override
  void initState() {
    super.initState();
    final quizViewModel = context.read<QuizViewModel>();
    // load quizzes and store the Future in _quizFuture.
    _quizFuture = quizViewModel.loadQuizzes();
  }

  @override
  Widget build(BuildContext context) {
    final quizViewModel = context.watch<QuizViewModel>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Quizzes'),
        actions: [
          // Icon Button to navigate to favourite quizzes screen
          IconButton(
            icon: const Icon(Icons.favorite),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const FavoriteQuizzesScreen()),
              );
            },
          ),
        ],
      ),
      body: FutureBuilder(
        future: _quizFuture,
        builder: (context, snapshot) {
          // show a progress indicator while waiting for quizzes to load
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            // show an error if there is an error loading the quizzes
            return Center(
                child: Text('Error loading quizzes: ${snapshot.error}'));
          } else {
            // display the list of quizzes if fetched successfully
            return QuizList(quizViewModel.quizzes);
          }
        },
      ),
    );
  }
}
