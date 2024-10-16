import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Core/App_theme.dart';
import '../TraineeScreens/Intersets.dart';
import 'dart:ui';
import 'BuildText.dart';

Widget button(String text, BuildContext context,Widget targetScreen, Icon? icon) {
  return SizedBox(
    width: 300,
    height: 50,
    child: ElevatedButton(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(
          secondaryColor,
        ),
      ),
      onPressed: () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => targetScreen),
        );
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Center(
              child: buildText(
                text,
                16,
                FontWeight.bold,
                primaryColor,
              ),
            ),
          ),
          if (icon != null) ...[
            icon,
          ],
        ],
      ),
    ),
  );
}
