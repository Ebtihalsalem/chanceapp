import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';

import '../CompanyScreens/AboutTrainee/Data/WorkExperience.dart';
import '../Core/App_theme.dart';
import 'BuildText.dart';

Widget contentText(String title1,String title2,String title3,
    String? date,String maintitle, bool edit) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buildTextTitle(maintitle, 16, FontWeight.bold),
          edit
              ? Icon(EvaIcons.editOutline, color: primaryColor, size: 20)
              : Icon(null),
        ],
      ),
      const SizedBox(height: 18.0),
      // ...dataList.map((data) {
      //   return Column(
      //     crossAxisAlignment: CrossAxisAlignment.start,
      //     children: [
            buildCategory(title1, title3,date),
            if ((title2).isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(left: 70),
                child: buildTextTitle(title2, 10, FontWeight.normal),
              ),
            const SizedBox(height: 18.0),
        //   ],
        // );
      // }),
    ],
  );
}

Widget buildCategory(String title, String year,String? year2) {
  return Row(
    children: [
      Padding(
        padding: const EdgeInsets.only(left: 70),
        child: buildTextTitle(title, 13, FontWeight.bold),
      ),
      year2 == null?
      buildTextTitle(year, 12, FontWeight.bold)
      : buildTextTitle("$year-$year2", 12, FontWeight.bold)
    ],
  );
}
