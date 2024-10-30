// import 'package:chanceapp/Core/App_theme.dart';
// import 'package:eva_icons_flutter/eva_icons_flutter.dart';
// import 'package:flutter/material.dart';
// import 'BuildText.dart';
//
// List<List<String>> chunkedList(List<String> list, int chunkSize) {
//   List<List<String>> chunks = [];
//   for (var i = 0; i < list.length; i += chunkSize) {
//     chunks.add(list.sublist(
//         i, i + chunkSize > list.length ? list.length : i + chunkSize));
//   }
//   return chunks;
// }
//
// class BuildCard extends StatefulWidget {
//   final Widget targetScreen;
//   final Widget profileScreen;
//   final Color backColor;
//   final Color fontColor;
//   final String img;
//   final Color boxes;
//   final List<String> skillsList;
//   final String role;
//   final String location;
//   final String company;
//   final bool isCompleted;
//
//   const BuildCard({
//     super.key,
//     required this.targetScreen,
//     required this.profileScreen,
//     required this.backColor,
//     required this.fontColor,
//     required this.img,
//     required this.boxes,
//     required this.skillsList,
//     required this.role,
//     required this.location,
//     required this.company,
//     required this.isCompleted,
//   });
//
//   @override
//   BuildCardState createState() => BuildCardState();
// }
//
// class BuildCardState extends State<BuildCard> {
//   bool isSaved = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () {
//         Navigator.of(context).push(
//             MaterialPageRoute(builder: (context) => widget.targetScreen));
//       },
//       child: Wrap(
//         children: [
//           Container(
//             width: 370,
//             padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
//             decoration: BoxDecoration(
//               color: widget.isCompleted ? Colors.grey[300] : widget.backColor,
//               borderRadius: BorderRadius.circular(20),
//             ),
//             child: Column(
//               children: [
//                 Row(
//                   children: [
//                     InkWell(
//                       onTap: () {
//                         Navigator.of(context).push(
//                             MaterialPageRoute(builder: (context) => widget.profileScreen));
//                       },
//                       child: Container(
//                         width: 50,
//                         height: 50,
//                         decoration: BoxDecoration(
//                           image: DecorationImage(
//                             image: AssetImage(widget.img),
//                           ),
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                       ),
//                     ),
//                     Expanded(
//                       child: Padding(
//                         padding: const EdgeInsets.only(right: 10.0),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             buildText(
//                                 widget.company,
//                                 12,
//                                 FontWeight.bold,
//                                 widget.fontColor),
//                             buildText(widget.role, 12, FontWeight.normal,
//                                 widget.fontColor),
//                           ],
//                         ),
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(left: 8.0),
//                       child: InkWell(
//                         onTap: () {
//                           setState(() {
//                             isSaved = !isSaved; // تغيير حالة الحفظ
//                           });
//                         },
//                         child: Icon(
//                           isSaved ? EvaIcons.bookmark : EvaIcons.bookmarkOutline, // التبديل بين الأيقونتين
//                           color: widget.fontColor,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 26),
//                 Padding(
//                   padding: const EdgeInsets.only(right: 60.0),
//                   child: Row(
//                     children: [
//                       Icon(
//                         Icons.location_on_sharp,
//                         color: Color(0xFF848484),
//                         size: 15,
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.only(right: 4.0),
//                         child: buildText(
//                             widget.location, 12, FontWeight.normal, const Color(0xFF848484)),
//                       ),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(height: 8),
//                 Row(
//                   children: [
//                     const SizedBox(width: 60),
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: chunkedList(widget.skillsList, 2).map((chunk) {
//                         return Wrap(
//                           spacing: 1.0,
//                           runSpacing: 1.0,
//                           children: chunk.map((data) {
//                             return Padding(
//                               padding: const EdgeInsets.all(2.0),
//                               child: buildOvalContainer(
//                                 data,
//                                 widget.isCompleted,
//                               ),
//                             );
//                           }).toList(),
//                         );
//                       }).toList(),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// Widget buildOvalContainer(String text, bool isCompleted, [Color? color]) {
//   return Container(
//     padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//     decoration: BoxDecoration(
//       color: color ?? secondaryColor, // استخدام اللون المحدد أو اللون الافتراضي
//       borderRadius: BorderRadius.circular(10),
//     ),
//     child: buildText(text, 10, FontWeight.bold, isCompleted ? Colors.grey : Colors.white),
//   );
// }
//
import 'package:chanceapp/Core/App_theme.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../TraineeScreens/saved_trainings_provider.dart';
import 'BuildText.dart';
import 'package:provider/provider.dart';

import 'PersonCard.dart';

class BuildCard extends StatefulWidget {
  final Widget targetScreen;
  final Widget profileScreen;
  final Color backColor;
  final Color fontColor;
  final String img;
  final Color boxes;
  final List<String> skillsList;
  final String role;
  final String location;
  final String company;
  final bool isCompleted;

  const BuildCard({
    super.key,
    required this.targetScreen,
    required this.profileScreen,
    required this.backColor,
    required this.fontColor,
    required this.img,
    required this.boxes,
    required this.skillsList,
    required this.role,
    required this.location,
    required this.company,
    required this.isCompleted,
  });

  @override
  BuildCardState createState() => BuildCardState();
}

class BuildCardState extends State<BuildCard> {
  @override
  Widget build(BuildContext context) {
    final savedTrainingProvider = Provider.of<SavedTrainingProvider>(context);
    bool isSaved = savedTrainingProvider.isTrainingSaved(widget.role);

    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => widget.targetScreen),
        );
      },
      child: Wrap(
        children: [
          Container(
            width: 370,
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
            decoration: BoxDecoration(
              color: widget.isCompleted ? Colors.grey[300] : widget.backColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => widget.profileScreen),
                        );
                      },
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(widget.img),
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            buildText(widget.company, 12, FontWeight.bold, widget.fontColor),
                            buildText(widget.role, 12, FontWeight.normal, widget.fontColor),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: InkWell(
                        onTap: () {
                          if (isSaved) {
                            savedTrainingProvider.removeTraining(widget.role);
                          } else {
                            savedTrainingProvider.saveTraining(widget.role);
                          }
                        },
                        child: Icon(
                          isSaved ? EvaIcons.bookmark : EvaIcons.bookmarkOutline,
                          color: widget.fontColor,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 26),
                Padding(
                  padding: const EdgeInsets.only(right: 60.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.location_on_sharp,
                        color: Color(0xFF848484),
                        size: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 4.0),
                        child: buildText(widget.location, 12, FontWeight.normal, const Color(0xFF848484)),
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
                      children: chunkedList(widget.skillsList, 2).map((chunk) {
                        return Wrap(
                          spacing: 1.0,
                          runSpacing: 1.0,
                          children: chunk.map((data) {
                            return Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: buildOvalContainer(
                                data,
                                widget.isCompleted,
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
        ],
      ),
    );
  }
}

Widget buildOvalContainer(String text, bool isCompleted, [Color? color]) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    decoration: BoxDecoration(
      color: color ?? secondaryColor, // استخدام اللون المحدد أو اللون الافتراضي
      borderRadius: BorderRadius.circular(10),
    ),
    child: buildText(text, 10, FontWeight.bold, isCompleted ? Colors.grey : Colors.white),
  );
}
