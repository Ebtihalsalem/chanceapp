import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';

import 'BuildText.dart';

Widget traineesTab() {
  return Container(
    height: 90,
    width: 344,
    decoration: BoxDecoration(
        color: const Color(0xFFF3F3F3),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFBBBBBB))),
    padding: const EdgeInsets.all(8),
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(
        children: [
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              image: const DecorationImage(
                image: AssetImage('lib/images/portrait-smiling-woman.jpg'),
              ),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildText('ســارة أحمد', 10, FontWeight.bold,
                    const Color(0xFFF59039)),
                const Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 1.0),
                        child: Icon(
                          EvaIcons.star,
                          size: 13,
                          color: Color(0xFfFFD233),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 1.0),
                        child: Icon(
                          EvaIcons.star,
                          size: 13,
                          color: Color(0xFfFFD233),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 1.0),
                        child: Icon(
                          EvaIcons.star,
                          size: 13,
                          color: Color(0xFfFFD233),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 1.0),
                        child: Icon(
                          EvaIcons.star,
                          size: 13,
                          color: Color(0xFFE6E6E6),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 1.0),
                        child: Icon(
                          EvaIcons.star,
                          size: 13,
                          color: Color(0xFFE6E6E6),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ]),
  );
}