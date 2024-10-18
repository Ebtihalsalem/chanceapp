import 'package:flutter/cupertino.dart';

import '../UI Components/BuildText.dart';
import '../UI Components/Cards.dart';

Widget boxesSkills(List<String> dataList, String maintitle) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      buildTextTitle(maintitle, 18, FontWeight.bold),
      const SizedBox(height: 18.0),
      Wrap(
        spacing: 4.0,
        runSpacing: 4.0,
        children: dataList.map((data) {
          return Padding(
            padding: const EdgeInsets.all(4.0),
            child: buildOvalContainer(
              data,
              const Color(0xFFF59039),
              const Color(0xFFEAEAEA),
            ),
          );
        }).toList(),
      ),
    ],
  );
}