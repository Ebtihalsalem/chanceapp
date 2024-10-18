import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget buildBackgroundImage() {
  return Image.asset(
    "lib/images/backgroundFill3.jpg",
    fit: BoxFit.cover,
    width: double.infinity,
    height: double.infinity,
  );
}
Widget buildBlurOverlay() {
  return BackdropFilter(
    filter: ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0),
    child: Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.black.withOpacity(0.2),
    ),
  );
}

