//
// import 'package:chanceapp/CompanyScreens/ProfileCompany.dart';
// import 'package:chanceapp/CompanyScreens/TrainingScreen.dart';
// import 'package:chanceapp/TraineeScreens/CvScreen.dart';
// import 'package:chanceapp/TraineeScreens/MyAccount.dart';
// import 'package:chanceapp/TraineeScreens/SavedScreen.dart';
// import 'package:chanceapp/TraineeScreens/home.dart';
// import 'package:eva_icons_flutter/eva_icons_flutter.dart';
// import 'package:flutter/material.dart';
// import 'package:google_nav_bar/google_nav_bar.dart';
//
// // تحديد نوع المستخدم
// enum UserType { trainee, company }
//
// class BottomBar extends StatefulWidget {
//   final UserType userType; // إضافة نوع المستخدم
//
//   const BottomBar({super.key, required this.userType}); // تعديل البناء لقبول نوع المستخدم
//
//   @override
//   State<BottomBar> createState() => _BottomBarState();
// }
//
// class _BottomBarState extends State<BottomBar> {
//   int _selectedIndex = 0;
//
//   // قائمة الصفحات حسب نوع المستخدم
//   final List<Widget> _traineePages = [
//     const HomeScreen(),
//     const SavedScreen(),
//     const TrainingScreen(),
//     const MyAccount(),
//   ];
//
//   final List<Widget> _companyPages = [
//     const HomeScreen(), // شاشة رئيسية للشركة
//     const TrainingScreen(), // شاشة التدريبات الخاصة بالشركة
//     const ProfileCompany(), // شاشة بروفايل الشركة
//   ];
//
//   void _navigateToPage(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//
//     Navigator.pushReplacement(
//       context,
//       MaterialPageRoute(builder: (context) {
//         // اختيار الصفحة المناسبة حسب نوع المستخدم
//         return widget.userType == UserType.trainee
//             ? _traineePages[index]
//             : _companyPages[index];
//       }),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: const Color(0xFFF3F3F3),
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8),
//         child: GNav(
//           backgroundColor: const Color(0xFFF3F3F3),
//           color: const Color(0xFFF59039),
//           activeColor: const Color(0xFFF59039),
//           tabBackgroundColor: const Color(0xFFEAEAEA),
//           padding: const EdgeInsets.all(16),
//           selectedIndex: _selectedIndex,
//           onTabChange: (index) {
//             _navigateToPage(index);
//           },
//           tabs: widget.userType == UserType.trainee
//               ? [
//             GButton(
//               icon: _selectedIndex == 0 ? EvaIcons.home : EvaIcons.homeOutline,
//               text: "الرئيسية",
//             ),
//             GButton(
//               icon: _selectedIndex == 1
//                   ? EvaIcons.bookmark
//                   : Icons.bookmark_border,
//               text: "محفوظاتي",
//             ),
//             GButton(
//               icon: _selectedIndex == 2 ? Icons.work : Icons.work_outline,
//               text: "تدريباتي",
//             ),
//             GButton(
//               icon: _selectedIndex == 3 ? Icons.person : Icons.person_outline,
//               text: "حسابي",
//             ),
//           ]
//               : [
//             GButton(
//               icon: _selectedIndex == 0 ? EvaIcons.home : EvaIcons.homeOutline,
//               text: "الرئيسية",
//             ),
//             GButton(
//               icon: _selectedIndex == 1 ? Icons.work : Icons.work_outline,
//               text: "تدريباتي",
//             ),
//             GButton(
//               icon: _selectedIndex == 2 ? Icons.person : Icons.person_outline,
//               text: "بروفايل الشركة",
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


