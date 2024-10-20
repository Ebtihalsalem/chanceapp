import 'package:chanceapp/Core/App_theme.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../UI Components/BuildText.dart';
import '../UI Components/Cards.dart';

Widget availableTrainings(BuildContext context,Widget targetScreen,
    List<String> skillsList,String role,String location,String num,String money,String time ) {
  return InkWell(
    onTap: ()
  {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => targetScreen)
    );
    },
    child: Container(
      height: 130,
      width: 344,
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 18,vertical: 18),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildText(role, 14, FontWeight.bold,
                          const Color(0xffEFEFEF)),
                    ],
                  ),
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Image.asset(
                        "lib/images/tdesign_location.png",
                        height: 16,
                        width: 16,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: buildText(
                            location, 10, FontWeight.bold, const Color(0xffEFEFEF)),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      const Icon(EvaIcons.clockOutline,color: Color(0xFFEFEFEF),size: 16,),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: buildText(time, 10, FontWeight.bold,const Color(0xFFEFEFEF)),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      const Icon(EvaIcons.peopleOutline,color: Color(0xFFEFEFEF),size: 16,),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: buildText(num, 10, FontWeight.bold,const Color(0xFFEFEFEF)),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      const Icon(Icons.monetization_on_outlined,color: Color(0xFFEFEFEF),size: 16,),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: buildText(money, 10, FontWeight.bold,const Color(0xFFEFEFEF)),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              const SizedBox(width: 60),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: chunkedList(skillsList, 2).map((chunk) {
                  return Wrap(
                    spacing: 1.0,
                    runSpacing: 1.0,
                    children: chunk.map((data) {
                      return Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: _buildOvalContainer(
                          data
                        ),
                      );
                    }).toList(),
                  );
                }).toList(),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
Widget _buildOvalContainer(String text) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    decoration: BoxDecoration(
      color: primaryColor,
      borderRadius: BorderRadius.circular(10),
      border: Border.all(color: borderColor),
    ),
    child: buildText(text, 10, FontWeight.bold,secondaryColor),
  );
}