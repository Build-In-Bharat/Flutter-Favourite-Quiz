import 'package:flutter/material.dart';
import 'package:kamran_quiz/models/connectivity_state.dart';
import 'package:kamran_quiz/providers/connectivity_provider.dart';
import 'package:kamran_quiz/providers/quiz_provider.dart';
import 'package:kamran_quiz/widgets/quiz_list.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final QuizProvider quizProvider = Provider.of<QuizProvider>(context);
    final ConnectivityProvider connecivityProvider =
        Provider.of<ConnectivityProvider>(context);
    return Scaffold(
      body: FutureBuilder(
          future: connecivityProvider.connectionState(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Center(
                  child: Text('Unable to get Network status.'));
            } else {
              if (snapshot.data == ConnectivityState.mobile ||
                  snapshot.data == ConnectivityState.wifi) {
                return FutureBuilder(
                  future: quizProvider.fetchQuizzes(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState ==
                        ConnectionState.waiting) {
                      return const Center(
                          child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return const Center(
                          child: Text('Failed to load quizzes'));
                    } else {
                      return QuizList(quizzes: quizProvider.quizzes);
                    }
                  },
                );
              } else {
                return const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.wifi_off,
                        size: 80,
                        color: Colors.grey,
                      ),
                      SizedBox(height: 20),
                      Text(
                        'No Internet Connection',
                        style: TextStyle(fontSize: 18, color: Colors.grey),
                      ),
                    ],
                  ),
                );
              }
            }
          }),
    );
  }
}
