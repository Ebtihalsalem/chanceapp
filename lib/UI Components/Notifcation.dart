import 'package:flutter/cupertino.dart';

import 'BuildText.dart';

Widget notifaction(String title,String img) {
  return Container(
    height: 60,
    width: 344,
    decoration: BoxDecoration(
      color: const Color(0xFFF3F3F3),
      borderRadius: BorderRadius.circular(20),
    ),
    padding: const EdgeInsets.all(8),
    child: Column(
      children: [
        Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(img),
                ),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildText(
                        title,
                        10,
                        FontWeight.normal,
                        const Color(0xff4A4C4D)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}