import 'package:chanceapp/CompanyScreens/ProfileCompany.dart';
import 'package:chanceapp/CompanyScreens/TrainingScreen.dart';
import 'package:chanceapp/TraineeScreens/CvScreen.dart';
import 'package:chanceapp/TraineeScreens/MyAccount.dart';
import 'package:chanceapp/TraineeScreens/SavedScreen.dart';
import 'package:chanceapp/TraineeScreens/home.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomeScreen(), // الشاشة الرئيسية
    const SavedScreen(), // شاشة محفوظاتي
    const TrainingScreen(), // شاشة تدريباتي
    const MyAccount(), // شاشة حسابي
  ];

  void _navigateToPage(int index) {
    setState(() {
      _selectedIndex = index;
    });

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => _pages[index]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF3F3F3),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8),
        child: GNav(
          backgroundColor: const Color(0xFFF3F3F3),
          color: const Color(0xFFF59039),
          activeColor: const Color(0xFFF59039),
          tabBackgroundColor: const Color(0xFFEAEAEA),
          padding: const EdgeInsets.all(16),
          selectedIndex: _selectedIndex,
          onTabChange: (index) {
            _navigateToPage(index);
          },
          tabs: [
            GButton(
              icon: _selectedIndex == 0 ? EvaIcons.home : EvaIcons.homeOutline,
              text: "الرئيسية",
              textStyle: const TextStyle(
                  fontFamily: "Tajawal",
                  fontSize: 12,
                  color: Color(0xFFF59039)),
            ),
            GButton(
              icon: _selectedIndex == 1
                  ? EvaIcons.bookmark
                  : Icons.bookmark_border,
              text: "محفوظاتي",
              textStyle: const TextStyle(
                  fontFamily: "Tajawal",
                  fontSize: 12,
                  color: Color(0xFFF59039)),
            ),
            GButton(
              icon: _selectedIndex == 2 ? Icons.work : Icons.work_outline,
              text: "تدريباتي",
              textStyle: const TextStyle(
                  fontFamily: "Tajawal",
                  fontSize: 12,
                  color: Color(0xFFF59039)),
            ),
            GButton(
              icon: _selectedIndex == 3 ? Icons.person : Icons.person_outline,
              text: "حسابي",
              textStyle: const TextStyle(
                  fontFamily: "Tajawal",
                  fontSize: 12,
                  color: Color(0xFFF59039)),
            ),
          ],
        ),
      ),
    );
  }
}

// import 'package:chanceapp/CompanyScreens/ProfileCompany.dart';
// import 'package:chanceapp/CompanyScreens/TrainingScreen.dart';
// import 'package:chanceapp/TraineeScreens/SavedScreen.dart';
// import 'package:chanceapp/TraineeScreens/home.dart';
// import 'package:eva_icons_flutter/eva_icons_flutter.dart';
// import 'package:flutter/material.dart';
// import 'package:google_nav_bar/google_nav_bar.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'navigation_provider.dart'; // استيراد مزود التنقل
//
// class BottomBar extends ConsumerWidget {
//   const BottomBar({super.key});
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     // الحصول على الفهرس المختار من مزود `Riverpod`
//     final selectedIndex = ref.watch(navigationProvider);
//
//     // قائمة الشاشات التي يتم التنقل بينها
//     List<Widget> nav_bottom = <Widget>[
//       HomeScreen(),
//       SavedScreen(),
//       TrainingScreen(),
//       ProfileCompany(),
//     ];
//
//     return Scaffold(
//       body: nav_bottom[selectedIndex], // تغيير الشاشة بناءً على الفهرس المختار
//       bottomNavigationBar: Container(
//         color: const Color(0xFFF3F3F3),
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8),
//           child: GNav(
//             backgroundColor: const Color(0xFFF3F3F3),
//             color: const Color(0xFFF59039),
//             activeColor: const Color(0xFFF59039),
//             tabBackgroundColor: const Color(0xFFEAEAEA),
//             padding: const EdgeInsets.all(16),
//             selectedIndex: selectedIndex,
//             onTabChange: (index) {
//               // تحديث الفهرس المختار باستخدام Riverpod
//               ref.read(navigationProvider.notifier).state = index;
//             },
//             tabs: [
//               GButton(
//                 icon: selectedIndex == 0 ? EvaIcons.home : EvaIcons.homeOutline,
//                 text: "الرئيسية",
//                 textStyle: const TextStyle(
//                     fontFamily: "Tajawal",
//                     fontSize: 12,
//                     color: Color(0xFFF59039)),
//               ),
//               GButton(
//                 icon: selectedIndex == 1
//                     ? EvaIcons.bookmark
//                     : Icons.bookmark_border,
//                 text: "محفوظاتي",
//                 textStyle: const TextStyle(
//                     fontFamily: "Tajawal",
//                     fontSize: 12,
//                     color: Color(0xFFF59039)),
//               ),
//               GButton(
//                 icon: selectedIndex == 2 ? Icons.work : Icons.work_outline,
//                 text: "تدريباتي",
//                 textStyle: const TextStyle(
//                     fontFamily: "Tajawal",
//                     fontSize: 12,
//                     color: Color(0xFFF59039)),
//               ),
//               GButton(
//                 icon: selectedIndex == 3 ? Icons.person : Icons.person_outline,
//                 text: "حسابي",
//                 textStyle: const TextStyle(
//                     fontFamily: "Tajawal",
//                     fontSize: 12,
//                     color: Color(0xFFF59039)),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


