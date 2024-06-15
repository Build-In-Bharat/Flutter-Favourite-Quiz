import 'package:flutter/material.dart';
import 'package:quizapp/ApiFunctions.dart';
import 'package:quizapp/Classes/Quiz.dart';
import 'package:quizapp/Components/QuizCard.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  late Future<List<QuizDetail>> quizList;

  @override
  void initState() {
    quizList = getQuiz();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Quiz',
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: FutureBuilder<List<QuizDetail>>(
            future: quizList,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  List<QuizDetail> quiz = snapshot.data!;
                  return ListView.separated(
                    itemCount: quiz.length,
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        height: 15,
                      );
                    },
                    itemBuilder: (context, index) {
                      return QuizCard(
                        quiz: quiz[index],
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  return Text(
                    '${snapshot.error}',
                  );
                }
              }
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
