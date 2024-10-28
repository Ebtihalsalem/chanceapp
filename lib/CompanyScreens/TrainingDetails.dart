// import 'package:chanceapp/CompanyScreens/TraineeProfile.dart';
// import 'package:chanceapp/UI%20Components/PersonCard.dart';
// import 'package:eva_icons_flutter/eva_icons_flutter.dart';
// import 'package:flutter/material.dart';
// import '../../UI Components/BottomBar.dart';
// import '../Core/App_theme.dart';
// import '../UI Components/AppBar.dart';
// import '../UI Components/BuildText.dart';
// import '../UI Components/CardDetails.dart';
// import '../UI Components/TitleCards.dart';
// import '../UI Components/aboutTabForTrainee.dart';
// import 'package:provider/provider.dart';
// import 'training_provider.dart';
//
// class TrainingDetailsCompany extends StatefulWidget {
//   const TrainingDetailsCompany({super.key});
//
//   @override
//   State<TrainingDetailsCompany> createState() => _TrainingDetailsCompanyState();
// }
//
// class _TrainingDetailsCompanyState extends State<TrainingDetailsCompany> {
//   List<String> tabs = ["بيانات التدريب", "المتدربين"];
//
//   int _currentTab = 0;
//
//   Widget screensTabs() {
//     switch (_currentTab) {
//       case 0:
//         return information("شهرين","20","يوجد",borderColor,primaryColor,secondaryColor,borderColor);
//       case 1:
//         return SizedBox(
//           height: 500,
//           child: ListView.builder(
//             scrollDirection: Axis.vertical,
//             itemCount: 10,
//             itemBuilder: (context, index) {
//               return Padding(
//                 padding: const EdgeInsets.only(bottom: 8.0),
//                 child: personCard(context, TraineeProfile(),
//                     "lib/images/portrait-smiling-woman.jpg","ســارة أحمد",null),
//               );
//             },
//           ),
//         );
//       default:
//         return Container();
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         resizeToAvoidBottomInset: false,
//         appBar: buildAppBar("التدريب","lib/images/logo.png",context,false),
//         backgroundColor: const Color(0xffEFEFEF),
//         body: SafeArea(
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 18.0),
//             child:
//                 Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//                   cardDetails(context,secondaryColor,primaryColor,"lib/images/acadimic.jpg",
//                       secondaryColor,null,"مهندس اتصالات" ),
//               const SizedBox(height: 30),
//               SizedBox(height: 70, width: double.infinity, child: _tabs()),
//               Flexible(
//                 child: SingleChildScrollView(
//                   child: Padding(
//                     padding: const EdgeInsets.only(left: 8.0),
//                     child: screensTabs(),
//                   ),
//                 ),
//               ),
//             ]),
//           ),
//         ),
//         bottomNavigationBar: const Padding(
//           padding: EdgeInsets.only(bottom: 20.0, left: 20, right: 20),
//           child: ClipRRect(
//             borderRadius: BorderRadius.all(Radius.circular(30)),
//             //child: BottomBar(),
//           ),
//         ),
//     );
//   }
//
//   Widget _tabs() {
//     return Positioned(
//       top: 0,
//       left: 0,
//       right: 0,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: tabs.map((tab) {
//           int index = tabs.indexOf(tab);
//           return GestureDetector(
//             onTap: () {
//               setState(() {
//                 _currentTab = index;
//               });
//             },
//             child: Column(
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.only(
//                     left: 10,
//                     top: 7,
//                   ),
//                   child: buildTextTitle(tab, 13, FontWeight.normal),
//                 ),
//                 AnimatedContainer(
//                   duration: const Duration(milliseconds: 300),
//                   margin: const EdgeInsets.only(top: 5),
//                   height: 2,
//                   width: 100,
//                   color: _currentTab == index
//                       ? const Color(0xFFF59039)
//                       : Colors.transparent,
//                 ),
//               ],
//             ),
//           );
//         }).toList(),
//       ),
//     );
//   }

import 'package:chanceapp/CompanyScreens/TraineeProfile.dart';
import 'package:chanceapp/UI%20Components/PersonCard.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../UI Components/BottomBar.dart';
import '../Core/App_theme.dart';
import '../UI Components/AppBar.dart';
import '../UI Components/BuildText.dart';
import '../UI Components/CardDetails.dart';
import '../UI Components/TitleCards.dart';
import '../UI Components/aboutTabForTrainee.dart';
import 'training_provider.dart';

class TrainingDetailsCompany extends StatefulWidget {
  const TrainingDetailsCompany({super.key});

  @override
  State<TrainingDetailsCompany> createState() => _TrainingDetailsCompanyState();
}

class _TrainingDetailsCompanyState extends State<TrainingDetailsCompany> {
  List<String> tabs = ["بيانات التدريب", "المتدربين"];
  int _currentTab = 0;

  Widget screensTabs() {
    switch (_currentTab) {
      case 0:
        return information("شهرين","20","يوجد",borderColor,primaryColor,secondaryColor,borderColor);
      case 1:
        return SizedBox(
          height: 500,
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: 10,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: personCard(
                  context,
                  TraineeProfile(),
                  "lib/images/portrait-smiling-woman.jpg",
                  "ســارة أحمد",
                  null,
                ),
              );
            },
          ),
        );
      default:
        return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    final training = Provider.of<TrainingProvider>(context).selectedTraining;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: buildAppBar("التدريب", "lib/images/logo.png", context, false),
      backgroundColor: const Color(0xffEFEFEF),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              cardDetails(
                context,
                secondaryColor,
                primaryColor,
                "lib/images/acadimic.jpg",
                secondaryColor,
                null,
                training?.title ?? "مهندس اتصالات", // عرض البيانات من training
              ),
              const SizedBox(height: 30),
              SizedBox(height: 70, width: double.infinity, child: _tabs()),
              Flexible(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: screensTabs(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const Padding(
        padding: EdgeInsets.only(bottom: 20.0, left: 20, right: 20),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(30)),
          //child: BottomBar(),
        ),
      ),
    );
  }

  Widget _tabs() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: tabs.map((tab) {
        int index = tabs.indexOf(tab);
        return GestureDetector(
          onTap: () {
            setState(() {
              _currentTab = index;
            });
          },
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 7),
                child: buildTextTitle(tab, 13, FontWeight.normal),
              ),
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                margin: const EdgeInsets.only(top: 5),
                height: 2,
                width: 100,
                color: _currentTab == index ? const Color(0xFFF59039) : Colors.transparent,
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}


  // Widget _buildRecommendationsSection() {
  //   return Column(
  //     children: [
  //       Container(
  //         height: 260,
  //         width: 344,
  //         decoration: BoxDecoration(
  //             color: const Color(0xFFF3F3F3),
  //             borderRadius: BorderRadius.circular(20),
  //             border: Border.all(color: const Color(0xFFBBBBBB))),
  //         padding: const EdgeInsets.all(8),
  //         child: Column(
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: [
  //             Padding(
  //               padding: const EdgeInsets.only(top: 18.0),
  //               child: Row(
  //                 mainAxisAlignment: MainAxisAlignment.spaceAround,
  //                 children: [
  //                   Column(
  //                     children: [
  //                       const Icon(
  //                         EvaIcons.clockOutline,
  //                         color: Color(0xFFF59039),
  //                         size: 25,
  //                       ),
  //                       Padding(
  //                         padding: const EdgeInsets.only(top: 8.0, bottom: 8),
  //                         child: buildText("المدة", 10,
  //                             FontWeight.normal, const Color(0xFFBBBBBB)),
  //                       ),
  //                       buildTextTitle("شهرين", 11, FontWeight.bold),
  //                     ],
  //                   ),
  //                   Column(
  //                     children: [
  //                       const Icon(
  //                         EvaIcons.peopleOutline,
  //                         color: Color(0xFFF59039),
  //                         size: 25,
  //                       ),
  //                       Padding(
  //                         padding: const EdgeInsets.only(top: 8.0, bottom: 8),
  //                         child: buildText("العدد المطلوب", 10,
  //                             FontWeight.normal, const Color(0xFFBBBBBB)),
  //                       ),
  //                       buildTextTitle("20", 10, FontWeight.bold),
  //                     ],
  //                   ),
  //                   Column(
  //                     children: [
  //                       const Icon(
  //                         Icons.monetization_on_outlined,
  //                         color: Color(0xFFF59039),
  //                         size: 25,
  //                       ),
  //                       Padding(
  //                         padding: const EdgeInsets.only(top: 8.0, bottom: 8),
  //                         child: buildText("الراتب", 10,
  //                             FontWeight.normal, const Color(0xFFBBBBBB)),
  //                       ),
  //                       buildTextTitle("يوجد", 10, FontWeight.bold),
  //                     ],
  //                   ),
  //                 ],
  //               ),
  //             ),
  //             Padding(
  //               padding: const EdgeInsets.only(top: 26.0, right: 18),
  //               child: buildTextTitle("الوصف", 14, FontWeight.bold),
  //             ),
  //           ],
  //         ),
  //       ),
  //       const SizedBox(
  //         height: 15,
  //       ),
  //       Align(
  //           alignment: Alignment.centerRight,
  //           child: Padding(
  //             padding: const EdgeInsets.only(right: 18.0),
  //             child: buildTextTitle("التعليقات", 18, FontWeight.bold),
  //           )),
  //       const SizedBox(
  //         height: 10,
  //       ),
  //       Row(
  //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //         children: [
  //           Container(
  //               height: 50,
  //               width: 340,
  //               decoration: BoxDecoration(
  //                   color: const Color(0xFFF3F3F3),
  //                   borderRadius: BorderRadius.circular(10),
  //                   border: Border.all(color: const Color(0xFFBBBBBB))),
  //               padding: const EdgeInsets.all(8),
  //               child: buildTextTitle(
  //                   "ابتهال سالم", 14, FontWeight.normal)),
  //         ],
  //       ),
  //     ],
  //   );
  // }

