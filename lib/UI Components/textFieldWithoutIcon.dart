// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// import '../Core/App_theme.dart';
//
// Widget textFieldWithoutIcon(String text,double h,double w){
//   return SizedBox(
//     width: w,
//     height: h,
//     child: TextField(
//       decoration: InputDecoration(
//         hintText: text,
//         hintStyle: const TextStyle(color: Color(0xFFBBBBBB),fontFamily: "Tajawal"),
//         filled: true,
//         fillColor: const Color(0xFFFDFDFD),
//         border: OutlineInputBorder(
//           borderSide: BorderSide(
//               color: borderColor),
//           borderRadius: BorderRadius.circular(30),
//         ),
//         enabledBorder: OutlineInputBorder(
//           borderSide: BorderSide(
//               color: borderColor),
//           borderRadius: BorderRadius.circular(30),
//         ),
//         focusColor: secondaryColor,
//         focusedBorder: OutlineInputBorder(
//           borderSide: BorderSide(color: secondaryColor),
//           borderRadius: BorderRadius.circular(30),
//         ),
//       ),
//     ),
//   );
// }
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // تأكد من استيراد هذا

import '../Core/App_theme.dart';

Widget textFieldWithoutIcon(String text, double h, double w, {List<TextInputFormatter>? inputFormatters}) {
  return SizedBox(
    width: w,
    height: h,
    child: TextField(
      keyboardType: TextInputType.text, // إضافة هذه السطر
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
        hintText: text,
        hintStyle: const TextStyle(color: Color(0xFFBBBBBB), fontFamily: "Tajawal"),
        filled: true,
        fillColor: const Color(0xFFFDFDFD),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: borderColor),
          borderRadius: BorderRadius.circular(30),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: borderColor),
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

Widget buildFieldWithAddButton(String title, String hint, String buttonText, String action) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Expanded(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 8.0, right: 20),
          child: textFieldWithoutIcon(
            hint,
            50,
            200,
            inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[\u0600-\u06FF ]'))], // السماح بإدخال الأحرف العربية
          ),
        ),
      ),
      ElevatedButton(
        onPressed: () {
          // معالجة الزر هنا
        },
        child: Text(buttonText),
      ),
    ],
  );
}