import 'package:chanceapp/Core/App_theme.dart';
import 'package:flutter/material.dart';
import '../../UI Components/BottomBar.dart';
import '../UI Components/BuildText.dart';
import '../UI Components/CenterAppBar.dart';
import 'Boxes.dart';
import 'HeatMap.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<void> addExperience(Experience experience) async {
  final url = Uri.parse('https://192.168.1.14:8085/experiences');
  final response = await http.post(
    url,
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode(experience.toJson()),
  );

  if (response.statusCode == 201) {
    print('Experience added successfully');
  } else {
    print('Failed to add experience: ${response.body}');
  }
}

Future<List<Experience>> getExperiencesByUserId(int userId) async {
  final url = Uri.parse('http://192.168.1.14:8085/experiences/$userId');
  final response = await http.get(url);

  if (response.statusCode == 200) {
    final List<dynamic> data = jsonDecode(response.body);
    return data.map((e) => Experience.fromJson(e)).toList();
  } else {
    throw Exception('Failed to load experiences');
  }
}

class TrackingScreen extends StatefulWidget {
  const TrackingScreen({super.key});

  @override
  State<TrackingScreen> createState() => _TrackingScreenState();
}

class _TrackingScreenState extends State<TrackingScreen> {
  final Map<DateTime, String> activities = {
    DateTime(2024, 1, 1): "بداية النشاط",
    DateTime(2024, 2, 10): "تدريب مكثف",
    DateTime(2024, 2, 15): "مشاركة في ورشة عمل",
    DateTime(2024, 3, 20): "تقديم مشروع",
    DateTime(2024, 3, 25): "حضور مؤتمر",
  };

  List<String> tipsList = ["CX", "UX", "EUX"];
  int currentUserId = 1; // Example user ID; replace this with actual user data as needed.

  @override
  void initState() {
    super.initState();
    fetchUserExperiences();
  }

  void fetchUserExperiences() async {
    try {
      List<Experience> userExperiences = await getExperiencesByUserId(currentUserId);
      setState(() {
        for (var experience in userExperiences) {
          // Add or update entries in activities based on user experience data
          activities[DateTime.parse(experience.startDate)] = experience.status;
        }
      });
    } catch (e) {
      print("Error loading experiences: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: centerAppBar(context, "تتبع الخبرة"),
      body: ListView( // استخدام ListView هنا
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 18.0),
        children: [
          Align(
              alignment: Alignment.centerRight,
              child: buildTextTitle(
                  "راجع تقدمك المهني وتطور مهاراتك", 18, FontWeight.bold
              )
          ),
          const SizedBox(height: 40),
          heatMap(context, activities),
          const SizedBox(height: 26),
          tips(),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 20.0, left: 20, right: 20),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(30)),
          child: BottomBar(), // Pass the isCompany parameter here if necessary
        ),
      ),
    );
  }

  Widget tips() {
    return Row(
      children: [
        boxesSkills(tipsList, "ينصح به لتكملة مسيرتك", false),
      ],
    );
  }
}

class Experience {
  final int userId;
  final int trainingId;
  final String startDate;
  final String endDate;
  final String status;
  final int hoursCompleted;
  final List<String> skillsAcquired;

  Experience({
    required this.userId,
    required this.trainingId,
    required this.startDate,
    required this.endDate,
    required this.status,
    required this.hoursCompleted,
    required this.skillsAcquired,
  });

  factory Experience.fromJson(Map<String, dynamic> json) {
    return Experience(
      userId: json['userId'],
      trainingId: json['trainingId'],
      startDate: json['startDate'],
      endDate: json['endDate'],
      status: json['status'],
      hoursCompleted: json['hoursCompleted'],
      skillsAcquired: List<String>.from(json['skillsAcquired']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'trainingId': trainingId,
      'startDate': startDate,
      'endDate': endDate,
      'status': status,
      'hoursCompleted': hoursCompleted,
      'skillsAcquired': skillsAcquired,
    };
  }
}

// import 'package:chanceapp/Core/App_theme.dart';
// import 'package:flutter/material.dart';
// import '../../UI Components/BottomBar.dart';
// import '../UI Components/BuildText.dart';
// import '../UI Components/CenterAppBar.dart';
// import 'Boxes.dart';
// import 'HeatMap.dart';
//
// class TrackingScreen extends StatefulWidget {
//   const TrackingScreen({super.key});
//
//   @override
//   State<TrackingScreen> createState() => _TrackingScreenState();
// }
//
// class _TrackingScreenState extends State<TrackingScreen> {
//
//   final Map<DateTime, String> activities = {
//     DateTime(2024, 1, 1): "بداية النشاط",
//     DateTime(2024, 2, 10): "تدريب مكثف",
//     DateTime(2024, 2, 15): "مشاركة في ورشة عمل",
//     DateTime(2024, 3, 20): "تقديم مشروع",
//     DateTime(2024, 3, 25): "حضور مؤتمر",
//   };
//
//   List<String> tipsList = ["CX","UX","EUX"];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       appBar: centerAppBar(context,"تتبع الخبرة"),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 18.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             Align(
//                 alignment: Alignment.centerRight,
//                 child: buildTextTitle(
//                     "راجع تقدمك المهني وتطور مهاراتك", 18, FontWeight.bold)),
//             const SizedBox(
//               height: 40,
//             ),
//             heatMap(context,activities),
//             const SizedBox(height: 26,),
//             tips(),
//           ],
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
//
//   Widget tips(){
//     return Row(
//       children: [
//         boxesSkills(tipsList,"ينصح به لتكملة مسيرتك",false),
//       ],
//     );
//   }
//
// }
