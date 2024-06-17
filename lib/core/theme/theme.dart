import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:id8nxt_quiz_app/core/theme/colors.dart';

class AppTheme {
  AppTheme._();

  static ThemeData theme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.light(
        brightness: Brightness.light,
        primary: AppColors.lightPurple,
        secondary: AppColors.darkPurple,
        tertiary: AppColors.ivory),
        appBarTheme: AppBarTheme(iconTheme: IconThemeData(color: AppColors.ivory)),
    textTheme: TextTheme(
      headlineLarge: GoogleFonts.lora(
          color: AppColors.ivory, fontSize: 30.sp, fontWeight: FontWeight.bold),
      headlineMedium:
          GoogleFonts.robotoSlab(color: AppColors.ivory, fontSize: 20.sp),
      headlineSmall: GoogleFonts.robotoSlab(
          color: AppColors.ivory, fontSize: 20.sp, fontWeight: FontWeight.bold),
      labelLarge: GoogleFonts.montserratAlternates(
          height: 0.8,
          fontSize: 100.sp,
          fontWeight: FontWeight.w700,
          color: AppColors.darkPurple),
      labelMedium: GoogleFonts.montserratAlternates(
          fontSize: 25.sp,
          fontWeight: FontWeight.w700,
          color: AppColors.darkPurple,
          height: 1),
      labelSmall: GoogleFonts.montserratAlternates(
          fontSize: 15.sp,
          fontWeight: FontWeight.w700,
          color: AppColors.darkPurple,
          height: 1),
      bodyLarge: GoogleFonts.poppins(
          fontSize: 25.sp,
          fontWeight: FontWeight.w700,
          color: AppColors.ivory,
          height: 1.2),
      bodyMedium: GoogleFonts.poppins(
          fontSize: 16.sp,
          fontWeight: FontWeight.w700,
          color: AppColors.ivory,
          height: 1.2),
    ),
  );
}
