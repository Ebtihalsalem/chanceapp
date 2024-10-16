import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

import '../../UI Components/BottomBar.dart';

class CvScreen extends StatefulWidget {
  const CvScreen({super.key});

  @override
  State<CvScreen> createState() => _CvScreenState();
}

class _CvScreenState extends State<CvScreen> {

  final int _selectedIndex = 0;

  // final List<Widget> _screens = [
  //   HomeScreen(),
  //   SavedScreen(),
  //   TrianingDetils(),
  //   MyAccount(),
  // ];



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
        backgroundColor: Colors.white,
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
            const Text("الملف الشخصي",
                style: TextStyle(
                    fontFamily: "Tajawal",
                    fontSize: 20,
                    color: Color(0xFF4A4C4D),
                    fontWeight: FontWeight.bold)),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 35.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 51.5,
                backgroundColor: Colors.white,
                child: ClipOval(
                  child: Image.asset(
                    "lib/images/portrait-smiling-woman.jpg",
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child:
                    _buildHeaderTextTitle('ســارة أحمد', 18, FontWeight.bold),
              ),
            ),
            Flexible(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: _borderBox(),
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



  Widget _buildHeaderText(
    String text,
    double fontSize,
    FontWeight fontWeight,
    Color fontColor,
  ) {
    return Text(
      text,
      style: TextStyle(
        color: fontColor,
        fontSize: fontSize,
        fontWeight: fontWeight,
        fontFamily: "Tajawal",
      ),
      textAlign: TextAlign.center,
      textDirection: TextDirection.rtl,
    );
  }

  Widget _buildHeaderTextTitle(
    String text,
    double fontSize,
    FontWeight fontWeight,
  ) {
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

  Widget _buildCategory(String title, String year) {
    return  Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 70),
            child:  _buildHeaderTextTitle(title, 13, FontWeight.bold),
          ),
          _buildHeaderTextTitle(year, 12, FontWeight.bold)
        ],

    );
  }

  Widget _borderBox() {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 220,
            width: 357,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: const Color(0xFFBBBBBB))),
            padding: const EdgeInsets.symmetric(horizontal: 18,vertical: 18),
            child: _contentTextd(detailsList,"التفاصيل العامة"),
          ),
          const SizedBox(height: 20,),
          Container(
            height: 180,
            width: 357,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: const Color(0xFFBBBBBB))),
            padding: const EdgeInsets.symmetric(horizontal: 18,vertical: 18),
            child: _boxesSkills(personalSkillsList,"المهارات الشخصية"),
          ),
          const SizedBox(height: 20,),
          Container(
            height: 130,
            width: 357,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: const Color(0xFFBBBBBB))),
            padding: const EdgeInsets.symmetric(horizontal: 18,vertical: 18),
            child: _contentText(ExList,"الخبرة"),
          ),
          const SizedBox(height: 20,),
          Container(
            height: 190,
            width: 357,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: const Color(0xFFBBBBBB))),
            padding: const EdgeInsets.symmetric(horizontal: 18,vertical: 18),
            child: _contentText(educationList,"التعليــم"),
          ),
          const SizedBox(height: 20,),
          Container(
            height: 140,
            width: 357,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: const Color(0xFFBBBBBB))),
            padding: const EdgeInsets.symmetric(horizontal: 18,vertical: 18),
            child: _boxesSkills(langList,"اللغـات"),
          ),
          const SizedBox(height: 20,),
          Container(
            height: 200,
            width: 357,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: const Color(0xFFBBBBBB))),
            padding: const EdgeInsets.symmetric(horizontal: 18,vertical: 18),
            child: _boxesSkills(skillsList,"المهارات التقنية"),
          ),
        ],
      ),
    );
  }
  Widget _buildOvalContainer(String text, Color color, Color borderColor,
      Color fontColor) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: borderColor),
      ),
      child: _buildHeaderText(text, 10, FontWeight.bold, fontColor),
    );
  }

  Widget _contentText(List<Map<String, String>> dataList,String maintitle) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildHeaderTextTitle(maintitle, 16, FontWeight.bold),
            const Icon(EvaIcons.editOutline, color: Color(0xFFF59039), size: 20),
          ],
        ),
        const SizedBox(height: 18.0),
        ...dataList.map((data) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildCategory(data["title"]!, data["year"]!),
              if (data["place"] != null && data["place"]!.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(left: 70),
                  child: _buildHeaderTextTitle(data["place"]!, 10, FontWeight.normal),
                ),
              const SizedBox(height: 18.0),
            ],
          );
        }),
      ],
    );



}

  Widget _contentTextd(List<Map<String, String>> dataList,String maintitle) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildHeaderTextTitle(maintitle, 16, FontWeight.bold),
            const Icon(EvaIcons.editOutline, color: Color(0xFFF59039), size: 20),
          ],
        ),
        const SizedBox(height: 18.0),
        ...dataList.map((data) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeaderTextTitle(data["phone"]!,14, FontWeight.normal),
              const SizedBox(height: 18.0),
              _buildHeaderTextTitle(data["email"]!,14, FontWeight.normal),
              const SizedBox(height: 18.0),
              _buildHeaderTextTitle(data["place"]!,14, FontWeight.normal),
              const SizedBox(height: 18.0),
              _buildHeaderTextTitle(data["birth"]!,14, FontWeight.normal),
            ],
          );
        }),
      ],
    );



  }

  Widget _boxesSkills(List<String> dataList, String maintitle) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildHeaderTextTitle(maintitle, 16, FontWeight.bold),
            const Icon(EvaIcons.editOutline, color: Color(0xFFF59039), size: 20),
          ],
        ),
        const SizedBox(height: 18.0),
        Wrap(
          spacing: 4.0,
          runSpacing: 4.0,
          children: dataList.map((data) {
            return Padding(
              padding: const EdgeInsets.all(4.0),
              child: _buildOvalContainer(
                data,
                const Color(0xFFF59039),
                const Color(0xFFF59039),
                const Color(0xFFEAEAEA),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }


}
