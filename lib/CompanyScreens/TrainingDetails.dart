import 'dart:convert';
import 'package:chanceapp/CompanyScreens/TraineeProfile.dart';
import 'package:chanceapp/Screens/Auth.dart';
import 'package:chanceapp/UI%20Components/PersonCard.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../UI Components/BottomBar.dart';
import '../Core/App_theme.dart';
import '../Screens/LoginScreen.dart';
import '../UI Components/AppBar.dart';
import '../UI Components/BuildText.dart';
import '../UI Components/CardDetails.dart';
import '../UI Components/TitleCards.dart';
import '../UI Components/aboutTabForTrainee.dart';
import 'MyAccountForCompany/Data/Trainings.dart';

class TrainingDetailsCompany extends StatefulWidget {
  final int id;
  const TrainingDetailsCompany({super.key,required this.id});

  @override
  State<TrainingDetailsCompany> createState() => _TrainingDetailsCompanyState();
}

class _TrainingDetailsCompanyState extends State<TrainingDetailsCompany> {
  List<String> tabs = ["بيانات التدريب", "المتدربين"];

  int _currentTab = 0;

  late Future<Training> trainingDetails;

  @override
  void initState() {
    super.initState();
    trainingDetails = fetchInfoTraining(widget.id);
  }

  Widget screensTabs(Training trainings) {
    switch (_currentTab) {
      case 0:
        return information(trainings);
      case 1:
        return SizedBox(
          height: 500,
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: 10,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: personCard(context, TraineeProfile(email:emailGeneral),
                    "lib/images/portrait-smiling-woman.jpg","ســارة أحمد",null),
              );
            },
          ),
        );
      default:
        return Container();
    }
  }

  Future<Training> fetchInfoTraining(int id) async {
    final response = await http.get(Uri.parse('http://192.168.1.4:8085/trainings/$id'));
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      return Training.fromJson(data);
    } else {
      throw Exception('Failed to load training');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: buildAppBar("التدريب","lib/images/Asset 6.png",context,false),
        backgroundColor: const Color(0xffEFEFEF),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 18.0),
            child: FutureBuilder<Training>(
              future: trainingDetails,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return const Center(child: Text("فشل في تحميل البيانات"));
                } else if (snapshot.hasData) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      cardDetails(context, "lib/images/acadimic.jpg", null, "مهندس اتصالات"),
                      const SizedBox(height: 30),
                      SizedBox(height: 70, width: double.infinity, child: _tabs()),
                      Flexible(
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: screensTabs(snapshot.data!),
                          ),
                        ),
                      ),
                    ],
                  );
                } else {
                  return Center(child: Text("لا توجد بيانات متاحة"));
                }
              },
            ),
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
                  color: _currentTab == index
                      ? const Color(0xFFF59039)
                      : Colors.transparent,
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }


}
