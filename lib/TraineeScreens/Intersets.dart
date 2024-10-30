import 'dart:async';

import 'package:flutter/material.dart';
import 'dart:ui';

import '../Core/App_theme.dart';
import '../Screens/Auth.dart';
import '../Screens/LoginScreen.dart';
import '../Screens/Sheet.dart';
import '../UI Components/BackgroundImg.dart';
import '../UI Components/BuildText.dart';
import 'CardIntersets.dart';
import 'Steps.dart';

class IntersetsScreen extends StatefulWidget {
  const IntersetsScreen(String urlPhoto, {super.key, required email});

  @override
  State<IntersetsScreen> createState() => _IntersetsScreenState();
}

class _IntersetsScreenState extends State<IntersetsScreen> {
  List<String> sliderImg = [
    "lib/images/Libyan-Spider2016-04.jpg",
    "lib/images/2148222637.jpg",
    "lib/images/2149930992.jpg",
    "lib/images/b79e7388224459.5dcfccf0a3a99.jpeg"
  ];

  List<String> titles = [
    "استكشف مجالك المهني",
    "اكتشف فرص تريبية\nتناسبك !!",
    "تحصل على المواهب\nالشابة",
    "استكشف كل جديد !!"
  ];

  int _selectedScreen = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();

    _pageController.addListener(() {
      var screen = _pageController.page?.round() ?? 0;

      setState(() {
        _selectedScreen = screen;
      });
    });

    _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (_selectedScreen < sliderImg.length - 1) {
        _selectedScreen++;
      } else {
        _selectedScreen = 0;
      }
      _pageController.animateToPage(
        _selectedScreen,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }

  final PageController _pageController = PageController();

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            physics: const BouncingScrollPhysics(),
            itemCount: sliderImg.length,
            itemBuilder: (context, index) {
              return Stack(children: [
                Image.asset(
                  sliderImg[index],
                  fit: BoxFit.cover,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                ),
                Container(
                  height: double.infinity,
                  width: double.infinity,
                  color: Colors.black.withOpacity(0.4),
                ),
                Positioned(
                  top: 30,
                  right: 18,
                  child: IconButton(
                    icon: Icon(Icons.arrow_back_ios_new,
                        color: backgroundColor, size: 20),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
                Positioned(
                    bottom: 130,
                    right: 18,
                    child: Text(titles[index],
                        style: const TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFF1F1F1)))),
              ]);
            },
          ),
          Positioned(
            bottom: 80,
            right: 170,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: sliderImg.map((data) {
                var index = sliderImg.indexOf(data);
                return Container(
                  margin: const EdgeInsets.all(4),
                  height: 6,
                  width: _selectedScreen == index ? 16 : 6,
                  decoration: BoxDecoration(
                    color: _selectedScreen == index
                        ? primaryColor
                        : primaryColor.withOpacity(0.9),
                    borderRadius: BorderRadius.circular(5),
                  ),
                );
              }).toList(),
            ),
          ),
          Sheet(
            child: SizedBox(
              height: 100,
            ),
            screen: CardIntersets(email:emailGeneral,urlPhoto),
            max: 0.90,
            init: 0.90,
          ),
        ],
      ),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return SafeArea(
  //     child: Scaffold(
  //       resizeToAvoidBottomInset: false,
  //       body: Stack(
  //         children: [
  //           buildBackgroundImage("lib/images/backgroundFill3.jpg",600,600),
  //           buildBlurOverlay(),
  //           Positioned(
  //             top: 20,
  //             left: 350,
  //             child: IconButton(
  //               icon: const Icon(Icons.arrow_back_ios_new,
  //                   color: Colors.white, size: 30),
  //               onPressed: () {
  //                 Navigator.pop(context);
  //               },
  //             ),
  //           ),
  //           Center(
  //             child: Column(
  //               children: [
  //                 _buildTopLine(),
  //                 const SizedBox(height: 90),
  //                 Expanded(
  //                   child: _buildFormContainer(),
  //                 ),
  //               ],
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  Widget _buildTopLine() {
    return Container(
      height: 3,
      width: 140,
      color: Colors.grey,
    );
  }
}
