// import 'package:chanceapp/CompanyScreens/TraineeProfile.dart';
// import 'package:eva_icons_flutter/eva_icons_flutter.dart';
// import 'package:flutter/material.dart';
// import '../../UI Components/BottomBar.dart';
// import '../Core/App_theme.dart';
// import '../TraineeScreens/TrainingApplied.dart';
// import '../TraineeScreens/TrianingDetils.dart';
// import '../UI Components/AppBar.dart';
// import '../UI Components/BuildText.dart';
// import '../UI Components/Cards.dart';
// import '../UI Components/SearchBar.dart';
// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:chanceapp/TraineeScreens/training.dart'; // تأكد من استيراد نموذج Training
// import 'package:provider/provider.dart';
// import 'training_provider.dart';
// Future<List<Training>> fetchTrainings(String companyEmail) async {
//   final response = await http.get(Uri.parse('http://10.60.5.186:8085/api/companies/$companyEmail'));
//
//   if (response.statusCode == 200) {
//     List<dynamic> jsonResponse = json.decode(response.body);
//     return jsonResponse.map((data) => Training.fromJson(data)).toList();
//   } else {
//     throw Exception('Failed to load trainings');
//   }
// }
// class TrainingScreen extends StatefulWidget {
//   const TrainingScreen({super.key});
//
//   @override
//   State<TrainingScreen> createState() => _TrainingScreenState();
// }
//
// class _TrainingScreenState extends State<TrainingScreen> {
//   List<String> tabs = ["يتم تقديمها", "تم الانتهاء منها"];
//   int _currentTab = 0;
//   late Future<List<Training>> futureTrainings;
//
//   @override
//   void initState() {
//     super.initState();
//     futureTrainings = fetchTrainings(
//         "example@company.com"); // استبدل بـ البريد الإلكتروني الفعلي
//   }
//
//     Widget screensTabs() {
//       switch (_currentTab) {
//         case 0:
//           return buildCard(
//               context,
//               const TrianingDetils(),
//               const TraineeProfile(),
//               secondaryColor,
//               primaryColor,
//               "lib/images/acadimic.jpg",
//               secondaryColor,
//               primaryColor,
//               skills,
//               "مهندس اتصالات",
//               "مصراتة",
//               "الاكاديمية الليبية ",
//               false);
//         case 1:
//           return buildCard(
//               context,
//               const TrianingDetils(),
//               const TraineeProfile(),
//               secondaryColor,
//               primaryColor,
//               "lib/images/acadimic.jpg",
//               secondaryColor,
//               primaryColor,
//               skills,
//               "مهندس اتصالات",
//               "مصراتة",
//               "الاكاديمية الليبية ",
//               true);
//         default:
//           return Container();
//       }
//     }
//
//     @override
//     Widget build(BuildContext context) {
//       return Scaffold(
//         resizeToAvoidBottomInset: false,
//         appBar: buildAppBar("التدريبات", "lib/images/logo.png", context, false),
//         backgroundColor: const Color(0xffEFEFEF),
//         body: SafeArea(
//           child: Padding(
//             padding: const EdgeInsets.symmetric(
//                 horizontal: 18.0, vertical: 40.0),
//             child: FutureBuilder<List<Training>>(
//               future: futureTrainings,
//               builder: (context, snapshot) {
//                 if (snapshot.connectionState == ConnectionState.waiting) {
//                   return Center(child: CircularProgressIndicator());
//                 } else if (snapshot.hasError) {
//                   return Center(child: Text('خطأ: ${snapshot.error}'));
//                 } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//                   return Center(child: Text('لا توجد تدريبات متاحة.'));
//                 }
//
//                 // إذا كانت البيانات متاحة، قم بعرضها
//                 return Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     buildSearchRow(),
//                     const SizedBox(height: 20),
//                     SizedBox(
//                       height: 70,
//                       width: double.infinity,
//                       child: Stack(
//                         children: [
//                           _tabs(),
//                         ],
//                       ),
//                     ),
//                     Flexible(
//                       child: SingleChildScrollView(
//                         child: Padding(
//                           padding: const EdgeInsets.only(left: 8.0),
//                           child: screensTabs(),
//                         ),
//                       ),
//                     ),
//                   ],
//                 );
//               },
//             ),
//           ),
//         ),
//         bottomNavigationBar: const Padding(
//           padding: EdgeInsets.only(bottom: 20.0, left: 20, right: 20),
//           child: ClipRRect(
//             borderRadius: BorderRadius.all(Radius.circular(30)),
//             //child: BottomBar(),
//           ),
//         ),
//       );
//     }
//
//     Widget _tabs() {
//       return Row(
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
//                   color: _currentTab == index ? const Color(0xFFF59039) : Colors
//                       .transparent,
//                 ),
//               ],
//             ),
//           );
//         }).toList(),
//       );
//     }
//   }
//
import 'package:chanceapp/CompanyScreens/TraineeProfile.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import '../../UI Components/BottomBar.dart';
import '../Core/App_theme.dart';
import '../TraineeScreens/TrainingApplied.dart';
import '../TraineeScreens/TrianingDetils.dart';
import '../UI Components/AppBar.dart';
import '../UI Components/BuildText.dart';
import '../UI Components/Cards.dart';
import '../UI Components/SearchBar.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:chanceapp/TraineeScreens/training.dart';
import 'package:provider/provider.dart';
import 'TrainingDetails.dart';
import 'training_provider.dart';

