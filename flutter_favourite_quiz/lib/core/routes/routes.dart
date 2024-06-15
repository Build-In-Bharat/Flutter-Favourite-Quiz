import 'package:flutter/material.dart';
import 'package:flutter_favourite_quiz/features/quiz/presentation/view/home_screen.dart';
import 'package:flutter_favourite_quiz/features/quiz/presentation/view/splash_screen.dart';

class RouteNames {
  static const String home = '/home';
  static const String splash = '/splash';
}

class Routes {
  static Map<String, WidgetBuilder> getRoute() {
    return {
      RouteNames.home: (context) => const HomeScreen(),
      RouteNames.splash: (context) => const SplashScreen(),
    };
  }
}
