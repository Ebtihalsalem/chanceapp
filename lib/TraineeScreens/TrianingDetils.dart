// import 'package:chanceapp/TraineeScreens/ReqScreen.dart';
// import 'package:chanceapp/TraineeScreens/home.dart';
// import 'package:chanceapp/UI%20Components/TextField.dart';
// import 'package:eva_icons_flutter/eva_icons_flutter.dart';
// import 'package:flutter/material.dart';
//
// import '../../UI Components/BottomBar.dart';
// import '../Core/App_theme.dart';
// import '../UI Components/AppBar.dart';
// import '../UI Components/Button.dart';
// import '../UI Components/CardDetails.dart';
//
//
// class TrianingDetils extends StatefulWidget {
//   const TrianingDetils({super.key});
//
// //تمرير له لون والبيانات اللون حسب اذا كان من التوصيات او لاجلك
//
//
//   @override
//   State<TrianingDetils> createState() => _TrianingDetilsState();
// }
//
// class _TrianingDetilsState extends State<TrianingDetils> {
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       appBar: buildAppBar("التدريب", "lib/images/logo.png", context, false),
//       backgroundColor: const Color(0xffEFEFEF),
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 40.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const SizedBox(height: 22),
//               Padding(
//                 padding: const EdgeInsets.only(left: 8.0),
//                 child: cardDetails(
//                     context,
//                     secondaryColor,
//                     primaryColor,
//                     "lib/images/acadimic.jpg",
//                     secondaryColor,
//                     "مهندس اتصالات",
//                     "الاكاديمية الليبية "),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(top: 18.0),
//                 child: information(
//                     "شهرين",
//                     "20",
//                     "يوجد",
//                     borderColor,
//                     primaryColor,
//                     secondaryColor,
//                     borderColor),
//               ),
//               const SizedBox(height: 15,),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   const Icon(
//                       EvaIcons.starOutline, color: Color(0xFFF59039), size: 30),
//                   const Icon(
//                       EvaIcons.messageCircleOutline, color: Color(0xFFF59039),
//                       size: 26),
//                   textField("تعليقك..", null, 40, 270, null, false)
//                 ],
//               ),
//               const SizedBox(height: 130,),
//               Center(
//                 child: SizedBox(
//                   width: 300,
//                   height: 50,
//                   child:
//                   button(
//                       "طلب التدريب", context, const RequestScreen(), null, null),
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
//
//
// }
//
import 'package:chanceapp/TraineeScreens/ReqScreen.dart';
import 'package:chanceapp/TraineeScreens/home.dart';
import 'package:chanceapp/UI%20Components/TextField.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

import '../../UI Components/BottomBar.dart';
import '../CompanyScreens/jsontraining.dart';
import '../Core/App_theme.dart';
import '../UI Components/AppBar.dart';
import '../UI Components/Button.dart';
import '../UI Components/CardDetails.dart';

class TrianingDetils extends StatelessWidget {
  final Training training; // Accepting a Training object

  const TrianingDetils({super.key, required this.training}); // Modified constructor

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar("التدريب", "lib/images/logo.png", context, false),
      backgroundColor: const Color(0xffEFEFEF),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 22),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: cardDetails(
                  context,
                  secondaryColor,
                  primaryColor,
                  training.companyLogo ?? '', // استخدام القيمة الافتراضية إذا كانت فارغة
                  secondaryColor,
                  training.trainingPosition ?? '', // استخدام القيمة الافتراضية إذا كانت فارغة
                  training.city??'',
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 18.0),
                child: information(
                  "شهرين",
                  "20",
                  "يوجد",
                  borderColor,
                  primaryColor,
                  secondaryColor,
                  borderColor,
                ),
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Icon(EvaIcons.starOutline, color: Color(0xFFF59039), size: 30),
                  const Icon(EvaIcons.messageCircleOutline, color: Color(0xFFF59039), size: 26),
                  textField("تعليقك..", null, 40, 270, null, false),
                ],
              ),
              const SizedBox(height: 130),
              Center(
                child: SizedBox(
                  width: 300,
                  height: 50,
                  child: button(
                      "طلب التدريب",
                      context,
                      const RequestScreen(),
                      null,
                      null
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 20.0, left: 20, right: 20),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(30)),
          child: BottomBar(),
        ),
      ),
    );
  }
}
