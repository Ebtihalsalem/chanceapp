import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Core/App_theme.dart';

Widget textField(String text,IconData? icon,double h,double w,TextEditingController? controll,bool pas){
  return SizedBox(
    width: w,
    height: h,
    child: TextField(
      controller: controll,
      obscureText:pas,
      decoration: InputDecoration(
        hintText: text,
        hintStyle: const TextStyle(color: Color(0xFFBBBBBB),fontFamily: "Tajawal"),
        filled: true,
        fillColor: const Color(0xFFFDFDFD),
        prefixIcon: Icon(icon,
            color: const Color(0xFFBBBBBB)),
        border: OutlineInputBorder(
          borderSide: BorderSide(
              color: borderColor),
          borderRadius: BorderRadius.circular(30),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: borderColor),
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