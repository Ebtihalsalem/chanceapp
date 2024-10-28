import 'package:flutter/material.dart';
import '../../UI Components/BottomBar.dart';
import '../Core/App_theme.dart';
import '../UI Components/AppBar.dart';
import '../UI Components/BuildText.dart';
import '../UI Components/SearchBar.dart';
import 'TrainingApplied.dart';
import 'TrainingComplated.dart';

class MyTraining extends StatefulWidget {
  const MyTraining({super.key});

  @override
  State<MyTraining> createState() => _MyTrainingState();
}

class _MyTrainingState extends State<MyTraining> {



  bool isActive = true;
  List<String> tabs = ["تم التقدم لها", "تم الانتهاء منها"];

  int _currentTab = 0;
  Widget screensTabs()
  {
    switch(_currentTab){
      case 0:
        return trainingsApplied();
      case 1:
        return trainingCompleted();
      default:
        return Container();
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: buildAppBar("التدريبات","lib/images/logo.png",context,false),
        backgroundColor: primaryColor,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 18.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  buildSearchRow(),

              const SizedBox(height: 22),
                      SizedBox(
                          height: 70,
                          width: double.infinity,
                          child: _tabs()),
                      Flexible(
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: screensTabs(),
                          ),
                        ),
                      ),

            ]),
          ),
        ),
        bottomNavigationBar: const Padding(
          padding: EdgeInsets.only(bottom: 20.0, left: 20, right: 20),
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            child: BottomBar(),
          ),
        ),
    );
  }


  Widget _tabs() {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Row(
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
                  padding: const EdgeInsets.only(
                    left: 10,
                    top: 7,
                  ),
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
      ),
    );
  }
}


