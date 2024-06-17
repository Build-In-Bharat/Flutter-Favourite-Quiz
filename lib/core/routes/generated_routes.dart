import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:id8nxt_quiz_app/core/routes/named_routes.dart';
import 'package:id8nxt_quiz_app/data/models/quiz_model.dart';
import 'package:id8nxt_quiz_app/provider/question_page_provider.dart';
import 'package:id8nxt_quiz_app/screens/questions_screen.dart';
import 'package:provider/provider.dart';

class GeneratedRoutes {
  static Route generateRoutes(RouteSettings routeSettings) {
    log("Navigating to Route!!!=====>> ${routeSettings.name}");

    switch (routeSettings.name) {
      case Routes.questionScreen:
        return MaterialPageRoute(
            builder: (context) => ChangeNotifierProvider(
                  create: (context) => QuestionPageProvider(),
                  child: QuestionsScreen(
                      quizModel: routeSettings.arguments as QuizModel),
                ),
            settings: routeSettings);

      default:
        return errorScreen();
    }
  }

  static MaterialPageRoute<dynamic> errorScreen() {
    return MaterialPageRoute(
      builder: (context) => const Scaffold(
        body: SafeArea(
          child: Text("Error here!"),
        ),
      ),
    );
  }
}
