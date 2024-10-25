
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
          defaultColor: const Color(0xFFECECEC),
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
            1: Color(0xFFEC8D60),
            2: Color(0xFFEE7F45),
            3: Color(0xFFEF7531),
            4: Color(0xFFF36E28),
            5: Color(0xFFF26419),
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
        title: buildTextTitle("النشاط في ${date.day}/${date.month}",16,FontWeight.bold),
        content: buildTextTitle(activity,12,FontWeight.normal),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: buildText("حسنًا", 14, FontWeight.normal,const Color(0xFFF59039))
          ),
        ],
      );
    }, context: context,
  );
}
