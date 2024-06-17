import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


Container optionContainer(
    {required int index,
    required String option,
    required String description,
    required ThemeData theme}) {
  return Container(
    margin: const EdgeInsets.only(bottom: 8),
    padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15),
    decoration: BoxDecoration(
      color: const Color(0XFF604791),
      borderRadius: BorderRadius.circular(20),
    ),
    child: Row(
      children: [
        Text("$index.", style: theme.textTheme.bodyLarge),
        SizedBox(
          width: 20.w,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(option, style: theme.textTheme.bodyMedium),
              Text(
                description,
                style: theme.textTheme.headlineSmall!.copyWith(
                    color: Colors.white,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w500),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        )
      ],
    ),
  );
}
