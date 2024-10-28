import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';

import '../Core/App_theme.dart';
import '../UI Components/BuildText.dart';
import '../UI Components/Cards.dart';

Widget boxesSkills(List<String> dataList, String maintitle,bool edit) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
       mainAxisAlignment: MainAxisAlignment.spaceBetween,
       children: [
          buildTextTitle(maintitle, 16, FontWeight.bold),
          edit ?
          Icon(EvaIcons.editOutline, color: primaryColor, size: 20)
         : Icon(null),
        ],
      ),
      const SizedBox(height: 18.0),
      Wrap(
        spacing: 4.0,
        runSpacing: 4.0,
        children: dataList.map((data) {
          return Padding(
            padding: const EdgeInsets.all(4.0),
            child: buildOvalContainer(
              data,
              false
            ),
          );
        }).toList(),
      ),
    ],
  );
}