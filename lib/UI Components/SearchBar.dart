import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Core/App_theme.dart';

Widget buildSearchRow() {
  return Row(
    children: [
      Container(
        width: 310,
        height: 50,
        decoration: BoxDecoration(),
        child: TextField(
          textDirection: TextDirection.rtl,
          textAlign: TextAlign.right,
          decoration: InputDecoration(
            hintText: "بحث..",
            hintStyle: const TextStyle(
                color: Color(0xFFBBBBBB)),
            filled: true,
            fillColor: whiteApp,
            suffixIcon:
            const Icon(EvaIcons.searchOutline, color: Color(0xFFBBBBBB)),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(30),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
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
      color: primaryColor,
      borderRadius: BorderRadius.circular(10),
    ),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Icon(
        EvaIcons.options2,
        color: whiteApp,
        size: 28,
      ),
    ),
  );
}
