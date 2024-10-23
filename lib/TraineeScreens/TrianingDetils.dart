import 'package:chanceapp/TraineeScreens/ReqScreen.dart';
import 'package:chanceapp/TraineeScreens/home.dart';
import 'package:chanceapp/UI%20Components/TextField.dart';
import 'package:chanceapp/UI%20Components/textFieldWithoutIcon.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

import '../../UI Components/BottomBar.dart';
import '../Core/App_theme.dart';
import '../UI Components/AppBar.dart';
import '../UI Components/Button.dart';
import '../UI Components/CardDetails.dart';


class TrianingDetils extends StatefulWidget {
  const TrianingDetils({super.key});

//تمرير له لون والبيانات اللون حسب اذا كان من التوصيات او لاجلك


  @override
  State<TrianingDetils> createState() => _TrianingDetilsState();
}

class _TrianingDetilsState extends State<TrianingDetils> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: buildAppBar("التدريب", "lib/images/logo.png", context, false),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 22),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: cardDetails(
                    context,
                    "lib/images/acadimic.jpg",
                    "مهندس اتصالات",
                    "الاكاديمية الليبية "),
              ),
              information(
                    "شهرين",
                    "20",
                    "يوجد"),

              const SizedBox(height: 15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(
                      Icons.favorite_border, color: primaryColor, size: 30),
                  Icon(
                      EvaIcons.messageCircleOutline, color: primaryColor,
                      size: 26),
                  textFieldWithoutIcon("تعليقك..", 45, 270)
                ],
              ),
              const SizedBox(height: 260,),
              Center(
                child: SizedBox(
                  width: 300,
                  height: 50,
                  child:
                  button(
                      "طلب التدريب", context, const RequestScreen(), null, null),
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

