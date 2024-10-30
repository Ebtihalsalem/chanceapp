import 'dart:convert';

import 'package:chanceapp/CompanyScreens/AddTraining.dart';
import 'package:chanceapp/CompanyScreens/TraineeProfile.dart';
import 'package:chanceapp/Core/App_theme.dart';
import 'package:chanceapp/Screens/Auth.dart';
import 'package:chanceapp/UI%20Components/BCards.dart';
import 'package:chanceapp/UI%20Components/PersonCard.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../UI Components/BottomBar.dart';
import '../UI Components/AppBar.dart';
import '../UI Components/BuildText.dart';
import '../UI Components/Cards.dart';
import '../UI Components/SearchBar.dart';
import 'UserInformation.dart';

class CHomeScreen extends StatefulWidget {
  const CHomeScreen({super.key});

  @override
  State<CHomeScreen> createState() => _CHomeScreenState();
}

class _CHomeScreenState extends State<CHomeScreen> {


  late Future<List<User>> usersFuture;
  late Future<List<UserInformation>> usersInfoFuture;

  get whiteApp => null;

  get fontColorBlack => null;

  @override
  void initState() {
    super.initState();
    usersFuture = fetchAllUsers();
    usersInfoFuture = fetchAllUsersforinfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: buildAppBar("الرئيسية", "lib/images/logo.png", context, true),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildSearchRow(),
              // ),
              const SizedBox(height: 26),
              buildTextTitle('لأجلك', 20, FontWeight.bold),
              const SizedBox(height: 22),
              // SizedBox(
              //   height: 200,
              //   child: ListView.builder(
              //     scrollDirection: Axis.horizontal,
              //     itemCount: 5,
              //     itemBuilder: (context, index) {
              //       return Padding(
              //         padding: const EdgeInsets.only(left: 8.0),
              //         child:
              //         BuildCard(targetScreen: TraineeProfile(),
              //             profileScreen: TraineeProfile(),
              //             backColor: whiteApp,
              //             fontColor: fontColorBlack,
              //             img: "lib/images/portrait-smiling-woman.jpg",
              //             boxes: secondaryColor,
              //             skillsList: personalSkillsList,
              //             role: "مهتمة بمجال شركتك",
              //             location: "مصراتة",
              //             company: "سارة أحمد ",
              //             isCompleted: false),
              //       );
              //     },
              //   ),
              // ),
              FutureBuilder<List<UserInformation>>(
                future: usersInfoFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text("Error: ${snapshot.error}");
                  } else if (!snapshot.hasData || snapshot.data == null) {
                    return Text("No data found");
                  }

                  final List<UserInformation> userInformationList =
                  snapshot.data!;
                  return Expanded(
                    child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: userInformationList.length,
                        itemBuilder: (context, index) {
                          return BuildCard(
                            targetScreen: TraineeProfile(),
                            profileScreen: TraineeProfile(),
                            backColor: whiteApp,
                            fontColor: fontColorBlack,
                            img: userInformationList[index].urlPhoto,
                            boxes: secondaryColor,
                            skillsList: userInformationList[index].personalSkills??[],
                            role: "مهتمة بمجال شركتك",
                            location: userInformationList[index].city??"",
                            company: userInformationList[index].name,
                            isCompleted: false,
                          );
                        }),
                  );
                },
              ),

              const SizedBox(height: 26),
              buildTextTitle('المتدربين لديك', 20, FontWeight.bold),
              const SizedBox(height: 22),
              FutureBuilder<List<User>>(
                future: usersFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(
                        child: Text('Failed to load users: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(child: Text('No users found.'));
                  } else {
                    List<User> users = snapshot.data!;
                    return Expanded(
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: users.length,
                        itemBuilder: (context, index) {
                          User user = users[index];
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: personCard(
                              context,
                              TraineeProfile(),
                              "lib/images/portrait-smiling-woman.jpg",
                              user.name,
                              "من تدريب ",
                            ),
                          );
                        },
                      ),
                    );
                  }
                },
              ),
              //         const SizedBox(height: 26),
              //         buildTextTitle('المتدربين لديك', 20, FontWeight.bold),
              //         const SizedBox(height: 22),
              //         SizedBox(
              //           height: 210,
              //           child: ListView.builder(
              //             scrollDirection: Axis.vertical,
              //             itemCount: 10,
              //             itemBuilder: (context, index) {
              //               return Padding(
              //                 padding: const EdgeInsets.only(bottom: 8.0),
              //                 child: personCard(context, const TraineeProfile(),
              //                     "lib/images/portrait-smiling-woman.jpg",
              //                     "سارة أحمد ", "من تدريب التصميم الجرافكي"),
              //               );
              //             },
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const Padding(
        padding: EdgeInsets.only(bottom: 20.0, left: 20, right: 20),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(30)),
          child: BottomBar(),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 18, bottom: 10),
        child: FloatingActionButton(
            backgroundColor: primaryColor,
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return const AddTraining();
                },
              );
            },
            child: const Icon(
              EvaIcons.edit2,
              color: Color(0xFFF1F1F1),
            )),
      ),
    );
  }

//   Future<List<String>> fetchPersonalSkills(String email) async {
//     final response = await http.get(Uri.parse('http://192.168.1.8:8085/users/personal_skills/$email'));
//
//     if (response.statusCode == 200) {
//       List<dynamic> skills = json.decode(response.body);
//       return skills.cast<String>(); // تحويل الـ JSON إلى List<String>
//     } else {
//       throw Exception('Failed to load personal skills');
//     }
//   }
//
// }

  Future<List<User>> fetchAllUsers() async {
    final response =
    await http.get(Uri.parse('http://192.168.1.5:8085/users'));

    if (response.statusCode == 200) {
      List<dynamic> usersJson = json.decode(response.body);
      return usersJson.map((json) => User.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load users: ${response.body}');
    }
  }

  Future<List<UserInformation>> fetchAllUsersforinfo() async {
    final url = Uri.parse(
        'http://192.168.1.5:8085/users');

    try {

      final response = await http.get(url);

      if (response.statusCode == 200) {

        final List<dynamic> data = jsonDecode(response.body);


        return data
            .map((userJson) => UserInformation.fromJson(userJson))
            .toList();
      } else {
        // التعامل مع حالات الخطأ
        print('Failed to load users info: ${response.statusCode}');
        return [];
      }
    } catch (e) {
      // التعامل مع الأخطاء
      print('Error fetching users info: $e');
      return [];
    }
  }
}

class UserInformation {
  final String name;
  final String city;
  final String urlPhoto;
  final List<String>? personalSkills;

  UserInformation({
    required this.name,
    required this.city,
    required this.urlPhoto,
    this.personalSkills,
  });

  factory UserInformation.fromJson(Map<String, dynamic> json) {
    return UserInformation(
      name: json['name'] as String,
      city: json['city'] as String,
      urlPhoto: json['urlPhoto'] as String,
      personalSkills: (json['personalSkills'] as List<dynamic>?)
          ?.map((skill) => skill as String)
          .toList(),
    );
  }
}
class User {
  final String id;
  final String name;
  // يمكنك إضافة المزيد من الخصائص حسب الحاجة

  User({required this.id, required this.name});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as String,
      name: json['name'] as String,
      // تأكد من إضافة أي خصائص أخرى حسب الحاجة
    );
  }
}
