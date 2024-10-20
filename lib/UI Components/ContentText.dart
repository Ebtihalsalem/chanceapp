import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';

import '../Core/App_theme.dart';
import 'BuildText.dart';

Widget contentText(List<Map<String, String>> dataList,String maintitle,bool edit) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buildTextTitle(maintitle, 16, FontWeight.bold),
          edit?
          Icon(EvaIcons.editOutline, color: secondaryColor, size: 20): Icon(null),
        ],
      ),
      const SizedBox(height: 18.0),
      ...dataList.map((data) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildCategory(data["title"]!, data["year"]!),
            if (data["place"] != null && data["place"]!.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(left: 70),
                child: buildTextTitle(data["place"]!, 10, FontWeight.normal),
              ),
            const SizedBox(height: 18.0),
          ],
        );
      }),
    ],
  );

}

Widget buildCategory(String title, String year) {
  return  Row(
    children: [
      Padding(
        padding: const EdgeInsets.only(left: 70),
        child:  buildTextTitle(title, 13, FontWeight.bold),
      ),
      buildTextTitle(year, 12, FontWeight.bold)
    ],

  );
}
