import 'dart:ui';

import 'package:chanceapp/UI%20Components/BackgroundImg.dart';
import 'package:chanceapp/UI%20Components/CircleImg.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';

import '../../UI Components/BottomBar.dart';
import '../Core/App_theme.dart';
import '../TraineeScreens/Boxes.dart';
import '../TraineeScreens/HeatMap.dart';
import '../UI Components/BuildText.dart';
import '../UI Components/TraineeActivatesTab.dart';
import '../UI Components/aboutTabForTrainee.dart';

class TraineeProfile extends StatefulWidget {
  const TraineeProfile({super.key});

  @override
  State<TraineeProfile> createState() => _TraineeProfileState();
}

class _TraineeProfileState extends State<TraineeProfile> {
  List<String> tabs = ["حــول", "النشــاط"];



  List<String> tipsList = ["CX","UX","EUX"];

  int _currentTab = 0;

  Widget screensTabs()
  {
    switch(_currentTab){
      case 0:
        return aboutTabForTrainee(false);
      case 1:
        return traineeActivatesTab(context);
      default:
        return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            buildBackgroundImage("lib/images/beautiful-young-woman-home-office-working-from-home-teleworking-concept 1.png",
                250, 500),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Expanded(
                  flex: 6,
                  child: SizedBox(height: 10),
                ),
                Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.topCenter,
                  children: [
                    Container(
                      height: 600,
                      width: double.infinity,
                      padding: const EdgeInsets.fromLTRB(18, 90, 18, 50),
                      decoration: BoxDecoration(
                        color: primaryColor,
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: Column(
                          children: [
                            buildTextTitle(
                                "سارة أحمد",
                                16,
                                FontWeight.bold),
                            Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: buildText(
                                  "لخدمات تقنية المعلومات والاستشارات\n في مجال تقنية المعلومات",
                                  10,
                                  FontWeight.normal,
                                  const Color(0xFF848484)),
                            ),

                            SizedBox(
                                height: 70,
                                width: double.infinity,
                                child: _tabs()),
                            Flexible(
                              child: SingleChildScrollView(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: screensTabs(),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: -70,
                      child: circleImg("lib/images/portrait-smiling-woman.jpg")
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),

        bottomNavigationBar: const Padding(
          padding: EdgeInsets.only(bottom: 20.0, left: 20, right: 20),
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            child: BottomBar(),
          ),
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
                  child: buildTextTitle(tab, 13, FontWeight.normal),
                ),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.only(top: 5),
                  height: 2,
                  width: 100,
                  color: _currentTab == index ? const Color(0xFFF59039) : Colors.transparent,
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

}
