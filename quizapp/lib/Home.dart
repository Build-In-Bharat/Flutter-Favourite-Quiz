import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:quizapp/ApiFunctions.dart';
import 'package:quizapp/Classes/Quiz.dart';
import 'package:quizapp/Components/QuizCard.dart';
import 'package:quizapp/Provider/QuizProvider.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  late Future<List<QuizDetail>> quizList;

  @override
  void initState() {
    // quizList = getQuiz();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Consumer<QuizProvider>(
        builder: (context, value, child) {
          return RefreshIndicator(
            onRefresh: () {
              return value.refreshData().then((value) => null);
            },
            child: ListView.separated(
              itemCount: value.quizes.length,
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 15,
                );
              },
              itemBuilder: (context, index) {
                return QuizCard(
                  quiz: value.quizes[index],
                );
              },
            ),
          );
        },
      ),
    );
  }
}
