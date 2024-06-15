import 'package:flutter/material.dart';
import 'package:quizapp/Components/constants.dart';
import 'package:quizapp/Home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          color: ColorConstant.secondaryBackgroundColor,
          centerTitle: true,
          titleTextStyle: TextStyle(
            color: ColorConstant.primaryTextColor,
            fontSize: 35,
            fontWeight: FontWeight.bold,
          ),
        ),
        scaffoldBackgroundColor: ColorConstant.primaryBackgroundColor,
      ),
      home: const homePage(),
    );
  }
}
