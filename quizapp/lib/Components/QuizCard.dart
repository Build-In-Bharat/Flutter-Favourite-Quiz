import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizapp/Classes/Quiz.dart';
import 'package:quizapp/Components/constants.dart';
import 'package:quizapp/Provider/FavoriteQuizProvider.dart';
import 'package:quizapp/SpecificQuizPage.dart';

class QuizCard extends StatefulWidget {
  final QuizDetail quiz;
  const QuizCard({
    required this.quiz,
    super.key,
  });

  @override
  State<QuizCard> createState() => _QuizCardState();
}

class _QuizCardState extends State<QuizCard> {
  @override
  Widget build(BuildContext context) {
    return Consumer<FavoriteProvider>(
      builder: (context, value, child) {
        bool isFavorite = value.quizID.contains(widget.quiz.id);
        return InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => SpecificQuizPage(quizInfo: widget.quiz),
              ),
            );
          },
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: ColorConstant.secondaryBackgroundColor,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.quiz.title,
                        style: const TextStyle(
                          color: ColorConstant.primaryTextColor,
                          fontSize: 23,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        "No of Question: ${widget.quiz.numberOfQuestions}",
                        style: const TextStyle(
                          color: ColorConstant.secondaryTextColor,
                          fontSize: 17,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: InkWell(
                    onTap: () {
                      isFavorite
                          ? value.removeFavorite(widget.quiz)
                          : value.addFavorite(widget.quiz);
                      isFavorite = isFavorite ? false : true;
                    },
                    child: CircleAvatar(
                      backgroundColor: ColorConstant.buttonBackgroundColor,
                      child: Icon(
                        Icons.favorite,
                        color: isFavorite
                            ? ColorConstant.favoriteEnableColor
                            : ColorConstant.favoriteDisableColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
