import 'dart:convert';
import 'dart:ui';
import 'package:chanceapp/CompanyScreens/AddTraining.dart';
import 'package:chanceapp/CompanyScreens/TrainingDetails.dart';
import 'package:chanceapp/TraineeScreens/TrainingApplied.dart';
import 'package:chanceapp/UI%20Components/BackgroundImg.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import '../../UI Components/BottomBar.dart';
import '../Core/App_theme.dart';
import '../Screens/Auth.dart';
import '../Screens/LoginScreen.dart';
import '../TraineeScreens/AboutCompany.dart';
import '../UI Components/AvailableTrainings.dart';
import '../UI Components/BuildText.dart';
import '../UI Components/CircleImg.dart';
import 'MyAccountForCompany/Data/CompanyUser.dart';
import 'MyAccountForCompany/Data/Trainings.dart';

class CompanyMyProfile extends StatefulWidget {
  const CompanyMyProfile({super.key});

  @override
  State<CompanyMyProfile> createState() => _CompanyMyProfileState();
}

class _CompanyMyProfileState extends State<CompanyMyProfile> {

  List<String> tabs = ["حــول", "التدريبات المتاحة"];

  int _currentTab = 0;

  CompanyUser? userCompany;

  @override
  void initState() {
    super.initState();
    getCompanyInfo(emailGeneral).then((getCompanyInfo) {
      setState(() {
        userCompany = getCompanyInfo;
      });
    });
  }

  Widget screensTabs() {
    if (userCompany == null) {
      return const CircularProgressIndicator();
    }

    switch(_currentTab){
      case 0:
        return aboutTab(userCompany!);
      case 1:
        // return availableTrainings(context,const TrainingDetailsCompany(),fetchTrainings("company@example.com"));
      default:
        return Container();
    }
  }

  Future<List<Training>> fetchTrainings(String email) async {
    final response = await http.get(Uri.parse('http://192.168.88.42:8085/trainings/company/$email'));

    if (response.statusCode == 200) {

      final List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => Training.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load trainings');
    }
  }
  Future<CompanyUser?> getCompanyInfo(String email) async {
    final response = await http.get(Uri.parse('http://192.168.88.42:8085/companies/$email'));

    if (response.statusCode == 200) {
      return CompanyUser.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load company information');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          buildBackgroundImage("lib/images/empty-hallway-office-building.jpg",250,500),
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
                      color: backgroundColor,
                    ),
                    child: Align(
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          buildTextTitle(
                              userCompany!.name,
                              12,
                              FontWeight.bold),
                          Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: buildText(
                                userCompany!.company.description,
                                10,
                                FontWeight.normal,
                                const Color(0xFF848484)),
                          ),
                          Center(
                              child: TextButton(
                                onPressed: () {},
                                child: Container(
                                  height: 34,
                                  width: 200,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: primaryColor),
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left: 18.0, right: 40),
                                        child: Icon(
                                          EvaIcons.edit2Outline,
                                          color: primaryColor,
                                          size: 16,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 4.0),
                                        child: buildText(
                                          'تعديل الحساب',
                                          11,
                                          FontWeight.bold,
                                          primaryColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          const SizedBox(height: 30),
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
                    child: Container(
                      height: 125,
                      width: 125,
                      decoration: const BoxDecoration(
                        color: Color(0xFFE7E7E7),
                        shape: BoxShape.circle,
                      ),
                      clipBehavior: Clip.antiAlias,
                      child: Image.network(
                        urlPhoto,
                        fit: BoxFit.cover,
                      ),
                    ),
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
          //child: BottomBar(),
        ),
      ),
    floatingActionButton: _currentTab == 1
    ? Padding(
      padding: const EdgeInsets.only(left: 18,bottom:10),
      child: FloatingActionButton(
      backgroundColor: primaryColor,
      onPressed: (){
        Navigator.of(context).push(
          MaterialPageRoute(builder: (_)=>AddTraining())
        );
      },
      child: const Icon(EvaIcons.edit2,color: Color(0xFFF1F1F1),)
      ),
    ):null
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

