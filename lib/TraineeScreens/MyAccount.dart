import 'dart:convert';

import 'package:chanceapp/Core/App_theme.dart';
import 'package:chanceapp/TraineeScreens/CvScreen.dart';
import 'package:chanceapp/TraineeScreens/TrackingScreen.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import '../../UI Components/BottomBar.dart';
import '../CompanyScreens/AboutTrainee/Data/User.dart';
import '../Screens/LoginScreen.dart';
import '../UI Components/AppBar.dart';
import '../UI Components/BuildText.dart';
import '../UI Components/CircleImg.dart';
import 'BuildSetting.dart';
import 'package:http/http.dart' as http;


class MyAccount extends StatefulWidget {
  String email;
  MyAccount({super.key,required this.email});

  @override
  State<MyAccount> createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {

  User? user;

  @override
  void initState() {
    super.initState();

    fetchUserData(widget.email).then((fetchedUser) {
      setState(() {
        user = fetchedUser;
      });
    });
  }

  Future<User?> fetchUserData(String email) async {
    final url = Uri.parse('http://192.168.1.4:8085/users/$email');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      return User.fromJson(data);
    } else {
      throw Exception('Failed to load user data');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: buildAppBar("الحساب","lib/images/Asset 6.png",context,false),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 18.0),
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
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
                    child: buildTextTitle(user!.userInformation!.name, 18, FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: Center(
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
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 30.0),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 18.0, right: 80),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 24,
                              vertical: 20,
                            ),
                          ),
                          onPressed: () {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(builder: (context)=> const TrackingScreen())
                            );
                          },
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset(
                                "lib/images/hugeicons_analysis-text-link.png",
                                height: 20,
                                width: 20,
                              ),
                              const SizedBox(height: 4),
                              buildText(
                                "تتبع الخبرة",
                                11,
                                FontWeight.bold,
                                Colors.white,
                              ),
                            ],
                          ),
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 18,
                            vertical: 20,
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(builder: (context)=> CvScreen(email:"exampl10e@example.com",user:user!))
                          );
                        },
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset(
                              "lib/images/profile.png",
                              height: 20,
                              width: 20,
                            ),
                            const SizedBox(height: 4),
                            buildText(
                              "ملفك المهني",
                              11,
                              FontWeight.bold,
                              Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                Flexible(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: buildSettings(context),
                    ),
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
