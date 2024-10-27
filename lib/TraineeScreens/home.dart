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
        backgroundColor: const Color(0xffEFEFEF),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 40.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 buildSearchRow(),
                const SizedBox(height: 26),
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
                        child: buildCard(context,const TrianingDetils(),const CompanyScreen(),secondaryColor,primaryColor,"lib/images/acadimic.jpg",
                            secondaryColor,primaryColor,skills,"مهندس اتصالات","مصراتة","الاكاديمية الليبية ",false ),
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
                        child: buildCard(context,const TrianingDetils(),const CompanyScreen(),primaryColor,secondaryColor,"lib/images/almadar.png",
                            borderColor,secondaryColor,skills,"مهندس شبكات","مصراتة","المــدار ",false ),
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
