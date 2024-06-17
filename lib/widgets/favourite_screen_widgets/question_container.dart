import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:id8nxt_quiz_app/core/routes/named_routes.dart';
import 'package:id8nxt_quiz_app/data/models/quiz_model.dart';

class QuestionContainer extends StatelessWidget {
  final QuizModel quiz;
  final Function(DismissDirection) onDismissed;
  const QuestionContainer(
      {super.key, required this.quiz, required this.onDismissed});

  @override
  Widget build(BuildContext context) {
     final ThemeData theme = Theme.of(context);
    return Dismissible(
      onDismissed: onDismissed,
      background: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 15.w),
        margin: const EdgeInsets.only(bottom: 5),
        child: Icon(
          Icons.restore_from_trash,
          color: const Color(0XFF604791),
          size: 30.sp,
        ),
      ),
      key: Key(quiz.id!.toString()),
      child: GestureDetector(
        onTap: () => Navigator.pushNamed(context, Routes.questionScreen,
            arguments: quiz),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5),
          margin: const EdgeInsets.symmetric(vertical: 5),
          child: Row(
            children: [
              SizedBox(height: 90, child: Image.asset("assets/images/6.png")),
              SizedBox(
                width: 10.w,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    quiz.title!,
                    style: theme.textTheme.labelMedium!.copyWith(fontSize: 18.sp,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                        height: 1.5),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    "${quiz.numberOfQuestions} Questions",
                    style: theme.textTheme.labelMedium!.copyWith(fontSize: 18.sp,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                        height: 1.5),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
