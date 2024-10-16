
import 'package:chanceapp/Core/App_theme.dart';
import 'package:flutter/material.dart';

import 'AddCv.dart';
import 'AfterCv.dart';

class Steps extends StatefulWidget {
  const Steps({super.key});

  @override
  State<Steps> createState() => _StepsState();
}

class _StepsState extends State<Steps> {
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
              const Text("الملف الشخصي",
                  style: TextStyle(
                      fontFamily: "Tajawal",
                      fontSize: 20,
                      color: Color(0xFF4A4C4D),
                      fontWeight: FontWeight.bold)),
            ],
          ),
        ),
        body: Container(
          color: const Color(0xffEAEAEA),
          child: Theme(
            data: ThemeData(
              colorScheme: const ColorScheme.light(
                primary: Color(0xFFF59039),
              ),
            ),
            child: Container(
              color: primaryColor,
              child: Stepper(
                type: StepperType.horizontal,
                steps: getSteps(),connectorColor: primaryColor,
                currentStep: currentStep,
                onStepContinue: () {
                  if (currentStep != 3)
                    {setState(() => currentStep += 1);}
                  else
                    {
                      Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const AfterCv())
                      );
                    }

                },
                onStepCancel: () {
                  if (currentStep != 0)
                    {setState(() => currentStep -= 1);}
                  else
                  {  null;}
                },
                controlsBuilder:
                    (BuildContext context, ControlsDetails details) {
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
        ));
  }

  List<Step> getSteps() => [
        Step(
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
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("المعلومات الشخصية",
                        style: TextStyle(
                          fontFamily: "Tajawal",
                          fontSize: 16,
                          color: Color(0xFFF59039),
                          fontWeight: FontWeight.bold,
                        )),
                  ],
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Column(
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 8.0, right: 20),
                        child: Text(
                          "الاسم كامل",
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
                        hintText: "الاسم كامل ",
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
                  SizedBox(
                    width: 320,
                    height: 50,
                    child: TextField(
                      textDirection: TextDirection.rtl,
                      textAlign: TextAlign.right,
                      decoration: InputDecoration(
                        hintText: "example@gmail.com",
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
                  SizedBox(
                    width: 320,
                    height: 50,
                    child: TextField(
                      textAlign: TextAlign.right,
                      decoration: InputDecoration(
                        hintText: "0000000 218+ ",
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
                  const SizedBox(height: 16),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 8.0, right: 20),
                        child: Text(
                          "تاريخ الميلاد",
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
                        hintText: "0000/00/00",
                        hintStyle: const TextStyle(
                            fontFamily: "Tajawal", color: Color(0xFFBBBBBB)),
                        filled: true,
                        fillColor: Colors.white,
                        suffixIcon: const Icon(Icons.calendar_month_sharp,
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
                  const SizedBox(height: 16),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 8.0, right: 20),
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
                  const SizedBox(height: 16),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 8.0, right: 20),
                        child: Text(
                          "عنوان السكن",
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
                        hintText: "المنطقة - الشارع",
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
                ],
              ),
            ],
          ),
        ),
        Step(
          isActive: currentStep >= 1,
          title: const Text(" "),
          content: Column(
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("المؤهلات العلمية والخبرات",
                        style: TextStyle(
                          fontFamily: "Tajawal",
                          fontSize: 16,
                          color: Color(0xFFF59039),
                          fontWeight: FontWeight.bold,
                        )),
                  ],
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Column(
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 8.0, right: 20),
                        child: Text(
                          "التعليم",
                          style: TextStyle(
                              fontFamily: "Tajawal",
                              color: Color(0xFF4A4C4D),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: 320,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.white,
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
                              fontFamily: "Tajawal",
                              color: Color(0xFFBBBBBB),
                            ),
                          ),
                        ),
                        IconButton(
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return const AddCv(title: "التعليم",name: "نوع الشهادة",);
                                  });
                            },
                            icon: const Icon(Icons.add,
                                color: Color(0xFFBBBBBB))),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 8.0, right: 20),
                        child: Text(
                          "الخبرة العملية",
                          style: TextStyle(
                              fontFamily: "Tajawal",
                              color: Color(0xFF4A4C4D),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: 320,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.white,
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
                              fontFamily: "Tajawal",
                              color: Color(0xFFBBBBBB),
                            ),
                          ),
                        ),
                        IconButton(
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return const AddCv(title: "الخبرة العملية",name: "نوع العمل",);
                                  });
                            },
                            icon: const Icon(Icons.add, color: Color(0xFFBBBBBB))),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 8.0, right: 20),
                        child: Text(
                          "الدورات التدريبية",
                          style: TextStyle(
                              fontFamily: "Tajawal",
                              color: Color(0xFF4A4C4D),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: 320,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.white,
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
                              fontFamily: "Tajawal",
                              color: Color(0xFFBBBBBB),
                            ),
                          ),
                        ),
                        IconButton(
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return const AddCv(title: "الدورات التدريبة",name: "اسم الدورة",);
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
        ),
        Step(
          isActive: currentStep >= 2,
          title: const Text(
            " ",
          ),
          content: Column(
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("المهــارات",
                        style: TextStyle(
                          fontFamily: "Tajawal",
                          fontSize: 16,
                          color: Color(0xFFF59039),
                          fontWeight: FontWeight.bold,
                        )),
                  ],
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Column(
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 8.0, right: 20),
                        child: Text(
                          "المهــارات الشخصية",
                          style: TextStyle(
                              fontFamily: "Tajawal",
                              color: Color(0xFF4A4C4D),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: 320,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.white,
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
                              fontFamily: "Tajawal",
                              color: Color(0xFFBBBBBB),
                            ),
                          ),
                        ),
                        IconButton(
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                 return const AddCv(title: "المهارات الشخصية",name: "المهارة",);
                                  });
                            },
                            icon: const Icon(Icons.add,
                                color: Color(0xFFBBBBBB))),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 8.0, right: 20),
                        child: Text(
                          "مهـــارات الحاسوب",
                          style: TextStyle(
                              fontFamily: "Tajawal",
                              color: Color(0xFF4A4C4D),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: 320,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.white,
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
                              fontFamily: "Tajawal",
                              color: Color(0xFFBBBBBB),
                            ),
                          ),
                        ),
                        IconButton(
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return const AddCv(title: "مهارات الحاسوب",name: "المهارة",);
                                  });
                            },
                            icon: const Icon(Icons.add,
                                color: Color(0xFFBBBBBB))),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 8.0, right: 20),
                        child: Text(
                          "اللغات",
                          style: TextStyle(
                              fontFamily: "Tajawal",
                              color: Color(0xFF4A4C4D),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: 320,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.white,
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
                              fontFamily: "Tajawal",
                              color: Color(0xFFBBBBBB),
                            ),
                          ),
                        ),
                        IconButton(
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return const AddCv(title: "اللغات",name: "اللغة",);
                                  });
                            },
                            icon: const Icon(Icons.add, color: Color(0xFFBBBBBB))),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Step(
          isActive: currentStep >= 3,
          title: const Text(" "),
          content: Column(
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("النشاطات والاعمال الأخرى",
                        style: TextStyle(
                          fontFamily: "Tajawal",
                          fontSize: 16,
                          color: Color(0xFFF59039),
                          fontWeight: FontWeight.bold,
                        )),
                  ],
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Column(
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 8.0, right: 20),
                        child: Text(
                          "النشاطات",
                          style: TextStyle(
                              fontFamily: "Tajawal",
                              color: Color(0xFF4A4C4D),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: 320,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.white,
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
                              fontFamily: "Tajawal",
                              color: Color(0xFFBBBBBB),
                            ),
                          ),
                        ),
                        IconButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return const AddCv(title: "النشاطات",name: "اسم النشاط",);
                                });
                              },
                            icon: const Icon(Icons.add, color: Color(0xFFBBBBBB))),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 8.0, right: 20),
                        child: Text(
                          "الاعمال التطوعية",
                          style: TextStyle(
                              fontFamily: "Tajawal",
                              color: Color(0xFF4A4C4D),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: 320,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.white,
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
                              fontFamily: "Tajawal",
                              color: Color(0xFFBBBBBB),
                            ),
                          ),
                        ),
                        IconButton(
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return const AddCv(title: "الاعمال التطوعية",name: "اسم العمل",);
                                  });
                            },
                            icon: const Icon(Icons.add, color: Color(0xFFBBBBBB))),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 8.0, right: 20),
                        child: Text(
                          "المشاريع",
                          style: TextStyle(
                              fontFamily: "Tajawal",
                              color: Color(0xFF4A4C4D),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: 320,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.white,
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
                              fontFamily: "Tajawal",
                              color: Color(0xFFBBBBBB),
                            ),
                          ),
                        ),
                        IconButton(
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return const AddCv(title: "المشاريع",name: "اسم المشروع",);
                                  });
                            },
                            icon: const Icon(Icons.add, color: Color(0xFFBBBBBB))),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ];



}
