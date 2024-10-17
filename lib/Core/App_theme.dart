import 'package:flutter/material.dart';

final primaryColor = Color(0xFFEFEFEF);
final secondaryColor = Color(0xFFF59039);
final borderColor = Color(0xFFBCBCBC);

final appTheme = ThemeData(
appBarTheme: AppBarTheme(
backgroundColor: primaryColor,
centerTitle: false,
), // AppBarTheme
brightness: Brightness.light,
primaryColor: primaryColor,
  scaffoldBackgroundColor: primaryColor,
  colorScheme: ColorScheme.light(
    primary: secondaryColor,
),
progressIndicatorTheme: ProgressIndicatorThemeData(color: Colors.grey),
floatingActionButtonTheme: FloatingActionButtonThemeData(
backgroundColor: secondaryColor,
foregroundColor: primaryColor,
), // FloatingActionButtonThemeData
  inputDecorationTheme: InputDecorationTheme(
    floatingLabelStyle: TextStyle(color: primaryColor),
  ),
  fontFamily: "Tajawal",

);