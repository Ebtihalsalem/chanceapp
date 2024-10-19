import 'package:chanceapp/Core/App_theme.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

import '../TraineeScreens/Boxes.dart';
import 'BuildText.dart';
import 'Cards.dart';
import 'ContentText.dart';
import 'ContentTextGeneral.dart';

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

Widget aboutTabForTrainee(bool edit) {
  return Container(
    padding: const EdgeInsets.all(8),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 357,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: const Color(0xFFBBBBBB))),
          padding: const EdgeInsets.symmetric(horizontal: 18,vertical: 18),
          child: contentTextGeneral(detailsList,"التفاصيل العامة",edit),
        ),
        const SizedBox(height: 20,),
        Container(

          width: 357,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: const Color(0xFFBBBBBB))),
          padding: const EdgeInsets.symmetric(horizontal: 18,vertical: 18),
          child: boxesSkills(personalSkillsList,"المهارات الشخصية",edit),
        ),
        const SizedBox(height: 20,),
        Container(
          width: 357,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: const Color(0xFFBBBBBB))),
          padding: const EdgeInsets.symmetric(horizontal: 18,vertical: 18),
          child: contentText(ExList,"الخبرة",edit),
        ),
        const SizedBox(height: 20,),
        Container(

          width: 357,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: const Color(0xFFBBBBBB))),
          padding: const EdgeInsets.symmetric(horizontal: 18,vertical: 18),
          child: contentText(educationList,"التعليــم",edit),
        ),
        const SizedBox(height: 20,),
        Container(

          width: 357,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: const Color(0xFFBBBBBB))),
          padding: const EdgeInsets.symmetric(horizontal: 18,vertical: 18),
          child: boxesSkills(langList,"اللغـات",edit),
        ),
        const SizedBox(height: 20,),
        Container(

          width: 357,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: const Color(0xFFBBBBBB))),
          padding: const EdgeInsets.symmetric(horizontal: 18,vertical: 18),
          child: boxesSkills(skillsList,"المهارات التقنية",edit),
        ),
      ],
    ),
  );
}
