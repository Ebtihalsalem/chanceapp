import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Core/App_theme.dart';

Widget buildSearchRow() {
  return Row(
    children: [
      SizedBox(
        width: 310,
        height: 50,
        child: TextField(
          textDirection: TextDirection.rtl,
          textAlign: TextAlign.right,
          decoration: InputDecoration(
            hintText: "بحث..",
            hintStyle: const TextStyle(
                color: Color(0xFFBBBBBB)),
            filled: true,
            fillColor: const Color(0xFFF3F3F3),
            suffixIcon:
            const Icon(EvaIcons.searchOutline, color: Color(0xFFBBBBBB)),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: borderColor),
              borderRadius: BorderRadius.circular(30),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: borderColor),
              borderRadius: BorderRadius.circular(30),
            ),
          ),
        ),
      ),
      const SizedBox(width: 10),
      _buildFilterIcon(),
    ],
  );
}

Widget _buildFilterIcon() {
  return Container(
    decoration: BoxDecoration(
      color: const Color(0xFFF59039),
      borderRadius: BorderRadius.circular(10),
    ),
    child: const Padding(
      padding: EdgeInsets.all(8.0),
      child: Icon(
        EvaIcons.options2,
        color: Color(0xffE7E7E7),
        size: 30,
      ),
    ),
  );
}