// import 'dart:convert';
//
// import 'package:chanceapp/CompanyScreens/AddTraining.dart';
// import 'package:chanceapp/CompanyScreens/TraineeProfile.dart';
// import 'package:chanceapp/Core/App_theme.dart';
// import 'package:chanceapp/UI%20Components/BCards.dart';
// import 'package:chanceapp/UI%20Components/PersonCard.dart';
// import 'package:eva_icons_flutter/eva_icons_flutter.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import '../../UI Components/BottomBar.dart';
// import '../UI Components/AppBar.dart';
// import '../UI Components/BuildText.dart';
// import '../UI Components/Cards.dart';
// import '../UI Components/SearchBar.dart';
// import 'HomeScreenForCompany/Data/User.dart';
// import 'HomeScreenForCompany/Data/UserInformation.dart';
//
// class CHomeScreen extends StatefulWidget {
//   const CHomeScreen({super.key});
//
//   @override
//   State<CHomeScreen> createState() => _CHomeScreenState();
// }
//
// class _CHomeScreenState extends State<CHomeScreen> {
//   List<String> personalSkillsList = [
//     "حس المسؤولية",
//     "التواصل مع الأخرين",
//     "العمل مع فريق",
//     "قدرات إبداعية",
//   ];
//
//   late Future<List<User>> usersFuture;
//   late Future<List<UserInformation>> usersInfoFuture;
//
//   @override
//   void initState() {
//     super.initState();
//     usersFuture = fetchAllUsers();
//     usersInfoFuture = fetchAllUsersforinfo();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       appBar: buildAppBar("الرئيسية", "lib/images/logo.png", context, true),
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 18.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               buildSearchRow(),
//               // ),
//               const SizedBox(height: 26),
//               buildTextTitle('لأجلك', 20, FontWeight.bold),
//               const SizedBox(height: 22),
//               // SizedBox(
//               //   height: 200,
//               //   child: ListView.builder(
//               //     scrollDirection: Axis.horizontal,
//               //     itemCount: 5,
//               //     itemBuilder: (context, index) {
//               //       return Padding(
//               //         padding: const EdgeInsets.only(left: 8.0),
//               //         child:
//               //         BuildCard(targetScreen: TraineeProfile(),
//               //             profileScreen: TraineeProfile(),
//               //             backColor: whiteApp,
//               //             fontColor: fontColorBlack,
//               //             img: "lib/images/portrait-smiling-woman.jpg",
//               //             boxes: secondaryColor,
//               //             skillsList: personalSkillsList,
//               //             role: "مهتمة بمجال شركتك",
//               //             location: "مصراتة",
//               //             company: "سارة أحمد ",
//               //             isCompleted: false),
//               //       );
//               //     },
//               //   ),
//               // ),
//               FutureBuilder<List<UserInformation>>(
//                 future: usersInfoFuture, // استبدل بالبريد الإلكتروني الفعلي
//                 builder: (context, snapshot) {
//                   if (snapshot.connectionState == ConnectionState.waiting) {
//                     return const CircularProgressIndicator();
//                   } else if (snapshot.hasError) {
//                     return Text("Error: ${snapshot.error}");
//                   } else if (!snapshot.hasData || snapshot.data == null) {
//                     return Text("No data found");
//                   }
//
//                   final List<UserInformation> userInformationList =
//                   snapshot.data!;
//                   return Expanded(
//                     child: ListView.builder(
//                         scrollDirection: Axis.vertical,
//                         itemCount: userInformationList.length,
//                         itemBuilder: (context, index) {
//                           return BuildCard(
//                             targetScreen: TraineeProfile(),
//                             profileScreen: TraineeProfile(),
//                             backColor: whiteApp,
//                             fontColor: fontColorBlack,
//                             img: "lib/images/portrait-smiling-woman.jpg",
//                             boxes: secondaryColor,
//                             skillsList: userInformationList[index].personalSkills??[],
//                             role: "مهتمة بمجال شركتك",
//                             location: userInformationList[index].city??"",
//                             company: userInformationList[index].name,
//                             isCompleted: false,
//                           );
//                         }),
//                   );
//                 },
//               ),
//
//               const SizedBox(height: 26),
//               buildTextTitle('المتدربين لديك', 20, FontWeight.bold),
//               const SizedBox(height: 22),
//               FutureBuilder<List<User>>(
//                 future: usersFuture,
//                 builder: (context, snapshot) {
//                   if (snapshot.connectionState == ConnectionState.waiting) {
//                     return const Center(child: CircularProgressIndicator());
//                   } else if (snapshot.hasError) {
//                     return Center(
//                         child: Text('Failed to load users: ${snapshot.error}'));
//                   } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//                     return const Center(child: Text('No users found.'));
//                   } else {
//                     List<User> users = snapshot.data!;
//                     return Expanded(
//                       child: ListView.builder(
//                         scrollDirection: Axis.vertical,
//                         itemCount: users.length,
//                         itemBuilder: (context, index) {
//                           User user = users[index];
//                           return Padding(
//                             padding: const EdgeInsets.only(bottom: 8.0),
//                             child: personCard(
//                               context,
//                               TraineeProfile(),
//                               "lib/images/portrait-smiling-woman.jpg",
//                               user.name,
//                               "من تدريب ",
//                             ),
//                           );
//                         },
//                       ),
//                     );
//                   }
//                 },
//               ),
//               //         const SizedBox(height: 26),
//               //         buildTextTitle('المتدربين لديك', 20, FontWeight.bold),
//               //         const SizedBox(height: 22),
//               //         SizedBox(
//               //           height: 210,
//               //           child: ListView.builder(
//               //             scrollDirection: Axis.vertical,
//               //             itemCount: 10,
//               //             itemBuilder: (context, index) {
//               //               return Padding(
//               //                 padding: const EdgeInsets.only(bottom: 8.0),
//               //                 child: personCard(context, const TraineeProfile(),
//               //                     "lib/images/portrait-smiling-woman.jpg",
//               //                     "سارة أحمد ", "من تدريب التصميم الجرافكي"),
//               //               );
//               //             },
//               //           ),
//               //         ),
//               //       ],
//               //     ),
//               //   ),
//               // ),
//             ],
//           ),
//         ),
//       ),
//       bottomNavigationBar: const Padding(
//         padding: EdgeInsets.only(bottom: 20.0, left: 20, right: 20),
//         child: ClipRRect(
//           borderRadius: BorderRadius.all(Radius.circular(30)),
//           child: BottomBar(),
//         ),
//       ),
//       floatingActionButton: Padding(
//         padding: const EdgeInsets.only(left: 18, bottom: 10),
//         child: FloatingActionButton(
//             backgroundColor: primaryColor,
//             onPressed: () {
//               showDialog(
//                 context: context,
//                 builder: (context) {
//                   return const AddTraining();
//                 },
//               );
//             },
//             child: const Icon(
//               EvaIcons.edit2,
//               color: Color(0xFFF1F1F1),
//             )),
//       ),
//     );
//   }
//
// //   Future<List<String>> fetchPersonalSkills(String email) async {
// //     final response = await http.get(Uri.parse('http://192.168.1.8:8085/users/personal_skills/$email'));
// //
// //     if (response.statusCode == 200) {
// //       List<dynamic> skills = json.decode(response.body);
// //       return skills.cast<String>(); // تحويل الـ JSON إلى List<String>
// //     } else {
// //       throw Exception('Failed to load personal skills');
// //     }
// //   }
// //
// // }
//
//   Future<List<User>> fetchAllUsers() async {
//     final response =
//     await http.get(Uri.parse('http://192.168.1.5:8085/users'));
//
//     if (response.statusCode == 200) {
//       List<dynamic> usersJson = json.decode(response.body);
//       return usersJson.map((json) => User.fromJson(json)).toList();
//     } else {
//       throw Exception('Failed to load users: ${response.body}');
//     }
//   }
//
//   Future<List<UserInformation>> fetchAllUsersforinfo() async {
//     final url = Uri.parse(
//         'http://192.168.1.5:8085/users');
//
//     try {
//       // إرسال الطلب (GET request)
//       final response = await http.get(url);
//
//       if (response.statusCode == 200) {
//         // تحليل البيانات من JSON إلى List
//         final List<dynamic> data = jsonDecode(response.body);
//
//         // تحويل كل عنصر من JSON إلى كائن UserInformation
//         return data
//             .map((userJson) => UserInformation.fromJson(userJson))
//             .toList();
//       } else {
//         // التعامل مع حالات الخطأ
//         print('Failed to load users info: ${response.statusCode}');
//         return [];
//       }
//     } catch (e) {
//       // التعامل مع الأخطاء
//       print('Error fetching users info: $e');
//       return [];
//     }
//   }
// }


