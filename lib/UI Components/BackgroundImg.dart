import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget buildBackgroundImage(String img,double h,double w) {
  return Image.asset(
    img,
    fit: BoxFit.cover,
    width: w,
    height: h,
  );
}
Widget buildBlurOverlay() {
  return BackdropFilter(
    filter: ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0),
    child: Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.black.withOpacity(0.3),
    ),
  );
}

