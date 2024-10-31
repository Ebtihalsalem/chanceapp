import 'package:flutter/material.dart';
import '../../UI Components/BottomBar.dart';
import '../Core/App_theme.dart';
import '../UI Components/AppBar.dart';
import '../UI Components/BuildText.dart';
import '../UI Components/SearchBar.dart';
import 'TrainingApplied.dart';
import '../UI Components/TrainingComplated.dart';

class MyTraining extends StatefulWidget {
  const MyTraining({super.key});

  @override
  State<MyTraining> createState() => _MyTrainingState();
}

class _MyTrainingState extends State<MyTraining> {



  bool isActive = true;
  List<String> tabs = ["تم التقدم لها", "تم الانتهاء منها"];

  int _currentTab = 0;
  Widget screensTabs()
  {
    switch(_currentTab){
      case 0:
        return trainingsApplied();
      case 1:
        return trainingCompleted();
      default:
        return Container();
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: buildAppBar("التدريبات","lib/images/Asset 6.png",context,false),
        backgroundColor: primaryColor,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 18.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  buildSearchRow(),

              const SizedBox(height: 22),
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

            ]),
          ),
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


