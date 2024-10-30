import 'dart:convert';
import 'package:chanceapp/CompanyScreens/AddTraining.dart';
import 'package:chanceapp/CompanyScreens/TraineeProfile.dart';
import 'package:chanceapp/Core/App_theme.dart';
import 'package:chanceapp/UI%20Components/PersonCard.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../UI Components/BottomBar.dart';
import '../UI Components/AppBar.dart';
import '../UI Components/BuildText.dart';
import '../UI Components/Cards.dart';
import '../UI Components/SearchBar.dart';
import 'HomeScreenForCompany/Data/User.dart';
import 'HomeScreenForCompany/Data/UserInformation.dart';

class CHomeScreen extends StatefulWidget {
  const CHomeScreen({super.key});

  @override
  State<CHomeScreen> createState() => _CHomeScreenState();
}

class _CHomeScreenState extends State<CHomeScreen> {


  late Future<List<User>> usersFuture;
  late Future<List<UserInformation>> usersInfoFuture;

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
      appBar: buildAppBar("الرئيسية", "lib/images/Asset 6.png", context, true),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildSearchRow(),
              const SizedBox(height: 26),
              buildTextTitle('لأجلك', 20, FontWeight.bold),
              const SizedBox(height: 22),
              FutureBuilder<List<UserInformation>>(
                future: usersInfoFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 8.0),
                            child: Icon(EvaIcons.alertTriangle,color: Colors.red,),
                          ),
                          buildTextTitle("عذرا هناك خطأ، حاول لاحقا!", 12, FontWeight.bold),
                        ]
                    );
                  } else if (!snapshot.hasData || snapshot.data == null) {
                    return Center(child: Image.asset("lib/images/box (1).png",height: 40,width: 40,));
                  }

                  final List<UserInformation> userInformationList =
                      snapshot.data!;
                  return Expanded(
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: userInformationList.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(left: 18.0),
                            child: BuildCard(
                              targetScreen: TraineeProfile(email:userInformationList[index].email),
                              profileScreen: TraineeProfile(email:userInformationList[index].email),
                              backColor: whiteApp,
                              fontColor: fontColorBlack,
                              img: userInformationList[index].urlPhoto??"lib/images/default-image.png",
                              boxes: secondaryColor,
                              skillsList: userInformationList[index].personalSkills??[],
                              role: "مهتمة بمجال شركتك",
                              location: userInformationList[index].city??"",
                              company: userInformationList[index].name,
                              isCompleted: false,
                            ),
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
                    return Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 8.0),
                            child: Icon(EvaIcons.alertTriangle,color: Colors.red,),
                          ),
                         buildTextTitle("عذرا هناك خطأ، حاول لاحقا!", 12, FontWeight.bold),
                        ]
                    );
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Center(child: Image.asset("lib/images/box (1).png",height: 40,width: 40,));
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
                              TraineeProfile(email:user.email),
                              user.userInformation?.urlPhoto??"lib/images/default-image.png",
                              // "lib/images/portrait-smiling-woman.jpg",
                              user?.name??"marwa",
                              "",
                            ),
                          );
                        },
                      ),
                    );
                  }
                },
              ),
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

  Future<List<User>> fetchAllUsers() async {
    final response =
        await http.get(Uri.parse('http://192.168.88.42:8085/users'));

    if (response.statusCode == 200) {
      List<dynamic> usersJson = json.decode(response.body);
      return usersJson.map((json) => User.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load users: ${response.body}');
    }
  }

  Future<List<UserInformation>> fetchAllUsersforinfo() async {
    final url = Uri.parse(
        'http://192.168.88.42:8085/users');
    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {

        final List<dynamic> data = jsonDecode(response.body);
        return data
            .map((userJson) => UserInformation.fromJson(userJson))
            .toList();
      } else {
        print('Failed to load users info: ${response.statusCode}');
        return [];
      }
    } catch (e) {
      print('Error fetching users info: $e');
      return [];
    }
  }
}
