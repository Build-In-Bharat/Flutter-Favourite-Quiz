import 'package:flutter/material.dart';
import 'package:quizapp/Classes/Questions.dart';
import 'package:quizapp/Components/constants.dart';

class QuestionCard extends StatefulWidget {
  final Question question;
  final int index;
  const QuestionCard({
    required this.question,
    required this.index,
    super.key,
  });

  @override
  State<QuestionCard> createState() => _QuestionCardState();
}

class _QuestionCardState extends State<QuestionCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: ColorConstant.secondaryBackgroundColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Question ${widget.index}:',
            style: const TextStyle(
                color: ColorConstant.primaryTextColor,
                fontSize: 20,
                fontWeight: FontWeight.bold),
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            widget.question.questionText,
            style: const TextStyle(
              color: ColorConstant.secondaryTextColor,
              fontSize: 16,
            ),
            overflow: TextOverflow.clip,
          ),
          const SizedBox(
            height: 10,
          ),
          ListView.separated(
            shrinkWrap: true,
            itemCount: widget.question.options.length,
            separatorBuilder: (context, index) => const SizedBox(
              height: 2,
            ),
            itemBuilder: (context, index) => Text(
              '${String.fromCharCode(index + 65)}) ${widget.question.options[index].optionText} ',
              style: const TextStyle(
                color: ColorConstant.primaryTextColor,
                fontSize: 15,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
