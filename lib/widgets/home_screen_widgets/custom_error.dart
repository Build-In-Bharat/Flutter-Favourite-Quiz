import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomError extends StatelessWidget {
  final String errorMessage;
  final VoidCallback tryAgain;
  const CustomError(
      {super.key, required this.errorMessage, required this.tryAgain});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          Icons.running_with_errors_rounded,
          size: 80.sp,
          color: Colors.white,
        ),
        const SizedBox(
          height: 10,
        ),
        Center(
          child: Text(
            errorMessage,
            style: GoogleFonts.robotoMono(color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        customTryButton(onPressed: tryAgain),
      ],
    );
  }
}

CupertinoButton customTryButton({required VoidCallback onPressed}) {
  return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Color(0XFF604791), width: 3),
        ),
        child: Text(
          'Try Again',
          style: GoogleFonts.poppins(
              color: Colors.black, fontWeight: FontWeight.w600),
        ),
      ));
}
