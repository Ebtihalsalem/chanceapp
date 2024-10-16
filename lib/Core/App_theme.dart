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
    // border: OutlineInputBorder(
    //   borderSide: const BorderSide(
    //       color: Color(0xFFBCBCBC)),
    //   borderRadius: BorderRadius.circular(30),
    // ),
    // enabledBorder: OutlineInputBorder(
    //   borderSide: const BorderSide(
    //       color: Color(0xFFBCBCBC)),
    //   borderRadius: BorderRadius.circular(30),
    // ),
    // focusColor: secondaryColor,
    // focusedBorder: OutlineInputBorder(
    //   borderSide: BorderSide(color: secondaryColor),
    //   borderRadius: BorderRadius.circular(30),
    // ),
  ),
  fontFamily: "Tajawal",

);