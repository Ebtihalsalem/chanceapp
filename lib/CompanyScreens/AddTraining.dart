import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

import '../UI Components/BuildText.dart';

class AddTraining extends StatefulWidget {
  const AddTraining({super.key});

  @override
  State<AddTraining> createState() => _AddTrainingState();
}

class _AddTrainingState extends State<AddTraining> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color(0xFFEFEFEF),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "lib/images/logo.png",
            height: 15,
            width: 15,
          ),
          const SizedBox(
            width: 10,
          ),
          const Text("إضافة تدريب",
              style: TextStyle(
                  fontFamily: "Tajawal",
                  fontSize: 15,
                  color: Color(0xFF4A4C4D),
                  fontWeight: FontWeight.bold)),
        ],
      ),
      content:
      Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 5, right: 20),
                      child: Text(
                        "المنصب",
                        style: TextStyle(
                            fontFamily: "Tajawal",
                            color: Color(0xFF4A4C4D),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 320,
                  height: 50,
                  child: TextField(
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.right,
                    decoration: InputDecoration(
                      hintText: "منصب التدريب",
                      hintStyle: const TextStyle(
                          fontFamily: "Tajawal", color: Color(0xFFBBBBBB)),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderSide:
                        const BorderSide(color: Color(0xFFBCBCBC)),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                        const BorderSide(color: Color(0xFFBCBCBC)),
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(bottom: 5,  right: 10),
                          child: Text(
                            "تاريخ البدأ",
                            style: TextStyle(
                                fontFamily: "Tajawal",
                                color: Color(0xFF4A4C4D),
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          width: 120,
                          height: 50,
                          child: TextField(
                            textDirection: TextDirection.rtl,
                            textAlign: TextAlign.right,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              prefixIcon: const Icon(EvaIcons.calendarOutline,
                                  color: Color(0xFFBBBBBB)),
                              border: OutlineInputBorder(
                                borderSide:
                                const BorderSide(color: Color(0xFFBCBCBC)),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                const BorderSide(color: Color(0xFFBCBCBC)),
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(bottom: 5,  right: 10),
                          child: Text(
                            "تاريخ الانتهاء",
                            style: TextStyle(
                                fontFamily: "Tajawal",
                                color: Color(0xFF4A4C4D),
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          width: 120,
                          height: 50,
                          child: TextField(
                            textDirection: TextDirection.rtl,
                            textAlign: TextAlign.right,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              prefixIcon: const Icon(EvaIcons.calendarOutline,
                                  color: Color(0xFFBBBBBB)),
                              border: OutlineInputBorder(
                                borderSide:
                                const BorderSide(color: Color(0xFFBCBCBC)),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                const BorderSide(color: Color(0xFFBCBCBC)),
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                  ],
                ),

                const SizedBox(height: 15,),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 5,  right: 20),
                      child: Text(
                        "المدينة",
                        style: TextStyle(
                            fontFamily: "Tajawal",
                            color: Color(0xFF4A4C4D),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 320,
                  height: 50,
                  child: TextField(
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.right,
                    decoration: InputDecoration(
                      hintText: "اسم المدينة",
                      hintStyle: const TextStyle(
                          fontFamily: "Tajawal", color: Color(0xFFBBBBBB)),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderSide:
                        const BorderSide(color: Color(0xFFBCBCBC)),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                        const BorderSide(color: Color(0xFFBCBCBC)),
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15,),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 5,  right: 20),
                      child: Text(
                        "العدد المطلوب",
                        style: TextStyle(
                            fontFamily: "Tajawal",
                            color: Color(0xFF4A4C4D),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 320,
                  height: 50,
                  child: TextField(
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.right,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderSide:
                        const BorderSide(color: Color(0xFFBCBCBC)),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                        const BorderSide(color: Color(0xFFBCBCBC)),
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15,),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 5,  right: 20),
                      child: Text(
                        "المهارات",
                        style: TextStyle(
                            fontFamily: "Tajawal",
                            color: Color(0xFF4A4C4D),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 320,
                  height: 50,
                  child: TextField(
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.right,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderSide:
                        const BorderSide(color: Color(0xFFBCBCBC)),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                        const BorderSide(color: Color(0xFFBCBCBC)),
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: buildText("الغاء",17,FontWeight.bold,const Color(0xFFF59039)),
                    ),
                    Container(
                      height: 40,
                      width: 80,
                      decoration: BoxDecoration(
                          color: const Color(0xFFF59039),
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: TextButton(
                        onPressed: () {},
                        child:  buildText("اضافة",15,FontWeight.bold,Colors.white),
                      ),
                    ),
                  ],
                ),

              ],
            ),
          ),
        ],
      ),

    );
  }
}
