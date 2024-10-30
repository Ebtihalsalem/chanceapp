
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';

import '../Core/App_theme.dart';
import 'BuildText.dart';


Widget contentTextGeneral(String email,String phone,String location,String birth,String maintitle,bool edit) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buildTextTitle(maintitle, 16, FontWeight.bold),
          edit?
          Icon(EvaIcons.editOutline, color: primaryColor, size: 20): Icon(null),
        ],
      ),
      const SizedBox(height: 18.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildTextTitle(phone,14, FontWeight.normal),
            const SizedBox(height: 18.0),
            buildTextTitle(email,14, FontWeight.normal),
            const SizedBox(height: 18.0),
            buildTextTitle(location,14, FontWeight.normal),
            const SizedBox(height: 18.0),
            buildTextTitle(birth,14, FontWeight.normal),
          ],
        ),
    ],
  );



}

