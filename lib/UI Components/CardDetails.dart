import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'BuildText.dart';

Widget cardDetails(BuildContext context,Color backColor,Color fontColor,String img,
    Color borderColor,String role,String company) {
  return Container(
      height: 70,
      width: 370,
      decoration: BoxDecoration(
        color: backColor,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(img),
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buildText(
                            company,
                            12,
                            FontWeight.bold,
                            fontColor),
                        buildText(role, 12, FontWeight.normal,
                            fontColor),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ]
      )
  );
}

Widget information(String time,String num,String money,Color fontColorTitle,Color backColor,Color iconColor,Color borderColor) {
  return Wrap(
    children: [
      Container(
      height: 260,
      width: 370,
      decoration: BoxDecoration(
          color: backColor,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: borderColor)),
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Icon(EvaIcons.clockOutline,color: iconColor,size: 25,),
                    Padding(
                      padding: const EdgeInsets.only(top:8.0,bottom: 8),
                      child: buildText("المدة", 10, FontWeight.normal,fontColorTitle),
                    ),
                    buildTextTitle(time, 12, FontWeight.bold),
                  ],
                ),
                Column(
                  children: [
                    const Icon(EvaIcons.peopleOutline,color: Color(0xFFF59039),size: 25,),
                    Padding(
                      padding: const EdgeInsets.only(top:8.0,bottom: 8),
                      child: buildText("العدد المطلوب", 10, FontWeight.normal,fontColorTitle),
                    ),
                    buildTextTitle(num, 12, FontWeight.bold),
                  ],
                ),
                Column(
                  children: [
                    const Icon(Icons.monetization_on_outlined,color: Color(0xFFF59039),size: 25,),
                    Padding(
                      padding: const EdgeInsets.only(top:8.0,bottom: 8),
                      child: buildText("الراتب", 10, FontWeight.normal,fontColorTitle),
                    ),
                    buildTextTitle(money, 12, FontWeight.bold),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top:26.0,right: 18),
            child: buildTextTitle("الوصف", 16, FontWeight.bold),
          ),
        ],
      ),
    ),
  ]
  );
}