import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:id8nxt_quiz_app/constants/home_screen_demolist.dart';
import 'package:id8nxt_quiz_app/core/theme/colors.dart';
import 'package:id8nxt_quiz_app/provider/quiz_provider.dart';
import 'package:id8nxt_quiz_app/widgets/home_screen_widgets/custom_error.dart';
import 'package:id8nxt_quiz_app/widgets/home_screen_widgets/custom_no_internet_alert_dialog.dart';
import 'package:id8nxt_quiz_app/widgets/home_screen_widgets/home_screen_headings.dart';
import 'package:id8nxt_quiz_app/widgets/home_screen_widgets/quiz_container.dart';
import 'package:id8nxt_quiz_app/widgets/home_screen_widgets/topic_container.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [AppColors.lightPurple, AppColors.darkPurple],
              begin: Alignment.topRight,
              end: Alignment.center)),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          title: Text(
            "Hello User!",
            style: theme.textTheme.headlineMedium,
          ),
          actions: [
            CircleAvatar(
              radius: 25.sp,
              backgroundColor: Colors.white,
              child: Icon(
                Icons.person,
                color: AppColors.lightPurple,
                size: 25.sp,
              ),
            ),
            const SizedBox(
              width: 5,
            ),
          ],
        ),
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "What Quiz would you like to play today?",
                    style: theme.textTheme.headlineLarge,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  headingH1(heading: "Select Topic-Wise", theme: theme),
                  SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ...List.generate(
                            demoList2.length,
                            (index) => TopicContainer(
                                imgNumber: index,
                                topicName: demoList2[index]["Name"]))
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  headingH1(heading: "New Quizes", theme: theme),
                  Consumer<QuizProvider>(
                    builder: (context, quizProvider, child) {
                      if (quizProvider.state == QuizStates.initialQuizState ||
                          quizProvider.state == QuizStates.loadingQuizState) {
                        return const Center(
                          child: SpinKitWanderingCubes(
                            color: Colors.white,
                          ),
                        );
                      } else if (quizProvider.state ==
                          QuizStates.errorQuizState) {
                        return CustomError(
                            errorMessage: quizProvider.error,
                            tryAgain: () {
                              quizProvider.getQuizes();
                            });
                      } else if (quizProvider.state ==
                          QuizStates.noInternetQuizState) {
                        return CustomInternetError(tryAgain: () {
                          quizProvider.getQuizes();
                        });
                      }

                      return SizedBox(
                        height: 330.h,
                        child: PageView.builder(
                            physics: const BouncingScrollPhysics(),
                            itemCount: quizProvider.quizes.length,
                            itemBuilder: (context, index) {
                              return QuizContainer(
                                quizModel: quizProvider.quizes[index],
                                index: index,
                              );
                            }),
                      );
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
