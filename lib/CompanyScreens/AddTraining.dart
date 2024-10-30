import 'dart:convert';
import 'package:chanceapp/UI%20Components/CenterAppBar.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../Core/App_theme.dart';
import '../Screens/Auth.dart';
import '../Screens/LoginScreen.dart';
import '../UI Components/BuildText.dart';

class AddTraining extends StatefulWidget {
  const AddTraining({super.key});

  @override
  State<AddTraining> createState() => _AddTrainingState();
}

class _AddTrainingState extends State<AddTraining> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController startDateController = TextEditingController();
  final TextEditingController endDateController = TextEditingController();
  final TextEditingController skillController = TextEditingController();
  final TextEditingController numberOfPositionsController =
      TextEditingController();
  final TextEditingController cityController = TextEditingController();
  List<String> requiredSkills = [];

  Future<void> addTraining(
      String title,
      String description,
      String startDate,
      String endDate,
      List<String> requiredSkills,
      int numberOfPositions,
      String city) async {
    final url = Uri.parse('http://192.168.88.42:8085/trainings/Addtraining');

    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        '_id':5,
        'title': title,
        'description': description,
        'companyEmail': emailGeneral,
        'startDate': startDate,
        'endDate': endDate,
        'requiredSkills': requiredSkills,
        'numberOfPositions': numberOfPositions,
        'city': city,
      }),
    );

    if (response.statusCode == 201) {
      print('Training added successfully');
    } else {

      print('Failed to add training: ${response.body}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: centerAppBar(context, "اضافة تدريب"),
      body: SafeArea(
        child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 18.0, vertical: 18.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(18),
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
                            controller: titleController,
                            textDirection: TextDirection.rtl,
                            textAlign: TextAlign.right,
                            decoration: InputDecoration(
                              hintText: "منصب التدريب",
                              hintStyle: const TextStyle(
                                  fontFamily: "Tajawal",
                                  color: Color(0xFFBBBBBB)),
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
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding:
                                      EdgeInsets.only(bottom: 5, right: 10),
                                  child: Text(
                                    "تاريخ البدأ",
                                    style: TextStyle(
                                        fontFamily: "Tajawal",
                                        color: Color(0xFF4A4C4D),
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                SizedBox(
                                  width: 160,
                                  height: 50,
                                  child: TextField(
                                    controller: startDateController,
                                    textDirection: TextDirection.rtl,
                                    textAlign: TextAlign.right,
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.white,
                                      prefixIcon: const Icon(
                                        EvaIcons.calendarOutline,
                                        color: Color(0xFFBBBBBB),
                                        size: 18,
                                      ),
                                      border: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Color(0xFFBCBCBC)),
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Color(0xFFBCBCBC)),
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
                                  padding:
                                      EdgeInsets.only(bottom: 5, right: 10),
                                  child: Text(
                                    "تاريخ الانتهاء",
                                    style: TextStyle(
                                        fontFamily: "Tajawal",
                                        color: Color(0xFF4A4C4D),
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                SizedBox(
                                  width: 160,
                                  height: 50,
                                  child: TextField(
                                    controller: endDateController,
                                    textDirection: TextDirection.rtl,
                                    textAlign: TextAlign.right,
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.white,
                                      prefixIcon: const Icon(
                                          EvaIcons.calendarOutline,
                                          color: Color(0xFFBBBBBB),
                                          size: 18),
                                      border: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Color(0xFFBCBCBC)),
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Color(0xFFBCBCBC)),
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(bottom: 5, right: 20),
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
                            controller: cityController,
                            textDirection: TextDirection.rtl,
                            textAlign: TextAlign.right,
                            decoration: InputDecoration(
                              hintText: "اسم المدينة",
                              hintStyle: const TextStyle(
                                  fontFamily: "Tajawal",
                                  color: Color(0xFFBBBBBB)),
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
                        const SizedBox(
                          height: 15,
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(bottom: 5, right: 20),
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
                            controller: numberOfPositionsController,
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
                        const SizedBox(
                          height: 15,
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(bottom: 5, right: 20),
                              child: Text(
                                "الوصف",
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
                            controller: descriptionController,
                            textDirection: TextDirection.rtl,
                            textAlign: TextAlign.right,
                            decoration: InputDecoration(
                              hintText: "الوصف العام..",
                              hintStyle: const TextStyle(
                                  fontFamily: "Tajawal",
                                  color: Color(0xFFBBBBBB)),
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
                        const SizedBox(
                          height: 15,
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(bottom: 5, right: 20),
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
                        Stack(children: [
                              Row(
                                children: [
                                  SizedBox(
                                    width: 270,
                                    height: 50,
                                    child: TextField(
                                      controller: skillController,
                                      textDirection: TextDirection.rtl,
                                      textAlign: TextAlign.right,
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: Colors.white,
                                        border: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: Color(0xFFBCBCBC)),
                                          borderRadius: BorderRadius.circular(30),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: Color(0xFFBCBCBC)),
                                          borderRadius: BorderRadius.circular(30),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 10,),
                                  Container(
                                    height: 40,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      color: primaryColor,
                                      borderRadius: BorderRadius.circular(10)
                                    ),
                                    child: IconButton(
                                      icon: Icon(Icons.add,color: backgroundColor,),
                                      onPressed: () {
                                        if (skillController.text.isNotEmpty) {
                                          setState(() {
                                            requiredSkills.add(skillController.text);
                                            skillController.clear();
                                          });
                                        }
                                      },
                                    ),
                                  ),
                                ],
                              ),

                            ],
                          ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Wrap(
                            children: requiredSkills
                                .map((skill) => Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Chip(
                                        backgroundColor: secondaryColor,
                                        deleteIcon: Icon(Icons.cancel,color: backgroundColor,),
                                        labelStyle: TextStyle(color: backgroundColor ),
                                        side: const BorderSide(color: Colors.transparent),
                                        label: Text(skill),
                                        onDeleted: () {
                                          setState(() {
                                            requiredSkills.remove(skill);
                                          });
                                        },
                                      ),
                                ))
                                .toList(),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: buildText("الغاء", 20, FontWeight.bold,
                                  primaryColor),
                            ),
                            Container(
                              height: 40,
                              width: 100,
                              decoration: BoxDecoration(
                                  color: primaryColor,
                                  borderRadius: BorderRadius.circular(10)),
                              child: TextButton(
                                onPressed: () async {
                                  await addTraining(
                                    titleController.text,
                                    descriptionController.text,
                                    startDateController.text,
                                    endDateController.text,
                                    requiredSkills,
                                    int.parse(numberOfPositionsController.text),
                                    cityController.text,
                                  );
                                  Navigator.of(context).pop();
                                },
                                child: buildText(
                                    "اضافة", 15, FontWeight.bold, Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
