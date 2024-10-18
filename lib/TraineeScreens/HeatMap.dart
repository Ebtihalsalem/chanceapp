
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';

import '../UI Components/BuildText.dart';

Widget heatMap(BuildContext context,Map<DateTime, String> activities){
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
      children: [
        HeatMap(
          startDate: DateTime(DateTime.now().year, 1, 1),
          endDate: DateTime(DateTime.now().year, 12, 30),
          datasets: {
            DateTime(2024, 1, 1): 1,
            DateTime(2024, 2, 10): 5,
            DateTime(2024, 2, 15): 3,
            DateTime(2024, 3, 20): 4,
            DateTime(2024, 3, 25): 5,
          },
          scrollable: true,
          colorMode: ColorMode.opacity,
          defaultColor: const Color(0xfff1f1f1),
          textColor: Colors.black87,
          showColorTip: true,
          onClick: (value) {
            if (activities.containsKey(value)) {

              showActivityDialog(value, activities[value]!,context);
            } else {
              showActivityDialog(value, "لا توجد نشاطات مسجلة.",context);
            }
          },
          colorsets: const {
            1: Color(0xFFFDC89A),
            2: Color(0xFFFFBC82),
            3: Color(0xFFFCAF6C),
            4: Color(0xFFF5A057),
            5: Color(0xFFF7923A),
          },
          margin: const EdgeInsets.all(1),
          borderRadius: 4,
        ),
      ],
    ),
  );
}

void showActivityDialog(DateTime date, String activity,BuildContext context) {
  showDialog(
    builder: (context) {
      return AlertDialog(
        title: Text("النشاط في ${date.day}/${date.month}"),
        content: Text(activity),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: buildText("حسنًا", 16, FontWeight.normal,const Color(0xFFF59039))
          ),
        ],
      );
    }, context: context,
  );
}
