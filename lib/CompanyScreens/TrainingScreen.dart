import 'dart:convert';

import 'package:chanceapp/CompanyScreens/TraineeProfile.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

import '../../UI Components/BottomBar.dart';
import '../Core/App_theme.dart';
import '../TraineeScreens/CompanyScreen.dart';
import '../TraineeScreens/TrainingApplied.dart';
import '../TraineeScreens/TrianingDetils.dart';
import '../UI Components/AppBar.dart';
import '../UI Components/BuildText.dart';
import '../UI Components/Cards.dart';
import '../UI Components/SearchBar.dart';
import 'MyAccountForCompany/Data/Trainings.dart';
import 'package:http/http.dart' as http;

import 'TrainingDetails.dart';

class TrainingScreen extends StatefulWidget {
  const TrainingScreen({super.key});

  @override
  State<TrainingScreen> createState() => _TrainingScreenState();
}

class _TrainingScreenState extends State<TrainingScreen> {
  List<String> tabs = ["يتم تقديمها", "تم الانتهاء منها"];

  Future<List<Training>> fetchTrainings(String email) async {
    final response = await http
        .get(Uri.parse('http://192.168.88.42:8085/trainings/company/$email'));

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => Training.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load trainings');
    }
  }

  int _currentTab = 0;

  Widget screensTabs(Training training) {
    final int id = training.id;
    print("id training : $id");
    switch (_currentTab) {
      case 0:
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => TrainingDetailsCompany(id: id),
              ),
            );
          },
          child: BuildCard(
            targetScreen: TrainingDetailsCompany(id: id),
            profileScreen: CompanyScreen(),
            backColor: whiteApp,
            fontColor: fontColorBlack,
            img: "lib/images/acadimic.jpg",
            boxes: secondaryColor,
            skillsList: training.requiredSkills,
            role: "",
            location: training.city,
            company: training.trainingPosition,
            isCompleted: false,
          ),
        );
      case 1:
        return Padding(
          padding: const EdgeInsets.all(18.0),
          child: Image.asset(
            "lib/images/box (1).png",
            height: 130,
            width: 130,
          ),
        );
      default:
        return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: buildAppBar("التدريبات", "lib/images/Asset 6.png", context, false),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 40.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            buildSearchRow(),
            const SizedBox(height: 20),
            SizedBox(height: 70, width: double.infinity, child: _tabs()),
            Flexible(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: FutureBuilder<List<Training>>(
                    future: fetchTrainings("company2@example.com"),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Center(child: Text('خطأ: ${snapshot.error}'));
                      } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                        return const Center(
                            child: Text('لا توجد تدريبات متاحة'));
                      } else {
                        final trainingList = snapshot.data!;
                        return SizedBox(
                          height: 200,
                          child: ListView.builder(
                            itemCount: trainingList.length,
                            itemBuilder: (context, index) {
                              final training = trainingList[index];
                              return screensTabs(training);
                            },
                          ),
                        );
                      }
                    },
                  ),
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
    return Row(
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
                color: _currentTab == index ? primaryColor : Colors.transparent,
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
