import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Core/App_theme.dart';
import 'BuildText.dart';

Widget cards({required String content,required List<String> features,required String price}) {
  return Wrap(children: [
    Container(
      width: 300,
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
      decoration: BoxDecoration(
          color: const Color(0xFFF3F3F3),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
          border: Border.all(color: borderColor)),
      child: Column(
        children: [

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: buildTextTitle(content,26,FontWeight.bold),
          ),
          const SizedBox(height: 18,),
          Container(
            height: 55,
            width: 120,
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
            decoration: BoxDecoration(
              color: secondaryColor,
              borderRadius: BorderRadius.circular(30),),
            child: buildText(price, 18, FontWeight.bold,const Color(0xFFF3F3F3) ),
          ),
          const SizedBox(height: 40,),

          SizedBox(
            height: 150,
            child: ListView.builder(
              itemCount: features.length,
              itemBuilder: (context, index) {
                return Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    color: secondaryColor,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.check,
                    color: Color(0xFFF3F3F3),
                    size: 10,
                  ),
                ),
              ),
              buildTextTitle(features[index], 14, FontWeight.normal)
            ],
          );

              },
            ),
          ),
        ],
      ),
    ),
  ]);
}