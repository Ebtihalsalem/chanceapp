import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget circleImg(String img){
  return Center(
    child: CircleAvatar(
      radius: 51.5,
      backgroundColor: Colors.white,
      child: ClipOval(
        child: Image.asset(
          "lib/images/portrait-smiling-woman.jpg",
          width: 100,
          height: 100,
          fit: BoxFit.cover,
        ),
      ),
    ),
  );
}
