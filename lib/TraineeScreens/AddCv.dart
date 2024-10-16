import 'package:chanceapp/Core/App_theme.dart';
import 'package:chanceapp/UI%20Components/TextField.dart';
import 'package:flutter/material.dart';

import '../UI Components/BuildText.dart';

class AddCv extends StatefulWidget {

  final String title;
  final String name;

  const AddCv({super.key, required this.title, required this.name});

  @override
  State<AddCv> createState() => _AddCvState();
}

class _AddCvState extends State<AddCv> {

  @override
  Widget build(BuildContext context) {

    String title = widget.title;
    String name = widget.name;

    return AlertDialog(
      backgroundColor: primaryColor,
      title:  Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "lib/images/logo.png",
            height: 15,
            width: 15,
          ),
          const SizedBox(
            width: 10,
          ),
           buildText(title,
               15,FontWeight.bold,Color(0xFF4A4C4D)),
        ],
      ),
      content:
      Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                 Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5, right: 20),
                      child: Text(
                        name,
                        style: const TextStyle(
                            fontFamily: "Tajawal",
                            color: Color(0xFF4A4C4D),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                textField(name, null, 50, 320),
                const SizedBox(height: 15,),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 5,  right: 20),
                      child: Text(
                        "تاريخ الحصول عليها",
                        style: TextStyle(
                            fontFamily: "Tajawal",
                            color: Color(0xFF4A4C4D),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                textField("0000/00/00", null, 50, 320),

                const SizedBox(height: 15,),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 5,  right: 20),
                      child: Text(
                        "مكان الحصول عليها",
                        style: TextStyle(
                            fontFamily: "Tajawal",
                            color: Color(0xFF4A4C4D),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                textField("اسم الجهة", null, 50, 320),
                const SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: buildText("الغاء",17,FontWeight.bold,secondaryColor),
                    ),
                    Container(
                      height: 40,
                      width: 80,
                      decoration: BoxDecoration(
                          color: secondaryColor,
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: TextButton(
                        onPressed: () {},
                        child:  buildText("اضافة",15,FontWeight.bold,Colors.white),
                      ),
                    ),
                  ],
                ),

              ],
            ),
          ),
        ],
      ),

    );

  }

}

