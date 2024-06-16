import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizapp/Components/QuizCard.dart';
import 'package:quizapp/Provider/FavoriteQuizProvider.dart';

class Favorites extends StatefulWidget {
  const Favorites({super.key});

  @override
  State<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  @override
  Widget build(BuildContext context) {
    return Consumer<FavoriteProvider>(
      builder: (context, value, child) => Padding(
        padding: const EdgeInsets.all(10),
        child: ListView.separated(
          shrinkWrap: true,
          itemCount: value.quizes.length,
          separatorBuilder: (context, index) {
            return const SizedBox(
              height: 15,
            );
          },
          itemBuilder: (context, index) {
            return QuizCard(
              quiz: value.quizes[index],
            );
          },
        ),
      ),
    );
  }
}
