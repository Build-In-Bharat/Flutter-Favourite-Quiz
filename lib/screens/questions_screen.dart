import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:id8nxt_quiz_app/data/models/quiz_model.dart';
import 'package:id8nxt_quiz_app/provider/question_page_provider.dart';
import 'package:id8nxt_quiz_app/widgets/question_screen_widgets/question_view_container.dart';
import 'package:provider/provider.dart';

class QuestionsScreen extends StatefulWidget {
  final QuizModel quizModel;
  const QuestionsScreen({super.key, required this.quizModel});

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  final PageController _pageController = PageController(initialPage: 0);


  @override
  void initState() {
    
    super.initState();
    _pageController.addListener(() {
      context
          .read<QuestionPageProvider>()
          .updatePage(_pageController.page!.toInt());
    });
  }

  @override
  Widget build(BuildContext context) {
     final ThemeData theme = Theme.of(context);
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            colors: [Color(0XFF604791), Color(0XFF241D47)],
            begin: Alignment.topRight,
            end: Alignment.center),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.quizModel.title!,
                style: theme.textTheme.headlineLarge,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                "Question ${context.watch<QuestionPageProvider>().pageNumber + 1} of ${widget.quizModel.questions!.length}",
                style: theme.textTheme.headlineSmall!.copyWith(fontSize: 16),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 480.h,
                child: PageView.builder(
                    physics: const BouncingScrollPhysics(),
                    controller: _pageController,
                    itemCount: widget.quizModel.questions!.length,
                    itemBuilder: (context, index) => QuestionViewContainer(
                        question:
                            widget.quizModel.questions![index].questionText!,
                        options: widget.quizModel.questions![index].options!)),
              )
            ],
          ),
        ),
      ),
    );
  }
}



