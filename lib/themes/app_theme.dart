import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Color(0xff673ab7);
  static const Color primaryDark = Color(0xff320b86);
  static const Color primaryLight = Color(0xff9a67ea);
  static const String fontName = 'WorkSans';
  static const Color backgroundColor =  Color(0xFFF2F3F8);
  static const Color grey = Color(0xFF3A5160);
  static const Color darkText = Color(0xFF253840);
  static const Color lightText = Color(0xFF4A6572);

  static const TextTheme textTheme = TextTheme(
    bodyText2: body2,
    bodyText1: body1,
  );
  static const TextStyle body2 = TextStyle( // body1 -> body2
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 12,
    letterSpacing: 0.2,
    color: darkText,
  );

  static const TextStyle body1 = TextStyle( // body2 -> body1
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 16,
    letterSpacing: -0.05,
    color: darkText,
  );
}
