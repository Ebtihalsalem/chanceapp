
import 'package:flutter/cupertino.dart';

Widget buildText(
    String text, double fontSize, FontWeight fontWeight, Color fontColor) {
  return Text(
    text,
    style: TextStyle(
      color: fontColor,
      fontSize: fontSize,
      fontWeight: fontWeight,
    ),
    textAlign: TextAlign.center,
    textDirection: TextDirection.rtl,
  );
}

Widget buildTextTitle(String text, double fontSize,
    FontWeight fontWeight) {
  return Text(
    text,
    style: TextStyle(
      color: const Color(0xff4A4C4D),
      fontSize: fontSize,
      fontWeight: fontWeight,
    ),
    textAlign: TextAlign.right,
    textDirection: TextDirection.rtl,
  );
}