import 'package:chanceapp/Core/App_theme.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

import 'BuildText.dart';

List<List<String>> chunkedList(List<String> list, int chunkSize) {
  List<List<String>> chunks = [];
  for (var i = 0; i < list.length; i += chunkSize) {
    chunks.add(list.sublist(
        i, i + chunkSize > list.length ? list.length : i + chunkSize));
  }
  return chunks;
}

Widget buildCard(BuildContext context,Widget targetScreen,Color backColor,Color fontColor,String img,
    Color borderColor,Color boxes,List<String> skillsList,String role,String location,String company,bool isCompleted ) {
  return InkWell(
    onTap:(){
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => targetScreen)
      );
    },
    child: Wrap(
      children: [
        Container(
        width: 370,
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),

        decoration: BoxDecoration(
          color: isCompleted? Colors.grey[300]: backColor,
          borderRadius: BorderRadius.circular(20),
            border: Border.all(color: isCompleted ? Colors.grey[300] ?? Colors.grey : borderColor),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
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
                          company,
                            12,
                            FontWeight.bold,
                            fontColor),
                        buildText(role, 12, FontWeight.normal,
                            fontColor),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Icon(EvaIcons.bookmarkOutline,color: fontColor),
                ),
              ],
            ),
            const SizedBox(height: 26),
            Padding(
              padding: const EdgeInsets.only(right: 60.0),
              child: Row(
                children: [
                  Image.asset(
                    "lib/images/tdesign_location.png",
                    height: 15,
                    width: 15,
                    color: fontColor,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 4.0),
                    child: buildText(
                       location, 12, FontWeight.normal, fontColor),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const SizedBox(width: 60),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: chunkedList(skillsList, 2).map((chunk) {
                    return Wrap(
                      spacing: 1.0,
                      runSpacing: 1.0,
                      children: chunk.map((data) {
                        return Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: buildOvalContainer(
                            data,
                            fontColor,
                            backColor,
                            isCompleted,
                          ),
                        );
                      }).toList(),
                    );
                  }).toList(),
                ),
              ],
            ),
          ],
        ),
      ),
    ]
    ),
  );
}

Widget buildOvalContainer(String text, Color color,
    Color fontColor,bool isCompleted) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(10),
    ),
    child: buildText(text, 10, FontWeight.bold,isCompleted ? Colors.grey : fontColor),
  );
}
