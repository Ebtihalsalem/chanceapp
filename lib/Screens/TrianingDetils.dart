import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

import '../UI Components/BottomBar.dart';

class TrianingDetils extends StatefulWidget {
  const TrianingDetils({super.key});

//تمرير له لون والبيانات اللون حسب اذا كان من التوصيات او لاجلك


  @override
  State<TrianingDetils> createState() => _TrianingDetilsState();
}

class _TrianingDetilsState extends State<TrianingDetils> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: _buildAppBar(),
        backgroundColor: const Color(0xffEFEFEF),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 22),
               Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: _buildForYouSection(),
                    ),
              Padding(
                padding: const EdgeInsets.only(top:18.0),
                child: _buildRecommendationsSection(),
              ),
              const SizedBox(height: 15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Icon(EvaIcons.starOutline,color: Color(0xFFF59039),size: 30),
                  const Icon(EvaIcons.messageCircleOutline,color: Color(0xFFF59039),size: 26),
                  SizedBox(
                    width: 230,
                    height: 38,
                    child: TextField(
                      textDirection: TextDirection.rtl,
                      textAlign: TextAlign.right,
                      decoration: InputDecoration(
                        hintText: "تعليقك..",
                        hintStyle: const TextStyle(
                            fontFamily: "Tajawal", color: Color(0xFFBBBBBB)),
                        filled: true,
                        fillColor: const Color(0xFFF3F3F3),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(color: Color(0xFFBCBCBC)),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Color(0xFFBCBCBC)),
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 85,),

              Center(
                child: SizedBox(
                  width: 300,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFF59039),
                    ),
                    onPressed: () {
                    },
                    child: const Text(
                      "طلب التدريب",
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: "Tajawal",
                      ),
                    ),
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
        _buildActionButton(EvaIcons.messageCircle, () {
          // التعامل مع الدردشة
        }),
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

  Widget _buildHeaderText(String text, double fontSize, FontWeight fontWeight,
      Color fontColor) {
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

  Widget _buildHeaderTextTitle(String text, double fontSize,
      FontWeight fontWeight) {
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

  Widget _buildForYouSection() {
    return Container(
        height: 67,
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
                    width: 50,
                    height: 50,
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
                          _buildHeaderText(
                              'الأكاديمية البيئية لتكنولوجيا المعلومات',
                              12,
                              FontWeight.bold,
                              const Color(0xffEFEFEF)),
                          _buildHeaderText('مساعدة مدير', 12, FontWeight.normal,
                              const Color(0xffEFEFEF)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ]
        )
    );
  }

  Widget _buildRecommendationsSection() {
    return Container(
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
            padding: const EdgeInsets.only(top:18.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    const Icon(EvaIcons.clockOutline,color: Color(0xFFF59039),size: 25,),
                    Padding(
                      padding: const EdgeInsets.only(top:8.0,bottom: 8),
                      child: _buildHeaderText("المدة", 10, FontWeight.normal,const Color(0xFFBBBBBB)),
                    ),
                    _buildHeaderTextTitle("شهرين", 12, FontWeight.bold),
                  ],
                ),
                Column(
                  children: [
                    const Icon(EvaIcons.peopleOutline,color: Color(0xFFF59039),size: 25,),
                    Padding(
                      padding: const EdgeInsets.only(top:8.0,bottom: 8),
                      child: _buildHeaderText("العدد المطلوب", 10, FontWeight.normal,const Color(0xFFBBBBBB)),
                    ),
                    _buildHeaderTextTitle("20", 12, FontWeight.bold),
                  ],
                ),
                Column(
                  children: [
                    const Icon(Icons.monetization_on_outlined,color: Color(0xFFF59039),size: 25,),
                    Padding(
                      padding: const EdgeInsets.only(top:8.0,bottom: 8),
                      child: _buildHeaderText("الراتب", 10, FontWeight.normal,const Color(0xFFBBBBBB)),
                    ),
                    _buildHeaderTextTitle("يوجد", 12, FontWeight.bold),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top:26.0,right: 18),
            child: _buildHeaderTextTitle("الوصف", 16, FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

