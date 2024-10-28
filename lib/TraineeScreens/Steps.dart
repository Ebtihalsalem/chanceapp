import 'dart:convert';

import 'package:chanceapp/Core/App_theme.dart';
import 'package:chanceapp/UI%20Components/CenterAppBar.dart';
import 'package:flutter/material.dart';
import '../UI Components/BuildText.dart';
import '../UI Components/textFieldWithoutIcon.dart';
import 'AddCv.dart';
import 'AfterCv.dart';
import "package:http/http.dart" as http;

class Steps extends StatefulWidget {
  const Steps({super.key});

  @override
  State<Steps> createState() => _StepsState();
}

class _StepsState extends State<Steps> {

  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final birthDateController = TextEditingController();
  final cityController = TextEditingController();
  final addressController = TextEditingController();


  int currentStep = 0;
  Map<String, dynamic> allUserData = {};

  void updateStepData(String step, Map<String, dynamic> stepData) {
    allUserData[step] = stepData;
  }

  Future<void> sendAllData() async {
    final apiUrl = 'http://10.60.5.183:8085/users/data_user';
    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(allUserData),
      );

      if (response.statusCode == 200) {
        print("تم إرسال جميع البيانات بنجاح");
      } else {
        print("فشل إرسال جميع البيانات: ${response.body}");
      }
    } catch (e) {
      print("خطأ في الإرسال: $e");
    }
  }

  void onStep1Completed() {
    final step1Data = {'field1': 'value1', 'field2': 'value2'};
    updateStepData("step1", step1Data);
  }

  void onStep2Completed() {
    final step2Data = {'field3': 'value3', 'field4': 'value4'};
    updateStepData("step2", step2Data);
  }

  void onFinalStepCompleted() {
    sendAllData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: centerAppBar(context, "الملف الشخصي"),
      body: Container(
        color: backgroundColor,
        child: Theme(
          data: ThemeData(
            colorScheme: ColorScheme.light(
              primary: primaryColor,
            ),
            canvasColor: backgroundColor,
          ),
          child: Stepper(
            type: StepperType.horizontal,
            steps: getSteps(),
            currentStep: currentStep,
            onStepContinue: () {
              if (currentStep != 3) {
                setState(() => currentStep += 1);
              } else {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const AfterCv()));
              }
            },
            onStepCancel: () {
              if (currentStep != 0) {
                setState(() => currentStep -= 1);
              } else {
                null;
              }
            },
            controlsBuilder: (BuildContext context, ControlsDetails details) {
              return Column(
                children: [
                  const SizedBox(height: 26),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Container(
                        height: 35,
                        width: 70,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: const Color(0xFFF59039))),
                        child: TextButton(
                          onPressed: details.onStepCancel,
                          style: TextButton.styleFrom(
                            textStyle: const TextStyle(
                              fontFamily: "Tajawal",
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          child: const Text('رجـوع'),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Container(
                        height: 35,
                        width: 45,
                        decoration: BoxDecoration(
                          color: const Color(0xFFF59039),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: IconButton(
                          onPressed: details.onStepContinue,
                          icon: const Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  List<Step> getSteps() => [
    step1(),
       step2(),
       step3(),
      step4(),
      ];
Step step1(){
  return  Step(
    isActive: currentStep >= 0,
    title: const Text(
      " ",
    ),
    content: Column(
      children: <Widget>[
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
          height: 15,
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              buildText(
                "المعلومات الشخصية",
                16,
                FontWeight.bold,
                secondaryColor,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 8.0, right: 20),
                  child: buildTextTitle(
                    "الاسم كامل",
                    14,
                    FontWeight.bold,
                  ),
                ),
              ],
            ),
            textFieldWithoutIcon("الاسم كامل", 50, 320,fullNameController),
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
            textFieldWithoutIcon("example@gmail.com", 50, 320,emailController),
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
            textFieldWithoutIcon("0000000 218+ ", 50, 320,phoneNumberController),
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
            textFieldWithoutIcon("0000/00/00", 50, 320,birthDateController),
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
            textFieldWithoutIcon("اسم المدينة", 50, 320,cityController),
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
            textFieldWithoutIcon("المنطقة - الشارع", 50, 320,addressController)
          ],
        ),
      ],
    ),
  );
}
Step step2(){
  return  Step(
    isActive: currentStep >= 1,
    title: const Text(" "),
    content: Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              buildText(
                "المؤهلات العلمية والخبرات",
                16,
                FontWeight.bold,
                secondaryColor,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0, right: 20),
                  child: buildTextTitle(
                    "التعليم",
                    14,
                    FontWeight.bold,
                  ),
                ),
              ],
            ),
            Container(
              width: 320,
              height: 50,
              decoration: BoxDecoration(
                  color: const Color(0xFFFDFDFD),
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: const Color(0xFFBCBCBC))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(right: 15.0),
                    child: Text(
                      "اضافة..",
                      style: TextStyle(
                        color: Color(0xFFBBBBBB),
                      ),
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return const AddCv(
                                title: "التعليم",
                                name: "نوع الشهادة",
                              );
                            });
                      },
                      icon: const Icon(Icons.add,
                          color: Color(0xFFBBBBBB))),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0, right: 20),
                  child: buildTextTitle(
                    "الخبرة العملية",
                    14,
                    FontWeight.bold,
                  ),
                ),
              ],
            ),
            Container(
              width: 320,
              height: 50,
              decoration: BoxDecoration(
                  color: const Color(0xFFFDFDFD),
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: const Color(0xFFBCBCBC))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(right: 15.0),
                    child: Text(
                      "اضافة..",
                      style: TextStyle(
                        color: Color(0xFFBBBBBB),
                      ),
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return const AddCv(
                                title: "الخبرة العملية",
                                name: "نوع العمل",
                              );
                            });
                      },
                      icon: const Icon(Icons.add,
                          color: Color(0xFFBBBBBB))),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0, right: 20),
                  child: buildTextTitle(
                    "الدورات التدريبية",
                    14,
                    FontWeight.bold,
                  ),
                ),
              ],
            ),
            Container(
              width: 320,
              height: 50,
              decoration: BoxDecoration(
                  color: const Color(0xFFFDFDFD),
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: const Color(0xFFBCBCBC))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(right: 15.0),
                    child: Text(
                      "اضافة..",
                      style: TextStyle(
                        color: Color(0xFFBBBBBB),
                      ),
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return const AddCv(
                                title: "الدورات التدريبة",
                                name: "اسم الدورة",
                              );
                            });
                      },
                      icon: const Icon(Icons.add,
                          color: Color(0xFFBBBBBB))),
                ],
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
Step step3(){
  return  Step(
    isActive: currentStep >= 2,
    title: const Text(
      " ",
    ),
    content: Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              buildText(
                "المهــارات",
                16,
                FontWeight.bold,
                secondaryColor,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0, right: 20),
                  child: buildTextTitle(
                    "المهــارات الشخصية",
                    14,
                    FontWeight.bold,
                  ),
                ),
              ],
            ),
            Container(
              width: 320,
              height: 50,
              decoration: BoxDecoration(
                  color: const Color(0xFFFDFDFD),
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: const Color(0xFFBCBCBC))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(right: 15.0),
                    child: Text(
                      "اضافة..",
                      style: TextStyle(
                        color: Color(0xFFBBBBBB),
                      ),
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return const AddCv(
                                title: "المهارات الشخصية",
                                name: "المهارة",
                              );
                            });
                      },
                      icon: const Icon(Icons.add,
                          color: Color(0xFFBBBBBB))),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0, right: 20),
                  child: buildTextTitle(
                    "مهـــارات الحاسوب",
                    14,
                    FontWeight.bold,
                  ),
                ),
              ],
            ),
            Container(
              width: 320,
              height: 50,
              decoration: BoxDecoration(
                  color: const Color(0xFFFDFDFD),
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: const Color(0xFFBCBCBC))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(right: 15.0),
                    child: Text(
                      "اضافة..",
                      style: TextStyle(
                        color: Color(0xFFBBBBBB),
                      ),
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return const AddCv(
                                title: "مهارات الحاسوب",
                                name: "المهارة",
                              );
                            });
                      },
                      icon: const Icon(Icons.add,
                          color: Color(0xFFBBBBBB))),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0, right: 20),
                  child: buildTextTitle(
                    "اللغات",
                    14,
                    FontWeight.bold,
                  ),
                ),
              ],
            ),
            Container(
              width: 320,
              height: 50,
              decoration: BoxDecoration(
                  color: const Color(0xFFFDFDFD),
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: const Color(0xFFBCBCBC))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(right: 15.0),
                    child: Text(
                      "اضافة..",
                      style: TextStyle(
                        color: Color(0xFFBBBBBB),
                      ),
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return const AddCv(
                                title: "اللغات",
                                name: "اللغة",
                              );
                            });
                      },
                      icon: const Icon(Icons.add,
                          color: Color(0xFFBBBBBB))),
                ],
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
Step step4(){
  return   Step(
    isActive: currentStep >= 3,
    title: const Text(" "),
    content: Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              buildText(
                "النشاطات والاعمال الأخرى",
                16,
                FontWeight.bold,
                secondaryColor,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0, right: 20),
                  child: buildTextTitle(
                    "النشاطات",
                    14,
                    FontWeight.bold,
                  ),
                ),
              ],
            ),
            Container(
              width: 320,
              height: 50,
              decoration: BoxDecoration(
                  color: const Color(0xFFFDFDFD),
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: const Color(0xFFBCBCBC))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(right: 15.0),
                    child: Text(
                      "اضافة..",
                      style: TextStyle(
                        color: Color(0xFFBBBBBB),
                      ),
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return const AddCv(
                                title: "النشاطات",
                                name: "اسم النشاط",
                              );
                            });
                      },
                      icon: const Icon(Icons.add,
                          color: Color(0xFFBBBBBB))),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0, right: 20),
                  child: buildTextTitle(
                    "الاعمال التطوعية",
                    14,
                    FontWeight.bold,
                  ),
                ),
              ],
            ),
            Container(
              width: 320,
              height: 50,
              decoration: BoxDecoration(
                  color: const Color(0xFFFDFDFD),
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: const Color(0xFFBCBCBC))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(right: 15.0),
                    child: Text(
                      "اضافة..",
                      style: TextStyle(
                        color: Color(0xFFBBBBBB),
                      ),
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return const AddCv(
                                title: "الاعمال التطوعية",
                                name: "اسم العمل",
                              );
                            });
                      },
                      icon: const Icon(Icons.add,
                          color: Color(0xFFBBBBBB))),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0, right: 20),
                  child: buildTextTitle(
                    "المشاريع",
                    14,
                    FontWeight.bold,
                  ),
                ),
              ],
            ),
            Container(
              width: 320,
              height: 50,
              decoration: BoxDecoration(
                  color: const Color(0xFFFDFDFD),
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: const Color(0xFFBCBCBC))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(right: 15.0),
                    child: Text(
                      "اضافة..",
                      style: TextStyle(
                        color: Color(0xFFBBBBBB),
                      ),
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return const AddCv(
                                title: "المشاريع",
                                name: "اسم المشروع",
                              );
                            });
                      },
                      icon: const Icon(Icons.add,
                          color: Color(0xFFBBBBBB))),
                ],
              ),
            ),
          ],
        ),
      ],
    ),
  );
}


}
