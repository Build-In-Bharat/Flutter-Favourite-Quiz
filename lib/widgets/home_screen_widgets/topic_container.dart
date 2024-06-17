import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class TopicContainer extends StatelessWidget {
  final int imgNumber;
  final String topicName;
  const TopicContainer(
      {super.key, required this.imgNumber, required this.topicName});

  @override
  Widget build(BuildContext context) {
     final ThemeData theme = Theme.of(context);
    return Stack(
      children: [
        Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.only(bottom: 10),
              margin: EdgeInsets.symmetric(horizontal: 5.w),
              height: 130,
              width: 140,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    topicName,
                    style: theme.textTheme.labelSmall
                  )
                ],
              ),
            )
          ],
        ),
        Positioned(
            child: SizedBox(
          height: 100,
          child: Image.asset("assets/images/${imgNumber + 6}.png"),
        ))
      ],
    );
  }
}
