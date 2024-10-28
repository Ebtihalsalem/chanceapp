import 'package:chanceapp/CompanyScreens/MyAccountForCompany/Data/Trainings.dart';
import 'package:chanceapp/Core/App_theme.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'BuildText.dart';

Widget cardDetails(BuildContext context,String img,
    String? role,String company) {
  return Container(
      height: 70,
      width: 370,
      decoration: BoxDecoration(
        color: whiteApp,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(20),
            topRight:Radius.circular(20)),
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
                            fontColorBlack),

                        role != null?
                        buildText(role, 12, FontWeight.normal,
                            fontColorBlack):SizedBox(width: 1,),
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

Widget information(Training training) {
  return Wrap(
    children: [
      Container(
      width: 367,
      decoration: BoxDecoration(
          color: whiteApp,
          borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(20),
              bottomRight:Radius.circular(20)),),
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
                    Icon(EvaIcons.clockOutline,color: primaryColor,size: 25,),
                    Padding(
                      padding: const EdgeInsets.only(top:8.0,bottom: 8),
                      child: buildText("المدة", 10, FontWeight.normal,fontColorBlack),
                    ),
                    buildTextTitle(training.startDate, 12, FontWeight.bold),
                  ],
                ),
                Column(
                  children: [
                    Icon(EvaIcons.peopleOutline,color: primaryColor,size: 25,),
                    Padding(
                      padding: const EdgeInsets.only(top:8.0,bottom: 8),
                      child: buildText("العدد المطلوب", 10, FontWeight.normal,fontColorBlack),
                    ),
                    buildTextTitle("$training.numberOfPositions", 12, FontWeight.bold),
                  ],
                ),
                // Column(
                //   children: [
                //     Icon(Icons.monetization_on_outlined,color: primaryColor,size: 25,),
                //     Padding(
                //       padding: const EdgeInsets.only(top:8.0,bottom: 8),
                //       child: buildText("الراتب", 10, FontWeight.normal,fontColorBlack),
                //     ),
                //     buildTextTitle(tr, 12, FontWeight.bold),
                //   ],
                // ),
              ],
            ),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top:26.0,right: 18),
                child: buildTextTitle("الوصف", 16, FontWeight.bold),
              ),
              buildTextTitle(training.description, 13, FontWeight.normal),
            ],
          ),
        ],
      ),
    ),
  ]
  );
}