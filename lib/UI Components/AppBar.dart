// import 'package:eva_icons_flutter/eva_icons_flutter.dart';
// import 'package:flutter/material.dart';
//
// import '../Core/App_theme.dart';
// import '../TraineeScreens/MessageScreen.dart';
// import '../TraineeScreens/NotifationScreen.dart';
// import 'BuildText.dart';
//
// AppBar buildAppBar(String title,String img,BuildContext context,bool main) {
//   return AppBar(
//     backgroundColor: primaryColor,
//     automaticallyImplyLeading: false,
//     title: Padding(
//       padding: const EdgeInsets.only(top: 18, right: 18.0),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//           Image.asset(
//             img,
//             height: 25,
//             width: 25,
//           ),
//           const SizedBox(
//             width: 10,
//           ),
//           buildTextTitle(title, 16, FontWeight.bold,),
//         ],
//       ),
//     ),
//     if(main)
//   {
//     actions:
//     [
//       _buildActionButton(EvaIcons.messageCircle, () {
//         Navigator.of(context).pushReplacement(
//             MaterialPageRoute(builder: (context) => const MessageScreen()));
//       }),
//       const SizedBox(width: 10),
//       Padding(
//         padding: const EdgeInsets.only(left: 18.0),
//         child: _buildActionButton(EvaIcons.bell, () {
//           Navigator.of(context).pushReplacement(
//               MaterialPageRoute(
//                   builder: (context) => const NotifationScreen()));
//         }),
//       ),
//     ]
//   ,
// }
//   );
// }
//
// Widget _buildActionButton(IconData icon, VoidCallback onTap) {
//   return Container(
//     margin: const EdgeInsets.only(top: 18.0, left: 18),
//     child: GestureDetector(
//       onTap: onTap,
//       child: Container(
//         height: 40,
//         width: 40,
//         decoration: const BoxDecoration(
//           shape: BoxShape.circle,
//           color: Color(0xffE7E7E7),
//         ),
//         child: Icon(
//           icon,
//           color: const Color(0xFFF59039),
//           size: 25,
//         ),
//       ),
//     ),
//   );
// }

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

import '../Core/App_theme.dart';
import '../TraineeScreens/MessageScreen.dart';
import '../TraineeScreens/NotifationScreen.dart';
import 'BuildText.dart';

AppBar buildAppBar(String title,String img,BuildContext context,bool main) {
  return AppBar(
    backgroundColor: primaryColor,
    automaticallyImplyLeading: false,
    title: Padding(
      padding: const EdgeInsets.only(top: 18, right: 18.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          main ? IconButton(icon: Icon(null), onPressed: () {  },):
          IconButton(icon: Icon(Icons.arrow_back_ios_new,color: secondaryColor,size: 18,),
            onPressed: (){
            Navigator.of(context).pop(false);
            },),
          Image.asset(
            img,
            height: 25,
            width: 25,
          ),
          const SizedBox(
            width: 10,
          ),
          buildTextTitle(title, 16, FontWeight.bold,),
        ],
      ),
    ),
    actions: main
        ? [
      _buildActionButton(EvaIcons.messageCircle, () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const MessageScreen()));
      }),
      const SizedBox(width: 10),
      Padding(
        padding: const EdgeInsets.only(left: 18.0),
        child: _buildActionButton(EvaIcons.bell, () {
          // هنا تأكد من أن NotificationProvider متاح في السياق
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => NotifationScreen(),
            ),
          );
        }),
      ),
    ]
        : [],
  );
}

Widget _buildActionButton(IconData icon, VoidCallback onTap) {
  return Container(
    margin: const EdgeInsets.only(top: 18.0, left: 18),
    child: GestureDetector(
      onTap: onTap,
      child: Container(
        height: 40,
        width: 40,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Color(0xffE7E7E7),
        ),
        child: Icon(
          icon,
          color: const Color(0xFFF59039),
          size: 25,
        ),
      ),
    ),
  );
}