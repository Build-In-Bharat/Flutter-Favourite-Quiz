import 'package:flutter/material.dart';
import 'quiz_list_screen.dart';
import 'favorite_quiz_screen.dart';
import 'package:quiz_app/utils/constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  bool _showFavorites = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HELLO'),
        actions: [
          GestureDetector(
            onTap: () {
              setState(() {
                _showFavorites = false;
              });
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color:
                        _showFavorites ? Colors.transparent : kColorBackground,
                    width: 2.0,
                  ),
                ),
              ),
              child: Text(
                'All Quizzes',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight:
                      _showFavorites ? FontWeight.normal : FontWeight.bold,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                _showFavorites = true;
              });
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color:
                        _showFavorites ? kColorBackground : Colors.transparent,
                    width: 2.0,
                  ),
                ),
              ),
              child: Text(
                'Favorites',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight:
                      _showFavorites ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: _showFavorites
                ? const FavoriteQuizScreen()
                : const QuizListScreen(),
          ),
          Container(
            color: kColorPrimary,
            padding: const EdgeInsets.all(10.0),
            alignment: Alignment.center,
            child: const Text(
              'Made by Yash Shukla',
              style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w300,
                color: kColorBackground,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
