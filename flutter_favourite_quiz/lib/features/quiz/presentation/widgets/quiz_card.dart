import 'package:flutter/material.dart';
import 'package:flutter_favourite_quiz/features/quiz/data/models/quiz_model.dart';
import 'package:flutter_favourite_quiz/utils/constants.dart';

class QuizCard extends StatelessWidget {
  final QuizModel quiz;
  final Function onFavouritePressed;

  const QuizCard({
    Key? key,
    required this.quiz,
    required this.onFavouritePressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.15,
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: ColorConstants
            .cardColors[quiz.id % ColorConstants.cardColors.length],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  quiz.title,
                  overflow: TextOverflow.ellipsis,
                  style: TextConstants.cardTitle,
                ),
                Text(
                  "Questions: ${quiz.numberOfQuestions}",
                  overflow: TextOverflow.ellipsis,
                  style: TextConstants.cardSubtitle,
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () => onFavouritePressed(),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              child: Transform.scale(
                scale: quiz.isFavourite ? 1.5 : 1.0,
                child: Icon(
                  quiz.isFavourite ? Icons.favorite : Icons.favorite_border,
                  color: quiz.isFavourite ? Colors.red : null,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
