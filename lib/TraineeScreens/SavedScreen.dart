import 'package:chanceapp/CompanyScreens/CompanyMyProfile.dart';
import 'package:chanceapp/CompanyScreens/TrainingDetails.dart';
import 'package:chanceapp/Core/App_theme.dart';
import 'package:chanceapp/UI%20Components/Cards.dart';
import 'package:flutter/material.dart';
import '../../UI Components/BottomBar.dart';
import '../UI Components/AppBar.dart';
import '../UI Components/BuildText.dart';
import '../UI Components/SearchBar.dart';
import '../UI Components/CompanyScreen.dart';
import 'TrianingDetils.dart';

class SavedScreen extends StatefulWidget {
  const SavedScreen({super.key});

  @override
  State<SavedScreen> createState() => _SavedScreenState();
}

class _SavedScreenState extends State<SavedScreen> {

  List<String> skills = ["شبكات واتصالات", "علوم الحاسوب"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: buildAppBar("المحفوظات", "lib/images/Asset 6.png",context,false),
      backgroundColor: primaryColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 18.0),
          child:
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            buildSearchRow(),
            const SizedBox(height: 26),
            buildTextTitle('التدريبات', 20, FontWeight.bold),
            const SizedBox(height: 22),
            SizedBox(
              height: 500,
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: BuildCard(targetScreen: TrianingDetils(),profileScreen: CompanyScreen(),backColor: whiteApp,
                        fontColor:  fontColorBlack,img: "lib/images/acadimic.jpg",
                        boxes: secondaryColor,skillsList: skills,role:"مهندس اتصالات",location: "مصراتة",
                        company: "الاكاديمية الليبية ",isCompleted: false ),
                  );
                },
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
}
