import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../Core/App_theme.dart';



class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
   int _selectedIndex = 0;

   // void _navigateToPage(int index) {
   //   // بناء التوجيه استنادًا إلى الفهرس المختار
   //   switch (index) {
   //     case 0:
   //       Navigator.pushReplacement(
   //         context,
   //         MaterialPageRoute(builder: (context) => const HomeScreen()),
   //       );
   //       break;
   //     case 1:
   //       Navigator.pushReplacement(
   //         context,
   //         MaterialPageRoute(builder: (context) => const SavedScreen()),
   //       );
   //       break;
   //     case 2:
   //       Navigator.pushReplacement(
   //         context,
   //         MaterialPageRoute(builder: (context) => const MyTraining()),
   //       );
   //       break;
   //     case 3:
   //       Navigator.pushReplacement(
   //         context,
   //         MaterialPageRoute(builder: (context) => const MyAccount()),
   //       );
   //       break;
   //   }
   // }

  @override
  Widget build(BuildContext context) {
     return Container(
        color: const Color(0xFFF3F3F3),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8),
          child: GNav(
            backgroundColor: whiteApp,
            color: primaryColor,
            activeColor: primaryColor,
            tabBackgroundColor: const Color(0xFFE0E0E0),
            padding: const EdgeInsets.all(16),
            selectedIndex: _selectedIndex,
            onTabChange: (index) {
              setState(() {
                _selectedIndex = index;
              });
              // _navigateToPage(index);
            },
            tabs: [
              GButton(
                icon: _selectedIndex == 0 ? EvaIcons.home : EvaIcons.homeOutline,
                text: "الرئيسية",
                textStyle: TextStyle(
                    fontFamily: "Tajawal",
                    fontSize: 12,
                    color: primaryColor),
              ),
              GButton(
                  icon: _selectedIndex == 1
                      ? EvaIcons.bookmark
                      : Icons.bookmark_border,
                  text: "محفوظاتي",
                  textStyle: TextStyle(
                      fontFamily: "Tajawal",
                      fontSize: 12,
                      color: primaryColor)),
              GButton(
                  icon: _selectedIndex == 2 ? Icons.work : Icons.work_outline,
                  text: "تدريباتي",
                  textStyle: TextStyle(
                      fontFamily: "Tajawal",
                      fontSize: 12,
                      color: primaryColor)),
              GButton(
                  icon: _selectedIndex == 3 ? Icons.person : Icons.person_outline,
                  text: "حسابي",
                  textStyle: TextStyle(
                      fontFamily: "Tajawal",
                      fontSize: 12,
                      color: primaryColor)),
            ],
          ),
        ),

    );
  }
}
