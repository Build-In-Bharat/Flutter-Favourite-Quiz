import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:id8nxt_quiz_app/core/routes/named_routes.dart';
import 'package:id8nxt_quiz_app/data/models/quiz_model.dart';
import 'package:id8nxt_quiz_app/provider/favourites_provider.dart';
import 'package:id8nxt_quiz_app/provider/heart_animation_provider.dart';
import 'package:id8nxt_quiz_app/widgets/home_screen_widgets/heart_animating_util.dart';
import 'package:provider/provider.dart';

class QuizContainer extends StatefulWidget {
  final QuizModel quizModel;
  final int index;
  const QuizContainer(
      {super.key, required this.quizModel, required this.index});

  @override
  State<QuizContainer> createState() => _QuizContainerState();
}

class _QuizContainerState extends State<QuizContainer> {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, Routes.questionScreen,
          arguments: widget.quizModel),
      onDoubleTap: () {
        Provider.of<FavouritesProvider>(context, listen: false)
            .addToFavourite(widget.quizModel);
        Provider.of<HeartAnimationProvider>(context, listen: false)
            .toggleAnimationsVisibility();
      },
      child: Stack(
        children: [
          Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 300.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                margin: EdgeInsets.symmetric(horizontal: 5.w),
                padding: EdgeInsets.only(
                  top: 5.h,
                  left: 15.w,
                  bottom: 5.h,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Align(
                        alignment: Alignment.centerRight,
                        child: Consumer<FavouritesProvider>(
                          builder: (context, favouritesProvider, child) {
                            bool isFavourite = favouritesProvider
                                .isFavourite(widget.quizModel);
                            return IconButton(
                                iconSize: 45.sp,
                                onPressed: () {
                                  isFavourite
                                      ? favouritesProvider
                                          .removeFromFavourite(widget.quizModel)
                                      : favouritesProvider
                                          .addToFavourite(widget.quizModel);
                                  isFavourite = favouritesProvider
                                      .isFavourite(widget.quizModel);
                                },
                                icon: Icon(
                                  isFavourite
                                      ? Icons.favorite_rounded
                                      : Icons.favorite_border_rounded,
                                  color:
                                      isFavourite ? Colors.red : Colors.black,
                                ));
                          },
                        )),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 190.w,
                          child: Text(
                            widget.quizModel.title!,
                            style: theme.textTheme.labelMedium,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Text(
                          widget.quizModel.numberOfQuestions.toString(),
                          style: theme.textTheme.labelLarge,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            top: 0,
            left: 0,
            child: SizedBox(
              height: 250.w,
              child: Image.asset("assets/images/${widget.index + 1}.png"),
            ),
          ),
          Center(
              child: Opacity(
            opacity: Provider.of<HeartAnimationProvider>(context).isAnimating
                ? 1
                : 0,
            child: HeartAnimationUtil(
              isAnimating:
                  Provider.of<HeartAnimationProvider>(context).isAnimating,
              duration: const Duration(milliseconds: 700),
              onEnd: () {
                Provider.of<HeartAnimationProvider>(context, listen: false)
                    .toggleAnimationsVisibility();
              },
              child: Icon(
                Icons.favorite_rounded,
                color: Colors.red,
                size: 100.sp,
              ),
            ),
          ))
        ],
      ),
    );
  }
}
