import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final Widget child;
  final VoidCallback onPressed;

  const Button({super.key, required this.child, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        height: 60,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(100),
        ),
        child: Center(
            child: child),
      ),
    );
  }
}
