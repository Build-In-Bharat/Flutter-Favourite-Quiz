import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizapp/Components/constants.dart';
// import 'package:quizapp/ApiFunctions.dart';
import 'package:quizapp/Models/Quiz.dart';
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
            child: value.error != null
                ? Center(
                    child: Text(
                      '${value.error}',
                      style: const TextStyle(
                        color: ColorConstant.primaryTextColor,
                        fontSize: 25,
                      ),
                    ),
                  )
                : value.quizes == null
                    ? const Center(
                        child: CircularProgressIndicator(
                          backgroundColor: ColorConstant.primaryTextColor,
                          valueColor: AlwaysStoppedAnimation(
                              ColorConstant.activeTabColor),
                          strokeWidth: 7,
                        ),
                      )
                    : ListView.separated(
                        itemCount: value.quizes!.length,
                        separatorBuilder: (context, index) {
                          return const SizedBox(
                            height: 15,
                          );
                        },
                        itemBuilder: (context, index) {
                          return QuizCard(
                            quiz: value.quizes![index],
                          );
                        },
                      ),
          );
        },
      ),
    );
  }
}
