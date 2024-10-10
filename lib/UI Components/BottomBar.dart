import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../Screens/SavedScreen.dart';
import '../Screens/home.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
   int _selectedIndex = 0;


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
            setState(() {
              _selectedIndex = index;
            });
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
                    color: Color(0xFFF59039))),
            GButton(
                icon: _selectedIndex == 2 ? Icons.work : Icons.work_outline,
                text: "تدريباتي",
                textStyle: const TextStyle(
                    fontFamily: "Tajawal",
                    fontSize: 12,
                    color: Color(0xFFF59039))),
            GButton(
                icon: _selectedIndex == 3 ? Icons.person : Icons.person_outline,
                text: "حسابي",
                textStyle: const TextStyle(
                    fontFamily: "Tajawal",
                    fontSize: 12,
                    color: Color(0xFFF59039))),
          ],
        ),
      ),

    );
  }
}
