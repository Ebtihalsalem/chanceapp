import 'package:flutter/cupertino.dart';

import '../UI Components/BuildText.dart';

Widget aboutTab(List<String> summary,List<Map<String, String>> information) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 18),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildTextTitle("ملخص", 14, FontWeight.bold),
        const SizedBox(height: 10),
        ...summary.map((data) {
          return buildTextTitle(data, 12, FontWeight.normal);
        }),
        const SizedBox(height: 20,),
        buildTextTitle("الموقع", 14, FontWeight.bold),
        const SizedBox(height: 10),
        ...information.map((data){
          return buildTextTitle(data["الموقع"]!, 12, FontWeight.normal);
        }),
        const SizedBox(height: 20,),
        buildTextTitle("المجال", 14, FontWeight.bold),
        const SizedBox(height: 10),
        ...information.map((data){
          return buildTextTitle(data["المجال"]!, 12, FontWeight.normal);
        }),
        const SizedBox(height: 20,),
        buildTextTitle("حجم الشركة", 14, FontWeight.bold),
        const SizedBox(height: 10),
        ...information.map((data){
          return buildTextTitle(data["حجم الشركة"]!, 12, FontWeight.normal);
        }),
        const SizedBox(height: 20,),
        buildTextTitle("المقر الرئيسي", 14, FontWeight.bold),
        const SizedBox(height: 10),
        ...information.map((data){
          return buildTextTitle(data["المقر الرئيسي"]!, 12, FontWeight.normal);
        }),
        const SizedBox(height: 20,),
        buildTextTitle("النوع", 14, FontWeight.bold),
        const SizedBox(height: 10),
        ...information.map((data){
          return buildTextTitle(data["نوع"]!, 12, FontWeight.normal);
        }),
        const SizedBox(height: 20,),
        buildTextTitle("تاسست", 14, FontWeight.bold),
        const SizedBox(height: 10),
        ...information.map((data){
          return buildTextTitle(data["تأسست"]!, 12, FontWeight.normal);
        }),
        const SizedBox(height: 20,),
        buildTextTitle("التخصص", 14, FontWeight.bold),
        const SizedBox(height: 10),
        ...information.map((data){
          return buildTextTitle(data["التخصص"]!, 12, FontWeight.normal);
        }),

      ],
    ),
  );
}