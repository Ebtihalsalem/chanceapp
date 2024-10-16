import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

import '../../UI Components/BottomBar.dart';

class TrainingDetails extends StatefulWidget {
  const TrainingDetails({super.key});

  @override
  State<TrainingDetails> createState() => _TrainingDetailsState();
}

class _TrainingDetailsState extends State<TrainingDetails> {
  List<String> tabs = ["بيانات التدريب", "المتدربين"];

  int _currentTab = 0;

  Widget screensTabs() {
    switch (_currentTab) {
      case 0:
        return _buildRecommendationsSection();
      case 1:
        return SizedBox(
          height: 500,
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: 10,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: _trainees(),
              );
            },
          ),
        );
      default:
        return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: _buildAppBar(),
        backgroundColor: const Color(0xffEFEFEF),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 40.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            TrainingCard(),
            const SizedBox(height: 30),
            SizedBox(height: 70, width: double.infinity, child: _tabs()),
            Flexible(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: screensTabs(),
                ),
              ),
            ),
          ]),
        ),
        bottomNavigationBar: const Padding(
          padding: EdgeInsets.only(bottom: 20.0, left: 20, right: 20),
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            child: BottomBar(),
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.grey[200],
      title: Padding(
        padding: const EdgeInsets.only(top: 18, right: 18.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              "lib/images/logo.png",
              height: 25,
              width: 25,
            ),
            const SizedBox(
              width: 10,
            ),
            const Text("مرحبًا، سارة أحمد !",
                style: TextStyle(
                    fontFamily: "Tajawal",
                    fontSize: 16,
                    color: Color(0xFF4A4C4D),
                    fontWeight: FontWeight.bold)),
          ],
        ),
      ),
      actions: [
        _buildActionButton(EvaIcons.messageCircle, () {}),
        const SizedBox(width: 10),
        Padding(
          padding: const EdgeInsets.only(left: 18.0),
          child: _buildActionButton(EvaIcons.bell, () {
            // التعامل مع الفلترة
          }),
        ),
      ],
    );
  }

  Widget _buildActionButton(IconData icon, VoidCallback onTap) {
    return Container(
      margin: const EdgeInsets.only(top: 18.0, left: 18),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 40,
          width: 40,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xffE7E7E7),
          ),
          child: Icon(
            icon,
            color: const Color(0xFFF59039),
            size: 25,
          ),
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

  Widget TrainingCard() {
    return Container(
      height: 58,
      width: 344,
      decoration: BoxDecoration(
        color: const Color(0xFFF59039),
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: AssetImage('lib/images/acadimic.jpg'),
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildHeaderText('مساعدة مدير', 12, FontWeight.bold,
                          const Color(0xffEFEFEF)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
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
                  color: _currentTab == index
                      ? const Color(0xFFF59039)
                      : Colors.transparent,
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _trainees() {
    return Container(
      height: 90,
      width: 344,
      decoration: BoxDecoration(
          color: const Color(0xFFF3F3F3),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: const Color(0xFFBBBBBB))),
      padding: const EdgeInsets.all(8),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          children: [
            Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage('lib/images/portrait-smiling-woman.jpg'),
                ),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeaderText('ســارة أحمد', 10, FontWeight.bold,
                      const Color(0xFFF59039)),
                  const Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 1.0),
                          child: Icon(
                            EvaIcons.star,
                            size: 13,
                            color: Color(0xFfFFD233),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 1.0),
                          child: Icon(
                            EvaIcons.star,
                            size: 13,
                            color: Color(0xFfFFD233),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 1.0),
                          child: Icon(
                            EvaIcons.star,
                            size: 13,
                            color: Color(0xFfFFD233),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 1.0),
                          child: Icon(
                            EvaIcons.star,
                            size: 13,
                            color: Color(0xFFE6E6E6),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 1.0),
                          child: Icon(
                            EvaIcons.star,
                            size: 13,
                            color: Color(0xFFE6E6E6),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ]),
    );
  }

  // Widget isDoneTraining() {
  //   return Container(
  //     height: 154,
  //     width: 344,
  //     decoration: BoxDecoration(
  //       color: const Color(0xFFF8C293),
  //       borderRadius: BorderRadius.circular(20),
  //     ),
  //     padding: const EdgeInsets.all(8),
  //     child: Column(
  //       children: [
  //         Row(
  //           children: [
  //             Container(
  //               width: 50,
  //               height: 50,
  //               decoration: BoxDecoration(
  //                 image: const DecorationImage(
  //                   image: AssetImage('lib/images/acadimic.jpg'),
  //                 ),
  //                 borderRadius: BorderRadius.circular(10),
  //               ),
  //             ),
  //             Expanded(
  //               child: Padding(
  //                 padding: const EdgeInsets.only(right: 10.0),
  //                 child: Column(
  //                   crossAxisAlignment: CrossAxisAlignment.start,
  //                   children: [
  //                     _buildHeaderText(
  //                         'الأكاديمية البيئية لتكنولوجيا المعلومات',
  //                         12,
  //                         FontWeight.bold,
  //                         const Color(0xffEFEFEF)),
  //                     _buildHeaderText('مساعدة مدير', 12, FontWeight.normal,
  //                         const Color(0xffEFEFEF)),
  //                   ],
  //                 ),
  //               ),
  //             ),
  //             const Padding(
  //               padding: EdgeInsets.only(left: 8.0),
  //               child: Icon(EvaIcons.bookmark, color: Color(0xffEFEFEF)),
  //             ),
  //           ],
  //         ),
  //         const SizedBox(height: 26),
  //         Padding(
  //           padding: const EdgeInsets.only(right: 60.0),
  //           child: Row(
  //             children: [
  //               Image.asset(
  //                 "lib/images/tdesign_location.png",
  //                 height: 15,
  //                 width: 15,
  //               ),
  //               Padding(
  //                 padding: const EdgeInsets.only(right: 4.0),
  //                 child: _buildHeaderText(
  //                     'مصراتة', 12, FontWeight.normal, const Color(0xffEFEFEF)),
  //               ),
  //             ],
  //           ),
  //         ),
  //         const SizedBox(height: 8),
  //         Row(
  //           children: [
  //             const SizedBox(width: 60),
  //             _buildOvalContainer('شبكات واتصالات', const Color(0xFFF3F3F3),
  //                 const Color(0xFFBBBBBB), const Color(0xFFF8C293)),
  //             const SizedBox(width: 8),
  //             _buildOvalContainer('علوم حاسوب', const Color(0xFFF3F3F3),
  //                 const Color(0xFFBBBBBB), const Color(0xFFF8C293)),
  //           ],
  //         ),
  //       ],
  //     ),
  //   );
  // }
  Widget _buildRecommendationsSection() {
    return Column(
      children: [
        Container(
          height: 260,
          width: 344,
          decoration: BoxDecoration(
              color: const Color(0xFFF3F3F3),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: const Color(0xFFBBBBBB))),
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 18.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        const Icon(
                          EvaIcons.clockOutline,
                          color: Color(0xFFF59039),
                          size: 25,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                          child: _buildHeaderText("المدة", 10,
                              FontWeight.normal, const Color(0xFFBBBBBB)),
                        ),
                        _buildHeaderTextTitle("شهرين", 11, FontWeight.bold),
                      ],
                    ),
                    Column(
                      children: [
                        const Icon(
                          EvaIcons.peopleOutline,
                          color: Color(0xFFF59039),
                          size: 25,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                          child: _buildHeaderText("العدد المطلوب", 10,
                              FontWeight.normal, const Color(0xFFBBBBBB)),
                        ),
                        _buildHeaderTextTitle("20", 10, FontWeight.bold),
                      ],
                    ),
                    Column(
                      children: [
                        const Icon(
                          Icons.monetization_on_outlined,
                          color: Color(0xFFF59039),
                          size: 25,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                          child: _buildHeaderText("الراتب", 10,
                              FontWeight.normal, const Color(0xFFBBBBBB)),
                        ),
                        _buildHeaderTextTitle("يوجد", 10, FontWeight.bold),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 26.0, right: 18),
                child: _buildHeaderTextTitle("الوصف", 14, FontWeight.bold),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 18.0),
              child: _buildHeaderTextTitle("التعليقات", 18, FontWeight.bold),
            )),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
                height: 50,
                width: 340,
                decoration: BoxDecoration(
                    color: const Color(0xFFF3F3F3),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: const Color(0xFFBBBBBB))),
                padding: const EdgeInsets.all(8),
                child: _buildHeaderTextTitle(
                    "ابتهال سالم", 14, FontWeight.normal)),
          ],
        ),
      ],
    );
  }
}
