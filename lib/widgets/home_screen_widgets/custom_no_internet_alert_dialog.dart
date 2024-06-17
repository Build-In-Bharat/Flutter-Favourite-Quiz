import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:id8nxt_quiz_app/widgets/home_screen_widgets/custom_error.dart';

class CustomInternetError extends StatelessWidget {
  final VoidCallback tryAgain;
  const CustomInternetError({super.key, required this.tryAgain});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(
          'assets/icons/noInternet.svg',
          height: 200.h,
          fit: BoxFit.cover,
        ),
        SizedBox(
          height: 10,
        ),
        Center(
          child: Text(
            'Please connect to a stable Internet Connection to carry out the operation.',
            style: GoogleFonts.robotoMono(color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        customTryButton(onPressed: tryAgain),
      ],
    );
  }
}
