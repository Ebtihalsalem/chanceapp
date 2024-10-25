import 'package:chanceapp/Core/App_theme.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

import 'BuildText.dart';
import 'Cards.dart';


List<List<String>> chunkedList(List<String> list, int chunkSize) {
  List<List<String>> chunks = [];
  for (var i = 0; i < list.length; i += chunkSize) {
    chunks.add(list.sublist(
        i, i + chunkSize > list.length ? list.length : i + chunkSize));
  }
  return chunks;
}

Widget personCard(BuildContext context,Widget targetScreen,String img,
   String name,String? train) {
  return InkWell(
    onTap:(){
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => targetScreen)
      );
    },
    child: Container(
      height: 90,
      width: 344,
      decoration: BoxDecoration(
          color: whiteApp,
          borderRadius: BorderRadius.circular(20),
          ),
      padding: const EdgeInsets.all(8),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildText(name, 10, FontWeight.bold,
                      fontColorBlack),
                  train !=null?
                  buildText(train, 10,
                      FontWeight.normal, fontColorBlack): SizedBox(width: 1,),

                  const Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 1.0),
                          child: Icon( EvaIcons.star,
                            size: 13,
                            color: Color(0xFfFFD233),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 1.0),
                          child: Icon( EvaIcons.star,
                            size: 13,
                            color: Color(0xFfFFD233),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 1.0),
                          child: Icon( EvaIcons.star,
                            size: 13,
                            color: Color(0xFfFFD233),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 1.0),
                          child: Icon( EvaIcons.star,
                            size: 13,
                            color: Color(0xFFE6E6E6),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 1.0),
                          child: Icon( EvaIcons.star,
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
    ),
  );
}

