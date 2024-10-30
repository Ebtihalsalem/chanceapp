import 'package:chanceapp/UI%20Components/CenterAppBar.dart';
import 'package:chanceapp/UI%20Components/CircleImg.dart';
import 'package:chanceapp/UI%20Components/aboutTabForTrainee.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

import '../../UI Components/BottomBar.dart';
import '../CompanyScreens/AboutTrainee/Data/User.dart';
import '../Core/App_theme.dart';
import '../Screens/LoginScreen.dart';
import '../UI Components/BuildText.dart';

class CvScreen extends StatefulWidget {
  String email;
  User user;
  CvScreen({super.key, required this.email,required this.user});

  @override
  State<CvScreen> createState() => _CvScreenState();
}

class _CvScreenState extends State<CvScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:centerAppBar(context,"الملف الشخصي"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 35.0),
        child: Column(

          children: [
            Container(
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
            // circleImg("lib/images/portrait-smiling-woman.jpg"),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child:
                    buildTextTitle(widget.user.userInformation!.name, 18, FontWeight.bold),
              ),
            ),
            Flexible(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: aboutTabForTrainee(true,widget.user),
                ),
              ),
            ),
          ],
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
