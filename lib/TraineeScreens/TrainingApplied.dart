
import 'package:flutter/cupertino.dart';

import '../CompanyScreens/TrainingDetails.dart';
import '../Core/App_theme.dart';
import '../UI Components/Cards.dart';


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
          child: buildCard(context, const TrainingDetailsCompany(),const TrainingDetailsCompany(), secondaryColor,
              primaryColor, "lib/images/acadimic.jpg", secondaryColor, primaryColor,
              skills, "مهندس اتصالات", "مصراتة", "الاكاديمية الليبية",false),
        );
      },
    ),
  );
}