//
// import 'package:chanceapp/CompanyScreens/MyAccountForCompany/Data/Trainings.dart';
// import 'package:chanceapp/Core/App_theme.dart';
// import 'package:eva_icons_flutter/eva_icons_flutter.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// import 'BuildText.dart';
//
// Widget cardDetails(BuildContext context,String img,
//     String? role,String company) {
//   return Container(
//       height: 70,
//       width: 370,
//       decoration: BoxDecoration(
//         color: whiteApp,
//         borderRadius: BorderRadius.only(topLeft: Radius.circular(20),
//             topRight:Radius.circular(20)),
//       ),
//       padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
//       child: Column(
//           children: [
//             Row(
//               children: [
//                 Container(
//                   width: 50,
//                   height: 50,
//                   decoration: BoxDecoration(
//                     image: DecorationImage(
//                       image: AssetImage(img),
//                     ),
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                 ),
//
//                 Expanded(
//                   child: Padding(
//                     padding: const EdgeInsets.only(right: 10.0),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         buildText(
//                             company,
//                             12,
//                             FontWeight.bold,
//                             fontColorBlack),
//
//                         role != null?
//                         buildText(role, 12, FontWeight.normal,
//                             fontColorBlack):SizedBox(width: 1,),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ]
//       )
//   );
// }
//
// Widget information(Training training) {
//   return Wrap(
//       children: [
//         Container(
//           width: 367,
//           decoration: BoxDecoration(
//             color: whiteApp,
//             borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(20),
//                 bottomRight:Radius.circular(20)),),
//           padding: const EdgeInsets.all(8),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [
//                     Column(
//                       children: [
//                         Icon(EvaIcons.clockOutline,color: primaryColor,size: 25,),
//                         Padding(
//                           padding: const EdgeInsets.only(top:8.0,bottom: 8),
//                           child: buildText("المدة", 10, FontWeight.normal,fontColorBlack),
//                         ),
//                         buildTextTitle(training.startDate, 12, FontWeight.bold),
//                       ],
//                     ),
//                     Column(
//                       children: [
//                         Icon(EvaIcons.peopleOutline,color: primaryColor,size: 25,),
//                         Padding(
//                           padding: const EdgeInsets.only(top:8.0,bottom: 8),
//                           child: buildText("العدد المطلوب", 10, FontWeight.normal,fontColorBlack),
//                         ),
//                         buildTextTitle("$training.numberOfPositions", 12, FontWeight.bold),
//                       ],
//                     ),
//                     // Column(
//                     //   children: [
//                     //     Icon(Icons.monetization_on_outlined,color: primaryColor,size: 25,),
//                     //     Padding(
//                     //       padding: const EdgeInsets.only(top:8.0,bottom: 8),
//                     //       child: buildText("الراتب", 10, FontWeight.normal,fontColorBlack),
//                     //     ),
//                     //     buildTextTitle(tr, 12, FontWeight.bold),
//                     //   ],
//                     // ),
//                   ],
//                 ),
//               ),
//               Column(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.only(top:26.0,right: 18),
//                     child: buildTextTitle("الوصف", 16, FontWeight.bold),
//                   ),
//                   buildTextTitle(training.description, 13, FontWeight.normal),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ]
//   );
// }