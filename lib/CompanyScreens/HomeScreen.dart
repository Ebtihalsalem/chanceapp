import 'package:chanceapp/CompanyScreens/AddTraining.dart';
import 'package:chanceapp/CompanyScreens/TraineeProfile.dart';
import 'package:chanceapp/Core/App_theme.dart';
import 'package:chanceapp/UI%20Components/BCards.dart';
import 'package:chanceapp/UI%20Components/PersonCard.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

import '../../UI Components/BottomBar.dart';
import '../UI Components/AppBar.dart';
import '../UI Components/BuildText.dart';
import '../UI Components/Cards.dart';
import '../UI Components/SearchBar.dart';

class CHomeScreen extends StatefulWidget {
  const CHomeScreen({super.key});

  @override
  State<CHomeScreen> createState() => _CHomeScreenState();
}

class _CHomeScreenState extends State<CHomeScreen> {
  List<String> personalSkillsList = [
    "حس المسؤولية",
    "التواصل مع الأخرين",
    "العمل مع فريق",
    "قدرات إبداعية",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: buildAppBar("الرئيسية","lib/images/logo.png",context,true),
        backgroundColor: const Color(0xffEFEFEF),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildSearchRow(),
                // ),
                const SizedBox(height: 26),
                buildTextTitle('لأجلك', 20, FontWeight.bold),
                const SizedBox(height: 22),
                SizedBox(
                  height: 200,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: buildCard(context,const TraineeProfile(),secondaryColor,
                            primaryColor,"lib/images/portrait-smiling-woman.jpg",
                            secondaryColor,primaryColor,personalSkillsList,"مهتمة بمجال شركتك","مصراتة","سارة أحمد ",false ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 26),
                buildTextTitle('المتدربين لديك', 20, FontWeight.bold),
                const SizedBox(height: 22),
                SizedBox(
                  height: 210,
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: personCard(context,const TraineeProfile(),
                            "lib/images/portrait-smiling-woman.jpg",
                            "سارة أحمد ","من تدريب التصميم الجرافكي"),
                      );
                    },
                  ),
                ),
              ],
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
          floatingActionButton: Padding(
            padding: const EdgeInsets.only(left: 18,bottom:10),
            child: FloatingActionButton(
                backgroundColor: const Color(0xFFF59039),
                onPressed: (){
                  showDialog(
                    context: context,
                    builder: (context) {
                      return const AddTraining();

                    },);
                },
                child: const Icon(EvaIcons.edit2,color: Color(0xFFF1F1F1),)
            ),
          ),
    );
  }

}
