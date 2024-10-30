import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'BuildText.dart';
void showSnackBar(BuildContext context, String message, {bool isError = false}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              isError ? EvaIcons.alertTriangle : EvaIcons.alertCircleOutline,
              color: isError ? Colors.red : const Color(0xFFF0F0F0),
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.centerLeft,
              child: buildText(
                message,
                14,
                FontWeight.normal,
                const Color(0xFFF0F0F0),
              ),
            ),
          ),
        ],
      ),
      duration: const Duration(seconds: 3),
      backgroundColor: isError ? Colors.red[700] : Colors.black54,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      margin: const EdgeInsets.all(10.0),
    ),
  );
}