Future<List<Training>> fetchTrainings(String companyEmail) async {
  final response = await http.get(Uri.parse('http://10.60.5.186:8085/api/companies/$companyEmail'));

  if (response.statusCode == 200) {
    List<dynamic> jsonResponse = json.decode(response.body);
    return jsonResponse.map((data) => Training.fromJson(data)).toList();
  } else {
    throw Exception('Failed to load trainings');
  }
}

class TrainingScreen extends StatefulWidget {
  const TrainingScreen({super.key});

  @override
  State<TrainingScreen> createState() => _TrainingScreenState();
}

class _TrainingScreenState extends State<TrainingScreen> {
  List<String> tabs = ["يتم تقديمها", "تم الانتهاء منها"];
  int _currentTab = 0;
  late Future<List<Training>> futureTrainings;

  @override
  void initState() {
    super.initState();
    futureTrainings = fetchTrainings("example@company.com");
  }

  Widget screensTabs(List<Training> trainings) {
    return _currentTab == 0
        ? GestureDetector(
      onTap: () {
        Provider.of<TrainingProvider>(context, listen: false)
            .selectTraining(trainings[0]); // تمرير بيانات التدريب
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TrainingDetailsCompany(),
          ),
        );
      },
      child: buildCard(
          context,
          const TrianingDetils(),
          const TraineeProfile(),
          secondaryColor,
          primaryColor,
          "lib/images/acadimic.jpg",
          secondaryColor,
          primaryColor,
          skills,
          "مهندس اتصالات",
          "مصراتة",
          "الاكاديمية الليبية ",
          false),
    )
        : Container(); // يمكنك إضافة العناصر للحالة الثانية هنا.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: buildAppBar("التدريبات", "lib/images/logo.png", context, false),
      backgroundColor: const Color(0xffEFEFEF),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 40.0),
          child: FutureBuilder<List<Training>>(
            future: futureTrainings,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('خطأ: ${snapshot.error}'));
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return Center(child: Text('لا توجد تدريبات متاحة.'));
              }

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildSearchRow(),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 70,
                    width: double.infinity,
                    child: Stack(
                      children: [
                        _tabs(),
                      ],
                    ),
                  ),
                  Flexible(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: screensTabs(snapshot.data!),
                      ),
                    ),
                  ),
                ],
              );
            },
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
