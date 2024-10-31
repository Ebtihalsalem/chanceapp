import 'package:chanceapp/UI%20Components/CenterAppBar.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import '../Core/App_theme.dart';
import '../UI Components/BuildText.dart';
import '../UI Components/Button.dart';

class RequestScreen extends StatefulWidget {
  const RequestScreen({super.key});

  @override
  State<RequestScreen> createState() => _RequestScreenState();
}

class _RequestScreenState extends State<RequestScreen> {

  // final TextEditingController usernameController = TextEditingController();
  // final TextEditingController _passwordController = TextEditingController();
  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: centerAppBar(context,"فرصتك في يدك"),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 18.0,horizontal: 18),
          child: Align(
            alignment: Alignment.center,
            child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Image.asset(
                "lib/images/4750864.png",
                height: 280,
                width: 280,
              ),
              const SizedBox(
                height: 25,
              ),

              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 40.0),
                  child: buildTextTitle(
                      "اضافة ملف CV ", 15, FontWeight.normal),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Container(
                  height: 45,
                  width: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: borderColor),
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(Icons.add_circle_rounded,color: borderColor,),
                      )),
                ),
              ),
              const SizedBox(
                height: 200,
              ),
              button("ارسال",context,Container(),null,null),
            ]),
          ),
        ));
  }
}
