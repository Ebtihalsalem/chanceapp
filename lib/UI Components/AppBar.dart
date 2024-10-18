import 'package:flutter/material.dart';

import '../Core/App_theme.dart';
import 'BuildText.dart';

AppBar buildAppBar(String title,String img) {
  return AppBar(
    backgroundColor: primaryColor,
    automaticallyImplyLeading: false,
    title: Padding(
      padding: const EdgeInsets.only(top: 18, right: 18.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            img,
            height: 25,
            width: 25,
          ),
          const SizedBox(
            width: 10,
          ),
          buildTextTitle(title, 16, FontWeight.bold,),
        ],
      ),
    ),
  );
}