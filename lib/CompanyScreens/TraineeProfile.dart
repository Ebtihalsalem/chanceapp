import 'dart:ui';

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';

import '../../UI Components/BottomBar.dart';

class TraineeProfile extends StatefulWidget {
  const TraineeProfile({super.key});

  @override
  State<TraineeProfile> createState() => _TraineeProfileState();
}

class _TraineeProfileState extends State<TraineeProfile> {
  List<String> tabs = ["حــول", "النشــاط"];


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


  final Map<DateTime, String> activities = {
    DateTime(2024, 1, 1): "بداية النشاط",
    DateTime(2024, 2, 10): "تدريب مكثف",
    DateTime(2024, 2, 15): "مشاركة في ورشة عمل",
    DateTime(2024, 3, 20): "تقديم مشروع",
    DateTime(2024, 3, 25): "حضور مؤتمر",
  };

  List<String> tipsList = ["CX","UX","EUX"];

  int _currentTab = 0;

  Widget screensTabs()
  {
    switch(_currentTab){
      case 0:
        return _borderBox();
      case 1:
        return activations();
      default:
        return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Image.asset(
              "lib/images/empty-hallway-office-building.jpg",
              fit: BoxFit.cover,
              width: 600,
              height:200,
            ),
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0),
              child: Container(
                height: double.infinity,
                width: double.infinity,
                color: Colors.black.withOpacity(0.3),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Expanded(
                  flex: 4,
                  child: SizedBox(height: 10),
                ),
                Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.topCenter,
                  children: [
                    Container(
                      height: 650,
                      width: double.infinity,
                      padding: const EdgeInsets.fromLTRB(18, 90, 18, 50),
                      decoration: const BoxDecoration(
                        color: Color(0xFFEFEFEF),
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: Column(
                          children: [
                            _buildHeaderTextTitle(
                                "سارة أحمد",
                                16,
                                FontWeight.bold),
                            Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: _buildHeaderText(
                                  "لخدمات تقنية المعلومات والاستشارات\n في مجال تقنية المعلومات",
                                  10,
                                  FontWeight.normal,
                                  const Color(0xFF848484)),
                            ),

                            SizedBox(
                                height: 70,
                                width: double.infinity,
                                child: _tabs()),
                            Flexible(
                              child: SingleChildScrollView(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: screensTabs(),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: -70,
                      child: CircleAvatar(
                        radius: 60,
                        backgroundColor: Colors.white,
                        child: ClipOval(
                          child: Image.asset(
                            "lib/images/portrait-smiling-woman.jpg",
                            width: 130,
                            height: 130,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
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
      String text, double fontSize, FontWeight fontWeight, Color fontColor) {
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
      String text, double fontSize, FontWeight fontWeight) {
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
  Widget _tabs() {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: tabs.map((tab) {
          int index = tabs.indexOf(tab);
          return GestureDetector(
            onTap: () {
              setState(() {
                _currentTab = index;
              });
            },
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 10,
                    top: 7,
                  ),
                  child: _buildHeaderTextTitle(tab, 13, FontWeight.normal),
                ),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.only(top: 5),
                  height: 2,
                  width: 100,
                  color: _currentTab == index ? const Color(0xFFF59039) : Colors.transparent,
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }


  Widget _buildOvalContainer(
      String text, Color color, Color borderColor, Color fontColor) {
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

  Widget avaibleTrianing() {
    return Container(
      height: 130,
      width: 344,
      decoration: BoxDecoration(
        color: const Color(0xFFF59039),
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 18,vertical: 18),
      child: Column(
        children: [

          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildHeaderText('مساعدة مدير', 14, FontWeight.bold,
                          const Color(0xffEFEFEF)),
                    ],
                  ),
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Image.asset(
                        "lib/images/tdesign_location.png",
                        height: 16,
                        width: 16,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: _buildHeaderText(
                            'مصراتة', 10, FontWeight.bold, const Color(0xffEFEFEF)),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      const Icon(EvaIcons.clockOutline,color: Color(0xFFEFEFEF),size: 16,),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: _buildHeaderText("شهرين", 10, FontWeight.bold,const Color(0xFFEFEFEF)),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      const Icon(EvaIcons.peopleOutline,color: Color(0xFFEFEFEF),size: 16,),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: _buildHeaderText("20", 10, FontWeight.bold,const Color(0xFFEFEFEF)),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      const Icon(Icons.monetization_on_outlined,color: Color(0xFFEFEFEF),size: 16,),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: _buildHeaderText("يوجد", 10, FontWeight.bold,const Color(0xFFEFEFEF)),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              const SizedBox(width: 60),
              _buildOvalContainer('شبكات واتصالات', const Color(0xFFF3F3F3),
                  const Color(0xFFBBBBBB), const Color(0xFFF59039)),
              const SizedBox(width: 8),
              _buildOvalContainer('علوم حاسوب', const Color(0xFFF3F3F3),
                  const Color(0xFFBBBBBB), const Color(0xFFF59039)),
            ],
          ),
        ],
      ),
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


  Widget _contentText(List<Map<String, String>> dataList,String maintitle) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildHeaderTextTitle(maintitle, 16, FontWeight.bold),
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

  void _showActivityDialog(DateTime date, String activity) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("النشاط في ${date.day}/${date.month}"),
          content: Text(activity),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: _buildHeaderText("حسنًا", 16, FontWeight.normal,const Color(0xFFF59039))
            ),
          ],
        );
      },
    );
  }

  Widget activations(){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Align(
              alignment: Alignment.centerRight,
              child: _buildHeaderTextTitle(
                  "النشاط التدريبي", 18, FontWeight.bold)),
          const SizedBox(
            height: 40,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                HeatMap(
                  startDate: DateTime(DateTime.now().year, 1, 1),
                  endDate: DateTime(DateTime.now().year, 12, 30),
                  datasets: {
                    DateTime(2024, 1, 1): 1,
                    DateTime(2024, 2, 10): 5,
                    DateTime(2024, 2, 15): 3,
                    DateTime(2024, 3, 20): 4,
                    DateTime(2024, 3, 25): 5,
                  },
                  scrollable: true,
                  colorMode: ColorMode.opacity,
                  defaultColor: const Color(0xfff1f1f1),
                  textColor: Colors.black87,
                  showColorTip: true,
                  onClick: (value) {
                    if (activities.containsKey(value)) {

                      _showActivityDialog(value, activities[value]!);
                    } else {
                      _showActivityDialog(value, "لا توجد نشاطات مسجلة.");
                    }
                  },
                  colorsets: const {
                    1: Color(0xFFFDC89A),
                    2: Color(0xFFFFBC82),
                    3: Color(0xFFFCAF6C),
                    4: Color(0xFFF5A057),
                    5: Color(0xFFF7923A),
                  },
                  margin: const EdgeInsets.all(1),
                  borderRadius: 4,
                ),
              ],
            ),
          ),
        ],
      ),
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
