// import 'package:chanceapp/CompanyScreens/CompanyMyProfile.dart';
// import 'package:chanceapp/CompanyScreens/TrainingDetails.dart';
// import 'package:chanceapp/Core/App_theme.dart';
// import 'package:chanceapp/UI%20Components/Cards.dart';
// import 'package:flutter/material.dart';
//
// import '../../UI Components/BottomBar.dart';
// import '../UI Components/AppBar.dart';
// import '../UI Components/BuildText.dart';
// import '../UI Components/SearchBar.dart';
// import 'CompanyScreen.dart';
//
//
//
// class SavedScreen extends StatefulWidget {
//   const SavedScreen({super.key});
//
//   @override
//   State<SavedScreen> createState() => _SavedScreenState();
// }
//
// class _SavedScreenState extends State<SavedScreen> {
//
//   List<String> skills = ["شبكات واتصالات", "علوم الحاسوب"];
//
//   @override
//
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       appBar: buildAppBar("المحفوظات", "lib/images/logo.png",context,false),
//       backgroundColor: primaryColor,
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 18.0),
//           child:
//           Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//             buildSearchRow(),
//             const SizedBox(height: 26),
//             buildTextTitle('التدريبات', 20, FontWeight.bold),
//             const SizedBox(height: 22),
//             SizedBox(
//               height: 500,
//               child: ListView.builder(
//                 itemCount: 10,
//                 itemBuilder: (context, index) {
//                   return Padding(
//                     padding: const EdgeInsets.only(bottom: 8.0),
//                     child: buildCard(
//                         context,
//                         const TrainingDetailsCompany(),
//                         const CompanyScreen(),
//                         secondaryColor,
//                         primaryColor,
//                         "lib/images/acadimic.jpg",
//                         secondaryColor,
//                         primaryColor,
//                         skills,
//                         "مهندس اتصالات",
//                         "مصراتة",
//                         "الاكاديمية الليبية",false),
//                   );
//                 },
//               ),
//             ),
//           ]),
//         ),
//       ),
//       bottomNavigationBar: Padding(
//         padding: const EdgeInsets.only(bottom: 20.0, left: 20, right: 20),
//         child: ClipRRect(
//           borderRadius: const BorderRadius.all(Radius.circular(30)),
//           child: BottomBar(), // Pass the isCompany parameter here
//         ),
//       ),
//     );
//   }
// }
// import 'package:chanceapp/CompanyScreens/CompanyMyProfile.dart';
// import 'package:chanceapp/CompanyScreens/TrainingDetails.dart';
// import 'package:chanceapp/Core/App_theme.dart';
// import 'package:chanceapp/UI%20Components/Cards.dart';
// import 'package:flutter/material.dart';
//
// import '../../UI Components/BottomBar.dart';
// import '../UI Components/AppBar.dart';
// import '../UI Components/BuildText.dart';
// import '../UI Components/SearchBar.dart';
// import 'CompanyScreen.dart';
//
// class SavedScreen extends StatefulWidget {
//   const SavedScreen({super.key});
//
//   @override
//   State<SavedScreen> createState() => _SavedScreenState();
// }
//
// class _SavedScreenState extends State<SavedScreen> {
//   List<String> skills = ["شبكات واتصالات", "علوم الحاسوب"];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       appBar: buildAppBar("المحفوظات", "lib/images/logo.png", context, false),
//       backgroundColor: primaryColor,
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 18.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               buildSearchRow(),
//               const SizedBox(height: 26),
//               buildTextTitle('التدريبات', 20, FontWeight.bold),
//               const SizedBox(height: 22),
//               SizedBox(
//                 height: 500,
//                 child: ListView.builder(
//                   itemCount: 10,
//                   itemBuilder: (context, index) {
//                     return Padding(
//                       padding: const EdgeInsets.only(bottom: 8.0),
//                       child: BuildCard(
//                         targetScreen: const TrainingDetailsCompany(),
//                         profileScreen: const CompanyScreen(),
//                         backColor: secondaryColor,
//                         fontColor: primaryColor,
//                         img: "lib/images/acadimic.jpg",
//                         boxes: secondaryColor,
//                         skillsList: skills,
//                         role: "مهندس اتصالات",
//                         location: "مصراتة",
//                         company: "الاكاديمية الليبية",
//                         isCompleted: false,
//                       ),
//                     );
//                   },
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//       bottomNavigationBar: Padding(
//         padding: const EdgeInsets.only(bottom: 20.0, left: 20, right: 20),
//         child: ClipRRect(
//           borderRadius: const BorderRadius.all(Radius.circular(30)),
//           child: BottomBar(), // تأكد من تمرير معامل isCompany إذا لزم الأمر
//         ),
//       ),
//     );
//   }
// }
import 'package:chanceapp/TraineeScreens/saved_trainings_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../CompanyScreens/TrainingDetails.dart';
import '../Core/App_theme.dart';
import '../UI Components/AppBar.dart';
import '../UI Components/BottomBar.dart';
import '../UI Components/BuildText.dart';
import '../UI Components/Cards.dart';
import 'CompanyScreen.dart';

class SavedScreen extends StatelessWidget {
  const SavedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final savedTrainingProvider = Provider.of<SavedTrainingProvider>(context);
    final savedTrainings = savedTrainingProvider.savedTrainings;

    return Scaffold(
      appBar: buildAppBar("المحفوظات", "lib/images/logo.png", context, false),
      backgroundColor: primaryColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildTextTitle('التدريبات المحفوظة', 20, FontWeight.bold),
              const SizedBox(height: 22),
              savedTrainings.isEmpty
                  ? Center(child: buildText('لا يوجد تدريبات محفوظة', 16, FontWeight.normal, Colors.grey))
                  : Expanded( // استخدام Expanded هنا
                child: ListView.builder(
                  itemCount: savedTrainings.length,
                  itemBuilder: (context, index) {
                    String role = savedTrainings[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: BuildCard(
                        targetScreen: TrainingDetailsCompany(),
                        profileScreen: CompanyScreen(),
                        backColor: secondaryColor,
                        fontColor: primaryColor,
                        img: "lib/images/acadimic.jpg",
                        boxes: secondaryColor,
                        skillsList: ["شبكات واتصالات", "علوم الحاسوب"],
                        role: role,
                        location: "مصراتة",
                        company: "الأكاديمية الليبية",
                        isCompleted: false,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 20.0, left: 20, right: 20),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(30)),
          child: BottomBar(),
        ),
      ),
    );
  }
}
