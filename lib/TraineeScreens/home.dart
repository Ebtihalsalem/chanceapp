import 'package:chanceapp/CompanyScreens/TrainingDetails.dart';
import 'package:chanceapp/Core/App_theme.dart';
import 'package:chanceapp/TraineeScreens/CompanyScreen.dart';
import 'package:chanceapp/TraineeScreens/NotifationScreen.dart';
import 'package:flutter/material.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import '../../UI Components/BottomBar.dart';
import '../UI Components/AppBar.dart';
import '../UI Components/BuildText.dart';
import '../UI Components/Cards.dart';
import '../UI Components/SearchBar.dart';
import 'MessageScreen.dart';
import 'TrianingDetils.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

List<String> skills = ["شبكات واتصالات","علوم الحاسوب"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: buildAppBar("مرحبًا، ســأرة أحمد!","lib/images/logo.png",context,true),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Padding(
                   padding: const EdgeInsets.only(top:10.0),
                   child: buildSearchRow(),
                 ),
                const SizedBox(height: 28),
                buildTextTitle('لأجلك', 20, FontWeight.bold),
                const SizedBox(height: 22),
                SizedBox(
                  height: 200,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: BuildCard(targetScreen: TrianingDetils(),profileScreen: CompanyScreen(),backColor: whiteApp,
                           fontColor:  fontColorBlack,img: "lib/images/acadimic.jpg",
                            boxes: secondaryColor,skillsList: skills,role:"مهندس اتصالات",location: "مصراتة",
                            company: "الاكاديمية الليبية ",isCompleted: false ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 26),
                buildTextTitle('توصيات', 20, FontWeight.bold),
                const SizedBox(height: 22),
                SizedBox(
                  height: 200,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child:BuildCard(targetScreen: TrianingDetils(),profileScreen: CompanyScreen(),backColor: whiteApp,
                            fontColor:  fontColorBlack,img: "lib/images/almadar.png",
                            boxes: secondaryColor,skillsList: skills,role:"مهندس شبكات",location: "مصراتة",
                            company: "المــدار ",isCompleted: false ),

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
    );
  }
  

}
