import 'package:flutter/material.dart';

import '../Core/App_theme.dart';
import '../UI Components/BuildText.dart';
import '../UI Components/textFieldWithoutIcon.dart';

class PayScreen extends StatefulWidget {
  const PayScreen({super.key});

  @override
  State<PayScreen> createState() => _PayScreenState();
}

class _PayScreenState extends State<PayScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "lib/images/logo.png",
              height: 20,
              width: 20,
            ),
            const SizedBox(
              width: 10,
            ),
            buildTextTitle("فرصتك في يدك", 20, FontWeight.bold),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 18),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0, right: 20),
                  child: buildTextTitle(
                    "الاسم كامل",
                    14,
                    FontWeight.bold,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    textFieldWithoutIcon("الاسم كامل", 50, 170),
                    textFieldWithoutIcon("الاسم كامل", 50, 170),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 8.0, right: 20),
                  child: buildTextTitle(
                    "الايميل",
                    14,
                    FontWeight.bold,
                  ),
                ),
              ],
            ),
            textFieldWithoutIcon("example@gmail.com", 50, 320),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 8.0, right: 20),
                  child: buildTextTitle(
                    "رقم الهاتف",
                    14,
                    FontWeight.bold,
                  ),
                ),
              ],
            ),
            textFieldWithoutIcon("0000000 218+ ", 50, 320),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0, right: 20),
                  child: buildTextTitle(
                    "تاريخ الميلاد",
                    14,
                    FontWeight.bold,
                  ),
                ),
              ],
            ),
            textFieldWithoutIcon("0000/00/00", 50, 320),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0, right: 20),
                  child: buildTextTitle(
                    "المدينة",
                    14,
                    FontWeight.bold,
                  ),
                ),
              ],
            ),
            textFieldWithoutIcon("اسم المدينة", 50, 320),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0, right: 20),
                  child: buildTextTitle(
                    "عنوان السكن",
                    14,
                    FontWeight.bold,
                  ),
                ),
              ],
            ),
            textFieldWithoutIcon("المنطقة - الشارع", 50, 320)
          ],
        ),
      ),
    );
  }
}
