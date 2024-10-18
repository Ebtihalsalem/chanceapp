import 'dart:ui';
import 'package:chanceapp/TraineeScreens/home.dart';
import 'package:flutter/material.dart';
import '../Core/App_theme.dart';
import '../UI Components/BackgroundImg.dart';
import '../UI Components/BuildText.dart';
import '../UI Components/Button.dart';

class StartedScreen extends StatefulWidget {
  const StartedScreen({super.key});

  @override
  State<StartedScreen> createState() => _StartedScreenState();
}

class _StartedScreenState extends State<StartedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          buildBackgroundImage(),
          buildBlurOverlay(),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children:[
              const Expanded(
                flex: 7,
                child: SizedBox(height: 10),
              ),
                Expanded(
                  flex: 4,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(40.0),
                      topRight: Radius.circular(40.0),
                    ),
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(50, 25, 50, 50),
                      decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(40.0),
                          topRight: Radius.circular(40.0),
                        ),
                      ),
                      child: Column(
                        children: [
                          Container(
                            height: 3,
                            width: 170,
                            color: Colors.grey,
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top:50.0),
                            child: Text(
                              "مستقبلك المهني يبدأ هنا!! ",
                              style: TextStyle(
                                color: Color(0xFFF59039),
                                fontSize: 27,
                                fontWeight: FontWeight.bold,
                                fontFamily: "Tajawal",
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Align(
                            alignment: Alignment.centerRight,
                            child: buildTextTitle(
                              "- ربط الخريجين بالشركات وتطوير المهارات المطلوبة.",
                               13,
                               FontWeight.normal,

                            ),
                          ),
                          const SizedBox(height: 20),
                          button("ابــدأ",context,HomeScreen(),null),

                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
