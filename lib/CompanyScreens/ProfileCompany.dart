import 'package:chanceapp/CompanyScreens/DoneScreen.dart';
import 'package:chanceapp/UI%20Components/Button.dart';
import 'package:chanceapp/UI%20Components/textFieldWithoutIcon.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

import '../Core/App_theme.dart';
import '../UI Components/BuildText.dart';

class ProfileCompany extends StatefulWidget {
  const ProfileCompany({super.key});

  @override
  State<ProfileCompany> createState() => _ProfileCompanyState();
}

class _ProfileCompanyState extends State<ProfileCompany> {
  int currentStep = 0;

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
              buildText("الملف الشخصي", 20, FontWeight.bold, Color(0xFF4A4C4D)),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 18.0),
          child: Container(
            color: primaryColor,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            height: 125,
                            width: 125,
                            decoration: BoxDecoration(
                              color: const Color(0xFFE7E7E7),
                              borderRadius: BorderRadius.circular(80),
                            ),
                          ),
                          Image.asset(
                            "lib/images/ion_camera.png",
                            height: 50,
                            width: 50,
                          )
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Column(
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(bottom: 8.0, right: 20),
                            child: Text(
                              "الاسم",
                              style: TextStyle(
                                  fontFamily: "Tajawal",
                                  color: Color(0xFF4A4C4D),
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      textFieldWithoutIcon("الاسم", 50, 320),
                      const SizedBox(height: 16),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(bottom: 8.0, right: 20),
                            child: Text(
                              "الايميل",
                              style: TextStyle(
                                  fontFamily: "Tajawal",
                                  color: Color(0xFF4A4C4D),
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      textFieldWithoutIcon("example@gmail.com", 50, 320),
                      const SizedBox(height: 16),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(bottom: 8.0, right: 20),
                            child: Text(
                              "رقم الهاتف",
                              style: TextStyle(
                                  fontFamily: "Tajawal",
                                  color: Color(0xFF4A4C4D),
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      textFieldWithoutIcon("0000000 218+ ", 50, 320),
                      const SizedBox(height: 16),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(bottom: 8.0, right: 20),
                            child: Text(
                              "تاريخ التأسيس",
                              style: TextStyle(
                                  fontFamily: "Tajawal",
                                  color: Color(0xFF4A4C4D),
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      textFieldWithoutIcon("0000/00/00", 50, 320),
                      const SizedBox(height: 16),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(bottom: 8.0, right: 20),
                            child: Text(
                              "المقر الرئيسي",
                              style: TextStyle(
                                  fontFamily: "Tajawal",
                                  color: Color(0xFF4A4C4D),
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      textFieldWithoutIcon("اسم المدينة", 50, 320),
                      const SizedBox(height: 16),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(bottom: 8.0, right: 20),
                            child: Text(
                              "عنوان المقر",
                              style: TextStyle(
                                  fontFamily: "Tajawal",
                                  color: Color(0xFF4A4C4D),
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      textFieldWithoutIcon("المنطقة - الشارع", 50, 320),
                      const SizedBox(
                        height: 16,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(bottom: 8.0, right: 20),
                            child: Text(
                              "المجال",
                              style: TextStyle(
                                  fontFamily: "Tajawal",
                                  color: Color(0xFF4A4C4D),
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      textFieldWithoutIcon("اسم المجال", 50, 320),
                      const SizedBox(
                        height: 16,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(bottom: 8.0, right: 20),
                            child: Text(
                              "حجم الشركة",
                              style: TextStyle(
                                  fontFamily: "Tajawal",
                                  color: Color(0xFF4A4C4D),
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      textFieldWithoutIcon("عدد الموظفين", 50, 320),
                      const SizedBox(
                        height: 16,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(bottom: 8.0, right: 20),
                            child: Text(
                              "الموقع",
                              style: TextStyle(
                                  fontFamily: "Tajawal",
                                  color: Color(0xFF4A4C4D),
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      textFieldWithoutIcon("https://example", 50, 320),
                      const SizedBox(
                        height: 16,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(bottom: 8.0, right: 20),
                            child: Text(
                              "نوع الشركة",
                              style: TextStyle(
                                  fontFamily: "Tajawal",
                                  color: Color(0xFF4A4C4D),
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      textFieldWithoutIcon("عامة/خاصة", 50, 320),
                      const SizedBox(
                        height: 16,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(bottom: 8.0, right: 20),
                            child: Text(
                              "التخصص",
                              style: TextStyle(
                                  fontFamily: "Tajawal",
                                  color: Color(0xFF4A4C4D),
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      textFieldWithoutIcon("اكتب التخصصات..", 50, 320),
                      const SizedBox(
                        height: 16,
                      ),
                      Column(
                        children: [
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsets.only(bottom: 8.0, right: 20),
                                child: Text(
                                  "ملخص عن الشركة",
                                  style: TextStyle(
                                      fontFamily: "Tajawal",
                                      color: Color(0xFF4A4C4D),
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                          textFieldWithoutIcon(
                              "اكتب ملخص عن شركتك.. ", 50, 320),
                        ],
                      ),
                      const SizedBox(height: 26),
                      button("التـالي", context, DoneScreen(),
                          Icon(EvaIcons.arrowIosBack, color: primaryColor),null)
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
