// import 'package:flutter/material.dart';
//
// import '../Core/App_theme.dart';
// import '../TraineeScreens/home.dart';
// import '../UI Components/BuildText.dart';
// import 'Bouquets.dart';
//
// class YourPlan extends StatefulWidget {
//   const YourPlan({super.key});
//
//   @override
//   State<YourPlan> createState() => _YourPlanState();
// }
//
// class _YourPlanState extends State<YourPlan> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           backgroundColor: backgroundColor,
//           title: Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Image.asset(
//                 "lib/images/logo.png",
//                 height: 20,
//                 width: 20,
//               ),
//               const SizedBox(
//                 width: 10,
//               ),
//               buildTextTitle("فرصتك في يدك",
//                   20,
//                   FontWeight.bold
//               ),
//             ],
//           ),
//         ),
//         body: Align(
//           alignment: Alignment.center,
//           child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Image.asset(
//                   "lib/images/6294375.png",
//                   height: 280,
//                   width: 280,
//                 ),
//                 const SizedBox(height: 25,),
//                 const Text("تريد الاستمرار بالباقة\nالبرونزية؟",textAlign: TextAlign.center,style: TextStyle(
//                     color: Color(0xff4A4C4D),fontSize:24,fontWeight:FontWeight.bold ),),
//                 const SizedBox(height: 20,),
//                 buildTextTitle("الباقة تسمح لك بـ نشر 2 تدريبات ",
//                     15,FontWeight.normal),
//                 const SizedBox(height: 20,),
//                 SizedBox(
//                   width: 300,
//                   height: 50,
//                   child: ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor:primaryColor,
//                     ),
//                     onPressed: () {},
//                     child: buildText(
//                         "الاستمرار", 16,
//                         FontWeight.bold,
//                         const Color(0xFFFDFDFD)
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 16),
//                 Container(
//                   width: 300,
//                   height: 50,
//                   decoration: BoxDecoration(
//                       color: Colors.transparent,
//                       borderRadius: BorderRadius.circular(40),
//                       border: Border.all(color: primaryColor)),
//                   child: TextButton(
//                     onPressed: () {
//                       Navigator.of(context).pushReplacement(
//                           MaterialPageRoute(builder: (context) => const Bouquets())
//                       );
//                     },
//                     child: buildText(
//                       "تغيير الباقة", 16,FontWeight.bold,
//                       primaryColor,
//                     ),
//                   ),
//                 ),
//               ]),
//         ));
//   }
// }
