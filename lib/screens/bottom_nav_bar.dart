import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:id8nxt_quiz_app/core/theme/colors.dart';
import 'package:id8nxt_quiz_app/provider/quiz_provider.dart';
import 'package:id8nxt_quiz_app/screens/favourites_screen.dart';
import 'package:id8nxt_quiz_app/screens/home_screen.dart';
import 'package:provider/provider.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  final List<Widget> _pages = [const HomeScreen(), const FavouritesPage()];
  int _selectedIndex = 0;


  @override
  void initState() {
    
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<QuizProvider>().getQuizes();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: Container(
        color: AppColors.darkPurple,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: GNav(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          color: AppColors.ivory,
          activeColor: AppColors.ivory,
          gap: 10,
          tabBackgroundColor: Colors.white.withOpacity(0.3),
          padding: const EdgeInsets.all(12),
          selectedIndex: _selectedIndex,
          onTabChange: (index) => setState(() {
            _selectedIndex = index;
          }),
          tabs: const [
            GButton(
              icon: Icons.home,
              text: "Home",
            ),
            GButton(
              icon: Icons.favorite_rounded,
              text: "Favourites",
            ),
          ],
        ),
      ),
    );
  }
}
