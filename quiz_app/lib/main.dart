import 'package:flutter/material.dart';
import 'package:quiz_app/app.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/providers/quiz_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => QuizProvider(),
      child: const MyApp(),
    ),
  );
}
