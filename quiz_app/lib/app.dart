import 'package:flutter/material.dart';
import 'package:quiz_app/utils/constants.dart';
import 'screens/home_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Favourite Quiz',
      theme: ThemeData(
        primaryColor: kColorPrimary,
        hintColor: kColorAccent,
        colorScheme: const ColorScheme(
          primary: kColorPrimary,
          secondary: kColorSecondary,
          surface: Colors.white,
          background: kColorBackground,
          error: Colors.red,
          onPrimary: Colors.white,
          onSecondary: Colors.white,
          onSurface: Colors.black,
          onBackground: Colors.black,
          onError: Colors.white,
          brightness: Brightness.light,
        ),
        scaffoldBackgroundColor: kColorBackground,
        appBarTheme: const AppBarTheme(
          color: kColorPrimary,
        ),
        tabBarTheme: const TabBarTheme(
          labelColor: kColorBackground,
          unselectedLabelColor: kColorSecondary,
          indicator: BoxDecoration(
            color: kColorAccent,
          ),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
