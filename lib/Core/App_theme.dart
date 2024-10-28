import 'package:flutter/material.dart';

final backgroundColor = Color(0xFFE8E8E8);
final primaryColor = Color(0xFFF26419);
final secondaryColor = Color(0xFF077187);
final borderColor = Color(0xFFBCBCBC);
final fontColorBlack = Color(0xFF4A4C4D);
final whiteApp = Color(0xFFF3F3F3);

final appTheme = ThemeData(
appBarTheme: AppBarTheme(
backgroundColor: backgroundColor,
centerTitle: false,
), // AppBarTheme
brightness: Brightness.light,
primaryColor: primaryColor,
  scaffoldBackgroundColor: backgroundColor,
  colorScheme: ColorScheme.light(
    primary: secondaryColor,
),
progressIndicatorTheme: ProgressIndicatorThemeData(color: primaryColor),
floatingActionButtonTheme: FloatingActionButtonThemeData(
backgroundColor: secondaryColor,
foregroundColor: backgroundColor,
), // FloatingActionButtonThemeData
  inputDecorationTheme: InputDecorationTheme(
    floatingLabelStyle: TextStyle(color: primaryColor),
  ),
  fontFamily: "Tajawal",

);
