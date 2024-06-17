import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:id8nxt_quiz_app/provider/favourites_provider.dart';
import 'package:id8nxt_quiz_app/widgets/favourite_screen_widgets/question_container.dart';
import 'package:provider/provider.dart';

class FavouritesPage extends StatefulWidget {
  const FavouritesPage({super.key});

  @override
  State<FavouritesPage> createState() => _FavouritesPageState();
}

class _FavouritesPageState extends State<FavouritesPage> {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [Color(0XFF604791), Color(0XFF241D47)],
              begin: Alignment.topRight,
              end: Alignment.center)),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Your Favourites!",
                      style: theme.textTheme.headlineLarge),
                  Text("Your liked Quizes will appear here.",
                      style: theme.textTheme.headlineMedium!.copyWith(
                          color: Colors.white.withOpacity(0.5),
                          fontSize: 15.sp)),
                  const SizedBox(
                    height: 40,
                  ),
                  Consumer<FavouritesProvider>(
                    builder: (context, favouritesProvider, child) {
                      if (favouritesProvider.quizes.isEmpty) {
                        return Center(
                          child: Column(
                            children: [
                              Icon(
                                Icons.heart_broken_rounded,
                                color: Colors.white,
                                size: 100.sp,
                              ),
                              Text(
                                "No Favourites to\nshow here",
                                style: theme.textTheme.headlineMedium,
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        );
                      }
                      return Column(
                        children: [
                          ...List.generate(
                              favouritesProvider.quizes.length,
                              (index) => QuestionContainer(
                                    quiz: favouritesProvider.quizes[index],
                                    onDismissed: (direction) {
                                      favouritesProvider.removeFromFavourite(
                                          favouritesProvider.quizes[index]);
                                    },
                                  ))
                        ],
                      );
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
