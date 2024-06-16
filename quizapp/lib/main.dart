import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';
import 'package:quizapp/Components/constants.dart';
import 'package:quizapp/FavoritePage.dart';
import 'package:quizapp/Home.dart';
import 'package:quizapp/Provider/FavoriteQuizProvider.dart';
import 'package:quizapp/Provider/QuizProvider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int index = 0;
  List pages = const [
    homePage(),
    Favorites(),
  ];
  List title = const [
    "Quiz",
    "Favorite",
  ];

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => FavoriteProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => QuizProvider(),
        ),
      ],
      child: MaterialApp(
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
            iconTheme: IconThemeData(
              color: ColorConstant.primaryTextColor,
            ),
          ),
          scaffoldBackgroundColor: ColorConstant.primaryBackgroundColor,
        ),
        home: SafeArea(
          child: Scaffold(
            appBar: AppBar(
              title: Text(
                title[index],
              ),
            ),
            body: pages[index],
            bottomNavigationBar: GNav(
              selectedIndex: index,
              onTabChange: (value) {
                setState(() {
                  index = value;
                });
              },
              duration: const Duration(seconds: 1),
              iconSize: 30,
              activeColor: ColorConstant.activeTabColor,
              color: ColorConstant.inactiveTabColor,
              gap: 10,
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 22),
              tabs: const [
                GButton(
                  icon: Icons.home_filled,
                  text: 'Home',
                ),
                GButton(
                  icon: Icons.favorite,
                  text: 'Favorite',
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
