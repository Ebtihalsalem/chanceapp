import 'package:chanceapp/Core/App_theme.dart';
import 'package:chanceapp/TraineeScreens/CvScreen.dart';
import 'package:chanceapp/TraineeScreens/TrackingScreen.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import '../../UI Components/BottomBar.dart';
import '../Screens/LoginScreen.dart';
import '../UI Components/AppBar.dart';
import '../UI Components/BuildText.dart';
import '../UI Components/CircleImg.dart';
import 'BuildSetting.dart';


class MyAccount extends StatefulWidget {
  const MyAccount({super.key});

  @override
  State<MyAccount> createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
  String? fullName;
  String? avatarUrl;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: buildAppBar("الحساب","lib/images/logo.png",context,false),
        backgroundColor:primaryColor,

        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 35.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: CircleAvatar(
                  radius: 51.5,
                  backgroundColor: Colors.white,
                  child: ClipOval(
                    child: avatarUrl != null
                        ? Image.network(
                      avatarUrl!, // عرض الصورة من الرابط
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    )
                        : Container(), // إذا لم يكن هناك صورة
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                 // child: _buildHeaderTextTitle('ســارة أحمد', 18, FontWeight.bold),
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
                        border: Border.all(color: const Color(0xFFF59039)),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 18.0, right: 40),
                            child: Icon(
                              EvaIcons.edit2Outline,
                              color: secondaryColor,
                              size: 16,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 4.0),
                            child: buildText(
                              'تعديل الحساب',
                              11,
                              FontWeight.bold,
                              const Color(0xFFF59039),
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
                          backgroundColor: secondaryColor,
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
                        backgroundColor: secondaryColor,
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
                            MaterialPageRoute(builder: (context)=> const CvScreen())
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
        bottomNavigationBar: const Padding(
          padding: EdgeInsets.only(bottom: 20.0, left: 20, right: 20),
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            child: BottomBar(),
          ),
        ),
      ),
    );
  }
}
