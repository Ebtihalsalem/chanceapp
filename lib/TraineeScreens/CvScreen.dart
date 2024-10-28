import 'package:chanceapp/UI%20Components/CenterAppBar.dart';
import 'package:chanceapp/UI%20Components/CircleImg.dart';
import 'package:chanceapp/UI%20Components/aboutTabForTrainee.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

import '../../UI Components/BottomBar.dart';
import '../Core/App_theme.dart';
import '../UI Components/BuildText.dart';

class CvScreen extends StatefulWidget {
  const CvScreen({super.key});

  @override
  State<CvScreen> createState() => _CvScreenState();
}

class _CvScreenState extends State<CvScreen> {


  List<Map<String, String>> educationList = [
    {"title": "الشهادة الثانوية", "year": "2018","place": "أسماء للبنات"},
    {"title": "الشهادة الجامعية", "year": "2022","place": "جامعة مصراتة - كلية تقنية المعلومات"},
  ];

  List<Map<String, String>> ExList = [
    {"title": "مصممة UI", "year": "2022-2023","place": "شركة لمة"},
  ];
  List<Map<String, String>> detailsList = [
    {"phone": "092 4575363", "email": "sara1@gmail.com","place": "مصراتة-شارع طرابلس","birth":"12/4/2000"},
  ];

  List<String> personalSkillsList = [
    "حس المسؤولية", "التواصل مع الأخرين", "العمل مع فريق","قدرات إبداعية",
  ];

  List<String> langList = [
    "العربية", "الانجليزية"
  ];

  List<String> skillsList = [
    "أدوبي فوتوشوب", "أدوبي xd","فيجما","ميكروسوفت اوفس","C++","Dart","Flutter","Kotlin","C#",
    "python","Java","JS"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: centerAppBar(context,"الملف الشخصي")
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 35.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            circleImg("lib/images/portrait-smiling-woman.jpg"),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child:
                    buildTextTitle('ســارة أحمد', 18, FontWeight.bold),
              ),
            ),
            Flexible(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  // child: aboutTabForTrainee(true),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const Padding(
        padding: EdgeInsets.only(bottom: 20.0, left: 20, right: 20),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(30)),
          child: BottomBar(),
        ),
      ),
    );
  }

}
