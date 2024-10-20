import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget circleImg(String img){
  return Center(
    child: CircleAvatar(
      radius: 61.5,
      backgroundColor: Colors.white,
      child: ClipOval(
        child: Image.asset(
          img,
          width: 130,
          height: 130,
          fit: BoxFit.cover,
        ),
      ),
    ),
  );
}
