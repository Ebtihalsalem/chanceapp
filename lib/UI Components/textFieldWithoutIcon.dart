import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Core/App_theme.dart';

Widget textFieldWithoutIcon(String text,double h,double w){
  return SizedBox(
    width: w,
    height: h,
    child: TextField(
      decoration: InputDecoration(
        hintText: text,
        hintStyle: const TextStyle(color: Color(0xFFBBBBBB),fontFamily: "Tajawal"),
        filled: true,
        fillColor: whiteApp,
        border: OutlineInputBorder(
          borderSide: BorderSide(
              color: Colors.transparent),
          borderRadius: BorderRadius.circular(30),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: Colors.transparent),
          borderRadius: BorderRadius.circular(30),
        ),
        focusColor: secondaryColor,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: secondaryColor),
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    ),
  );
}