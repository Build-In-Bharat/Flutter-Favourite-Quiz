import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:id8nxt_quiz_app/data/models/quiz_model.dart';
import 'package:id8nxt_quiz_app/widgets/question_screen_widgets/option_container.dart';

class QuestionViewContainer extends StatelessWidget {
  final String question;
  final List<Options> options;
  const QuestionViewContainer(
      {super.key, required this.question, required this.options});

  @override
  Widget build(BuildContext context) {
     final ThemeData theme = Theme.of(context);
    return Container(
      margin: const EdgeInsets.only(right: 5),
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 40),
      // height: 1500.h,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              question,
              style: theme.textTheme.labelMedium!.copyWith(fontSize: 23.sp,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                  height: 1.2),
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
            ),
            Divider(
              thickness: 3,
              color: Colors.grey.shade800,
              endIndent: 30.w,
            ),
            const SizedBox(
              height: 20,
            ),
            Column(
              children: [
                ...List.generate(
                    options.length,
                    (index) => optionContainer(
                        index: index,
                        option: options[index].optionText!,
                        description: options[index].shortDescription ?? "", theme: theme))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
