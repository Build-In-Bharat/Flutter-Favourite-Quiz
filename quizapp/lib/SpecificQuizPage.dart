import 'package:flutter/material.dart';
import 'package:quizapp/Models/Quiz.dart';
import 'package:quizapp/Components/QuestionCard.dart';
import 'package:quizapp/Components/constants.dart';

class SpecificQuizPage extends StatefulWidget {
  final QuizDetail quizInfo;
  const SpecificQuizPage({
    required this.quizInfo,
    super.key,
  });

  @override
  State<SpecificQuizPage> createState() => _SpecificQuizPageState();
}

class _SpecificQuizPageState extends State<SpecificQuizPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Quiz',
          ),
        ),
        body: ListView(
          scrollDirection: Axis.vertical,
          padding: const EdgeInsets.all(20),
          children: <Widget>[
            Text(
              widget.quizInfo.title,
              style: const TextStyle(
                color: ColorConstant.primaryTextColor,
                fontSize: 23,
                fontWeight: FontWeight.bold,
              ),
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              "No of Question: ${widget.quizInfo.numberOfQuestions}",
              style: const TextStyle(
                color: ColorConstant.secondaryTextColor,
                fontSize: 18,
              ),
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(
              height: 25,
            ),
            ListView.separated(
              shrinkWrap: true,
              itemCount: widget.quizInfo.questions.length,
              separatorBuilder: (context, index) => const SizedBox(
                height: 15,
              ),
              itemBuilder: (context, index) => QuestionCard(
                question: widget.quizInfo.questions[index],
                index: index + 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
