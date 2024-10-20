
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';

import '../Core/App_theme.dart';
import 'BuildText.dart';


Widget contentTextGeneral(List<Map<String, String>> dataList,String maintitle,bool edit) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buildTextTitle(maintitle, 16, FontWeight.bold),
          edit?
          Icon(EvaIcons.editOutline, color: secondaryColor, size: 20): Icon(null),
        ],
      ),
      const SizedBox(height: 18.0),
      ...dataList.map((data) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildTextTitle(data["phone"]!,14, FontWeight.normal),
            const SizedBox(height: 18.0),
            buildTextTitle(data["email"]!,14, FontWeight.normal),
            const SizedBox(height: 18.0),
            buildTextTitle(data["place"]!,14, FontWeight.normal),
            const SizedBox(height: 18.0),
            buildTextTitle(data["birth"]!,14, FontWeight.normal),
          ],
        );
      }),
    ],
  );



}

