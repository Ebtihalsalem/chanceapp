import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Core/App_theme.dart';
import '../Screens/TypeUser.dart';
import '../TraineeScreens/Intersets.dart';
import 'dart:ui';
import 'BuildText.dart';
import 'Snackbar.dart';

Widget button(String text, BuildContext context, targetScreen, Icon? icon,
    VoidCallback? onPressed) {
  return SizedBox(
    width: 300,
    height: 50,
    child: ElevatedButton(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(
          primaryColor,
        ),
      ),
      onPressed: () async {
        if (onPressed != null) {
          onPressed();
        } else {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (_) => targetScreen),
          );
        }
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
                backgroundColor,
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
