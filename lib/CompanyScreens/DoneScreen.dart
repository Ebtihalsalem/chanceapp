import 'package:chanceapp/CompanyScreens/AddTraining.dart';
import 'package:chanceapp/CompanyScreens/CompanyMyProfile.dart';
import 'package:chanceapp/CompanyScreens/TrainingDetails.dart';
import 'package:chanceapp/CompanyScreens/TrainingScreen.dart';
import 'package:chanceapp/TraineeScreens/home.dart';
import 'package:chanceapp/CompanyScreens/AddTraining.dart';
import 'package:flutter/material.dart';
import 'package:chanceapp/CompanyScreens/TraineeProfile.dart';

import '../UI Components/BuildText.dart';
import '../UI Components/Button.dart';
import 'HomeScreen.dart';

class DoneScreen extends StatefulWidget {
  const DoneScreen({super.key});

  @override
  State<DoneScreen> createState() => _DoneScreenState();
}

class _DoneScreenState extends State<DoneScreen> {


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
              buildText("فرصتك في يدك",
                  20,FontWeight.bold,Color(0xFF4A4C4D))
            ],
          ),
        ),
        body: Align(
          alignment: Alignment.center,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "lib/images/3891940.png",
                  height: 280,
                  width: 280,
                ),
                const SizedBox(height: 25,),
                buildTextTitle("عمل جيد !!",26,FontWeight.bold),
                const SizedBox(height: 20,),
                buildTextTitle("هل تريد نشر تدريب الان؟",
                    15,FontWeight.normal),
                const SizedBox(height: 20,),
                SizedBox(
                  width: 300,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFF59039),
                    ),
                    onPressed: () {    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                           AddTraining(), // استبدل NextScreen بالشاشة التي تريد الانتقال إليها
                      ),
                    );},
                    child: const Text(
                      "نعم",
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: "Tajawal",
                      ),
                    ),
                  ),
                ),
                button("نعم",context,AddTraining(),null,null),
                const SizedBox(height: 16),
                Container(
                  width: 300,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(40),
                      border: Border.all(color: const Color(0xFFF59039))),
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context)=> const CHomeScreen())
                      );
                    },
                    child: const Text(
                      "ليس الآن",
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                        color: Color(0xFFF59039),
                        fontSize: 16,
                        fontFamily: "Tajawal",
                      ),
                    ),
                  ),
                ),
              ]),
        ));
  }
}
