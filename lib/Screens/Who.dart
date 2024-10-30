import 'package:chanceapp/CompanyScreens/ProfileCompany.dart';
import 'package:chanceapp/Screens/IntroScreen.dart';
import 'package:chanceapp/Screens/LoginScreen.dart';
import 'package:chanceapp/Screens/yourPlan.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Core/App_theme.dart';
import '../TraineeScreens/Intersets.dart';
import '../UI Components/BuildText.dart';
import '../UI Components/Button.dart';
import 'Auth.dart';

class Who extends StatefulWidget {
  const Who({super.key});

  @override
  State<Who> createState() => _WhoState();
}

class _WhoState extends State<Who> {
  @override
  Widget build(BuildContext context) {
    return Padding(
    padding: const EdgeInsets.fromLTRB(50, 20, 50, 50),
    child: Column(
      children: [
        Container(height: 3,width: 100,color: borderColor,),
        Align(
          alignment: Alignment.bottomRight,
          child: Padding(
            padding: const EdgeInsets.only(top: 40.0),
            child: buildText(
              "مرحبا، هل أنت ..",
              20,
              FontWeight.normal,
              Colors.grey,
            ),
          ),
        ),
        const SizedBox(height: 20),
        Align(
          alignment: Alignment.centerRight,
          child: SizedBox(
            width: 300,
            height: 50,
            child: button(
                "باحث عن خبرة", context, IntroScreen(isCompany:false), null, null),
          ),
        ),
        const SizedBox(height: 20),
        Container(
          width: 300,
          height: 50,
          decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(40),
              border: Border.all(color: primaryColor)),
          child: TextButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (_) => IntroScreen(isCompany:true)));
            },
            child: buildText(
              "شركة",
              16,
              FontWeight.normal,
              primaryColor,
            ),
          ),
        ),
      ],
    )
    );
  }
}
