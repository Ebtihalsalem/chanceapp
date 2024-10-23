
import 'package:flutter/cupertino.dart';

import '../CompanyScreens/TrainingDetails.dart';
import '../Core/App_theme.dart';
import '../UI Components/Cards.dart';
import 'CompanyScreen.dart';
import 'TrianingDetils.dart';


List<String> skills = ["شبكات واتصالات","علوم الحاسوب"];

Widget trainingsApplied(){
  return SizedBox(
    height: 500,
    child: ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: 10,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: BuildCard(targetScreen: TrianingDetils(),profileScreen: CompanyScreen(),backColor: whiteApp,
              fontColor:  fontColorBlack,img: "lib/images/acadimic.jpg",
              boxes: secondaryColor,skillsList: skills,role:"مهندس اتصالات",location: "مصراتة",
              company: "الاكاديمية الليبية ",isCompleted: false ),
        );
      },
    ),
  );
}