import 'package:flutter/cupertino.dart';

import 'BuildText.dart';

Widget titleCard(String img,String title,String message) {
  return Container(
    height: 90,
    width: 344,
    decoration: BoxDecoration(
      color: const Color(0xFFFDFDFD),
      borderRadius: BorderRadius.circular(20),
    ),
    padding: const EdgeInsets.all(8),
    child: Column(
      children: [
        Row(
          children: [
            Container(
              width: 70,
              height: 70,
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
                        12,
                        FontWeight.bold,
                        const Color(0xff4A4C4D)),
                    Padding(
                      padding: const EdgeInsets.only(top:16.0),
                      child: buildText(message, 12, FontWeight.normal,
                          const Color(0xff787D82)),
                    ),
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