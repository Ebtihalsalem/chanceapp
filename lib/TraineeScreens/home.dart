// import 'package:chanceapp/CompanyScreens/TrainingDetails.dart';
// import 'package:chanceapp/Core/App_theme.dart';
// import 'package:chanceapp/TraineeScreens/CompanyScreen.dart';
// import 'package:chanceapp/TraineeScreens/NotifationScreen.dart';
// import 'package:flutter/material.dart';
// import 'package:eva_icons_flutter/eva_icons_flutter.dart';
// import '../../UI Components/BottomBar.dart';
// import '../CompanyScreens/jsontraining.dart';
// import '../UI Components/AppBar.dart';
// import '../UI Components/BuildText.dart';
// import '../UI Components/Cards.dart';
// import '../UI Components/SearchBar.dart';
// import 'MessageScreen.dart';
// import 'TrianingDetils.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
//
// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});
//
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//   List<Training> recommendations = [];
//   List<Training> forYou = [];
//   String companyEmail = "example@company111111.com"; // Replace with the actual email
//
//   @override
//   void initState() {
//     super.initState();
//     fetchTrainings();
//   }
//
//   Future<void> fetchTrainings() async {
//     try {
//       // Fetch recommendations
//       final responseRecommendations = await http.get(Uri.parse('http://10.60.5.186:8085/api/trainings/company/$companyEmail'));
//       if (responseRecommendations.statusCode == 200) {
//         final List<dynamic> data = json.decode(responseRecommendations.body);
//         recommendations = data.map((item) => Training.fromJson(item)).toList();
//       } else {
//         throw Exception('Failed to load recommendations');
//       }
//
//       // Fetch "For You" trainings (assuming it's similar to recommendations)
//       final responseForYou = await http.get(Uri.parse('http://10.60.5.186:8085/api/trainings/company/$companyEmail'));
//       if (responseForYou.statusCode == 200) {
//         final List<dynamic> data = json.decode(responseForYou.body);
//         forYou = data.map((item) => Training.fromJson(item)).toList();
//       } else {
//         throw Exception('Failed to load for you trainings');
//       }
//
//       setState(() {}); // Refresh the UI
//     } catch (e) {
//       print(e); // Handle the error (e.g., show a message)
//     }
//   }
//
//   List<String> skills = ["شبكات واتصالات", "علوم الحاسوب"];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       appBar: buildAppBar("مرحبًا، ســأرة أحمد!", "lib/images/logo.png", context, true),
//       backgroundColor: const Color(0xffEFEFEF),
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 40.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               buildSearchRow(),
//               const SizedBox(height: 26),
//               buildTextTitle('لأجلك', 20, FontWeight.bold),
//               SizedBox(
//                 height: 200,
//                 child: ListView.builder(
//                   scrollDirection: Axis.horizontal,
//                   itemCount: forYou.length,
//                   itemBuilder: (context, index) {
//                     final training = forYou[index];
//                     return Padding(
//                       padding: const EdgeInsets.only(left: 8.0),
//                       child: buildCard(
//                         context,
//                         TrianingDetils(training: training), // Pass the Training object here
//                         const CompanyScreen(),
//                         secondaryColor,
//                         primaryColor,
//                         "lib/images/acadimic.jpg",
//                         secondaryColor,
//                         primaryColor,
//                         skills,
//                         training.trainingPosition ?? "",
//                         training.city ?? "",
//                         training.title ?? "",
//                         false,
//                       ),
//                     );
//                   },
//                 ),
//               ),
//               const SizedBox(height: 26),
//               buildTextTitle('توصيات', 20, FontWeight.bold),
//               const SizedBox(height: 22),
//               SizedBox(
//                 height: 200,
//                 child: ListView.builder(
//                   scrollDirection: Axis.horizontal,
//                   itemCount: recommendations.length, // Use the actual length of recommendations
//                   itemBuilder: (context, index) {
//                     final training = recommendations[index]; // Get the training from recommendations
//                     return Padding(
//                       padding: const EdgeInsets.only(left: 8.0),
//                       child: buildCard(
//                         context,
//                         TrianingDetils(training: training), // Pass the Training object here
//                         const CompanyScreen(),
//                         primaryColor,
//                         secondaryColor,
//                         "lib/images/almadar.png",
//                         borderColor,
//                         secondaryColor,
//                         skills,
//                         training.trainingPosition ?? "مهندس شبكات", // Default value
//                         training.city ?? "مصراتة", // Default value
//                         training.title ?? "المــدار ", // Default value
//                         false,
//                       ),
//                     );
//                   },
//                 ),
//               ),
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
//     );
//   }
// }




