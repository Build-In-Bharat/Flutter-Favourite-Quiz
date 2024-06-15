import 'package:flutter/material.dart';

class ColorConstants {
  static const Color bgColor = Color(0xFF000000);
  static const List<Color> gradient = [
    Color(0xFF6228F4),
    Color(0xFFD659B7),
  ];
  static const List<Color> cardColors = [
    Color(0xFFF6D454),
    Color(0xFFBCFBF8),
  ];
}

class TextConstants {
  static const TextStyle heading1 =
      TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white);
  static const TextStyle cardTitle = TextStyle(
      fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF000000));
  static const TextStyle cardSubtitle = TextStyle(
      fontSize: 12, fontWeight: FontWeight.normal, color: Color(0xFF000000));
}
