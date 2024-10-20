import 'dart:ui'; // إضافة هذا السطر
import 'package:flutter/material.dart';
import 'package:chanceapp/Screens/LoginScreen.dart';

class UIComponents {
  /// إنشاء الخلفية كصورة
  static Widget buildBackgroundImage() {
    return Image.asset(
      "lib/images/backgroundFill3.jpg",
      fit: BoxFit.cover,
      width: double.infinity,
      height: double.infinity,
    );
  }

  /// إضافة فلتر ضبابي على الشاشة
  static Widget buildBlurEffect() {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0),
      child: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.black.withOpacity(0.2),
      ),
    );
  }

  /// بناء النص الرئيسي
  static Widget buildMainText() {
    return const Padding(
      padding: EdgeInsets.only(top: 50.0),
      child: Text(
        "مستقبلك المهني يبدأ هنا!! ",
        style: TextStyle(
          color: Color(0xFFF59039),
          fontSize: 27,
          fontWeight: FontWeight.bold,
          fontFamily: "Tajawal",
        ),
      ),
    );
  }

  /// بناء النص الوصفي
  static Widget buildDescriptionText() {
    return const Align(
      alignment: Alignment.centerRight,
      child: Text(
        "- ربط الخريجين بالشركات وتطوير المهارات المطلوبة.",
        style: TextStyle(
          color: Colors.black,
          fontSize: 13,
          fontWeight: FontWeight.normal,
          fontFamily: "Tajawal",
        ),
      ),
    );
  }

  /// بناء زر البداية
  static Widget buildStartButton(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFF59039),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const Loginscreen(),
            ),
          );
        },
        child: const Text(
          "ابـــدأ",
          textDirection: TextDirection.rtl,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontFamily: "Tajawal",
          ),
        ),
      ),
    );
  }

  /// بناء زر عام
  static Widget buildGeneralButton(String text, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFFF59039),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontFamily: "Tajawal",
        ),
      ),
    );
  }

  /// بناء عنوان
  static Widget buildHeader(String title) {
    return Text(
      title,
      style: const TextStyle(
        color: Color(0xFFF59039),
        fontSize: 24,
        fontWeight: FontWeight.bold,
        fontFamily: "Tajawal",
      ),
    );
  }

  /// بناء نص فرعي
  static Widget buildSubtitle(String subtitle) {
    return Text(
      subtitle,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 16,
        fontWeight: FontWeight.normal,
        fontFamily: "Tajawal",
      ),
    );
  }

  /// بناء النص الرئيسي مع خيارات حجم الخط والوزن
  static Widget buildHeaderText(String text, double fontSize, FontWeight fontWeight) {
    return Text(
      text,
      style: TextStyle(
        color: const Color(0xff4A4C4D),
        fontSize: fontSize,
        fontWeight: fontWeight,
        fontFamily: "Tajawal",
      ),
      textAlign: TextAlign.right,
      textDirection: TextDirection.rtl,
    );
  }
  static  Widget _buildTopLine() {
    return Container(
      height: 3,
      width: 200,
      color: Colors.grey,
    );
  }


  // Changed from private to public
  static Widget buildTopLine() {
    return Container(
      height: 3,
      width: 200,
      color: Colors.grey,
    );
  }
}