import 'package:chanceapp/CompanyScreens/TrainingDetails.dart';
import 'package:chanceapp/Core/App_theme.dart';
import 'package:chanceapp/TraineeScreens/CompanyScreen.dart';
import 'package:chanceapp/TraineeScreens/NotifationScreen.dart';
import 'package:flutter/material.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import '../../UI Components/BottomBar.dart';
import '../CompanyScreens/jsontraining.dart';
import '../UI Components/AppBar.dart';
import '../UI Components/BuildText.dart';
import '../UI Components/Cards.dart';
import '../UI Components/SearchBar.dart';
import 'MessageScreen.dart';
import 'TrianingDetils.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Training> recommendations = [];
  List<Training> forYou = [];
  String companyEmail = "example@company111111.com"; // Replace with the actual email

  @override
  void initState() {
    super.initState();
    fetchTrainings();
  }

  Future<void> fetchTrainings() async {
    try {
      // Fetch recommendations
      final responseRecommendations = await http.get(
        Uri.parse('http://192.168.88.247:8085/api/trainings/company/$companyEmail'),
        headers: {"Content-Type": "application/json; charset=UTF-8"},
      );
      if (responseRecommendations.statusCode == 200) {
        final List<dynamic> data = json.decode(responseRecommendations.body);
        recommendations = data.map((item) => Training.fromJson(item)).toList();
      } else {
        throw Exception('Failed to load recommendations');
      }

      // Fetch "For You" trainings

      final responseForYou = await http.get(
        Uri.parse('http://192.168.88.247:8085/api/trainings/company/$companyEmail'),
        headers: {"Content-Type": "application/json; charset=UTF-8"},
      );
      if (responseForYou.statusCode == 200) {
        final List<dynamic> data = json.decode(responseForYou.body);
        forYou = data.map((item) => Training.fromJson(item)).toList();
      } else {
        throw Exception('Failed to load for you trainings');
      }

      // Additional API call with custom URL
      final additionalResponse = await http.get(
        Uri.parse('http://192.168.88.247:8085/api/trainings/company/$companyEmail'),
        headers: {"Content-Type": "application/json; charset=UTF-8"},
      );
      if (additionalResponse.statusCode == 200) {
        // Handle response as needed
        print("Additional response data: ${additionalResponse.body}");
      } else {
        throw Exception('Failed to load additional data');
      }

      setState(() {}); // Refresh the UI
    } catch (e) {
      print(e); // Handle the error (e.g., show a message)
    }
  }


  List<String> skills = ["شبكات واتصالات", "علوم الحاسوب"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: buildAppBar("مرحبًا، ســأرة أحمد!", "lib/images/logo.png", context, true),
      backgroundColor: const Color(0xffEFEFEF),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildSearchRow(),
              const SizedBox(height: 26),
              buildTextTitle('لأجلك', 20, FontWeight.bold),
              SizedBox(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: forYou.length,
                  itemBuilder: (context, index) {
                    final training = forYou[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TrianingDetils(training: training),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: BuildCard(
                          targetScreen: TrianingDetils(training: training),
                          profileScreen: const CompanyScreen(),
                          backColor: secondaryColor,
                          fontColor: primaryColor,
                          img: "lib/images/acadimic.jpg",
                          boxes: secondaryColor,
                          skillsList: skills,
                          role: training.trainingPosition ?? "",
                          location: training.city ?? "",
                          company: training.title ?? "",
                          isCompleted: false,
                        ),
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 26),
              buildTextTitle('توصيات', 20, FontWeight.bold),
              const SizedBox(height: 22),
              SizedBox(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: recommendations.length,
                  itemBuilder: (context, index) {
                    final training = recommendations[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TrianingDetils(training: training),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: BuildCard(
                          targetScreen: TrianingDetils(training: training),
                          profileScreen: const CompanyScreen(),
                          backColor: primaryColor,
                          fontColor: secondaryColor,
                          img: "lib/images/almadar.png",
                          boxes: borderColor,
                          skillsList: skills,
                          role: training.trainingPosition ?? "مهندس شبكات",
                          location: training.city ?? "مصراتة",
                          company: training.title ?? "المــدار",
                          isCompleted: false,
                        ),
                      ),
                    );
                  },
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
          child: BottomBar(),
        ),
      ),
    );
  }
}
