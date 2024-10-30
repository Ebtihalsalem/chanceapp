import 'package:flutter/cupertino.dart';

import 'HeatMap.dart';
import 'BuildText.dart';





final Map<DateTime, String> activities = {
  DateTime(2024, 1, 1): "بداية النشاط",
  DateTime(2024, 2, 10): "تدريب مكثف",
  DateTime(2024, 2, 15): "مشاركة في ورشة عمل",
  DateTime(2024, 3, 20): "تقديم مشروع",
  DateTime(2024, 3, 25): "حضور مؤتمر",
};


Widget traineeActivatesTab(BuildContext context){
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 20.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Align(
            alignment: Alignment.centerRight,
            child: buildTextTitle(
                "النشاط التدريبي", 18, FontWeight.bold)),
        const SizedBox(
          height: 40,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              heatMap(context,activities),
            ],
          ),
        ),
      ],
    ),
  );
}
