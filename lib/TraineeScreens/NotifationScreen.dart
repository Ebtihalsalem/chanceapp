import 'package:chanceapp/Core/App_theme.dart';
import 'package:chanceapp/UI%20Components/Notifcation.dart';
import 'package:chanceapp/UI%20Components/TitleCards.dart';
import 'package:flutter/material.dart';

import '../../UI Components/BottomBar.dart';
import '../UI Components/AppBar.dart';
import '../UI Components/BuildText.dart';

class NotifationScreen extends StatefulWidget {
  const NotifationScreen({super.key});

  @override
  State<NotifationScreen> createState() => _NotifationScreenState();
}

class _NotifationScreenState extends State<NotifationScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: buildAppBar("الاشعارات","lib/images/logo.png",context,false),
        backgroundColor: primaryColor,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 18.0),
            child:
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const SizedBox(height: 22),
              Expanded(
                child: SizedBox(
                  height: 500,
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: notifaction("الاكاديمية الليبية","lib/images/acadimic.jpg"),
                      );
                    },
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



}
