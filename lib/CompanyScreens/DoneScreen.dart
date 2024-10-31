import 'package:chanceapp/CompanyScreens/AddTraining.dart';
import 'package:chanceapp/UI%20Components/CenterAppBar.dart';
import 'package:flutter/material.dart';
import '../Core/App_theme.dart';
import '../UI Components/BuildText.dart';
import '../UI Components/Button.dart';
import 'HomeScreen.dart';

class DoneScreen extends StatefulWidget {
  const DoneScreen({super.key});

  @override
  State<DoneScreen> createState() => _DoneScreenState();
}
class _DoneScreenState extends State<DoneScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: centerAppBar(context, "فرصتك في يدك"),
        body: Align(
          alignment: Alignment.center,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "lib/images/3891940.png",
                  height: 280,
                  width: 280,
                ),
                const SizedBox(height: 25,),
                buildTextTitle("عمل جيد !!",26,FontWeight.bold),
                const SizedBox(height: 20,),
                buildTextTitle("هل تريد نشر تدريب الان؟",
                    15,FontWeight.normal),
                const SizedBox(height: 20,),
                button("نعم",context,const AddTraining(),null,null),
                const SizedBox(height: 16),
                Container(
                  width: 300,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(40),
                      border: Border.all(color: primaryColor)),
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context)=> const CHomeScreen())
                      );
                    },
                    child: Text(
                      "ليس الآن",
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                        color: primaryColor,
                        fontSize: 16,
                        fontFamily: "Tajawal",
                      ),
                    ),
                  ),
                ),
              ]),
        ));
  }
}
