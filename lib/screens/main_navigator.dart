import 'package:flutter/material.dart';
import 'package:kamran_quiz/providers/connectivity_provider.dart';
import 'package:kamran_quiz/providers/main_navigation_provider.dart';
import 'package:kamran_quiz/providers/quiz_provider.dart';
import 'package:kamran_quiz/repositories/connectivity_repository.dart';
import 'package:kamran_quiz/repositories/quiz_repository.dart';
import 'package:kamran_quiz/screens/home_screen.dart';
import 'package:kamran_quiz/services/api_service.dart';
import 'package:kamran_quiz/services/connectivity_service.dart';
import 'package:provider/provider.dart';
import 'liked_quizes_screen.dart';

class MainNavigator extends StatelessWidget {
  const MainNavigator({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      const HomeScreen(),
      const LikedQuizesScreen(),
    ];
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => QuizProvider(
            quizRepository: QuizRepository(
              apiService: ApiService(),
            ),
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => MainNavigationProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ConnectivityProvider(
            connectivityRepository: ConnectivityRepository(
              connectivityService: ConnectivityService(),
            ),
          ),
        )
      ],
      child: Scaffold(
        body: Consumer<MainNavigationProvider>(
          builder: (context, navigator, _) => SafeArea(
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  child: Container(
                    width: double.infinity,
                    height: 340,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        image: const DecorationImage(
                            image: AssetImage('assets/quiz_main.jpg'))),
                  ),
                ),
                Expanded(
                  child: pages.elementAt(navigator.currentNavIndex),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Consumer<MainNavigationProvider>(
          builder: (context, navigator, _) => BottomNavigationBar(
            currentIndex: navigator.currentNavIndex,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite), label: 'Liked'),
            ],
            onTap: (value) {
              navigator.currentNavIndex = value;
              navigator.update();
            },
          ),
        ),
      ),
    );
  }
}
