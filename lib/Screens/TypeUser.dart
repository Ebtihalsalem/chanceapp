import 'dart:async';
import 'dart:ui';
import 'package:chanceapp/Screens/yourPlan.dart';
import 'package:chanceapp/TraineeScreens/Intersets.dart';
import 'package:flutter/material.dart';
import '../CompanyScreens/HomeScreen.dart';
import '../Core/App_theme.dart';
import '../TraineeScreens/StartedScreen.dart';
import '../UI Components/BuildText.dart';
import '../UI Components/Button.dart';
import 'Sheet.dart';
import 'Who.dart';


class TypeUser extends StatefulWidget {
  const TypeUser({super.key});

  @override
  State<TypeUser> createState() => _TypeUserState();
}

class _TypeUserState extends State<TypeUser> {


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

    _pageController.addListener((){
      var screen = _pageController.page?.round()?? 0;

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
              return Stack(
                  children: [
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
                        bottom: 130,
                        right: 18,
                        child:Text(titles[index],style: const TextStyle(fontSize: 30,
                            fontWeight:FontWeight.bold,color: Color(0xFFF1F1F1)) ))
                  ]
              );
            },
          ),
          Positioned(
            bottom: 80,
            right: 170,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: sliderImg.map((data){
                var index = sliderImg.indexOf(data);
                return Container(
                  margin: const EdgeInsets.all(4),
                  height: 6,
                  width: _selectedScreen == index ? 16:6,
                  decoration: BoxDecoration(
                    color: _selectedScreen == index ? primaryColor:primaryColor.withOpacity(0.9),
                    borderRadius: BorderRadius.circular(5),
                  ),
                );
              }).toList(),
            ),
          ),

          Sheet(child:SizedBox(height: 100,),screen: Who(),max: 0.3,init: 0.3,)
        ],
      ),
    );
  }
}
//   @override
//   Widget build(BuildContext context) {
//
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       body: Stack(
//         children: [
//           Image.asset(
//             "lib/images/backgroundFill3.jpg",
//             fit: BoxFit.cover,
//             width: 600,
//             height: 600,
//             // height: double.infinity,
//           ),
//           BackdropFilter(
//             filter: ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0),
//             child: Container(
//               height: double.infinity,
//               width: double.infinity,
//               color: Colors.black.withOpacity(0.3),
//             ),
//           ),
//
//           // Center(
//           //   child: Column(
//           //     mainAxisAlignment: MainAxisAlignment.end,
//           //     children:[
//           //       const Expanded(
//           //         flex: 7,
//           //         child: SizedBox(height: 10),
//           //       ),
//           //       Expanded(
//           //         flex: 4,
//           //         child: ClipRRect(
//           //           borderRadius: const BorderRadius.only(
//           //             topLeft: Radius.circular(40.0),
//           //             topRight: Radius.circular(40.0),
//           //           ),
//           //           child: Container(
//           //             padding: const EdgeInsets.fromLTRB(50, 25, 50, 50),
//           //             decoration: BoxDecoration(
//           //               color: primaryColor,
//           //               borderRadius: const BorderRadius.only(
//           //                 topLeft: Radius.circular(40.0),
//           //                 topRight: Radius.circular(40.0),
//           //               ),
//           //             ),
//           //             child: Column(
//           //               children: [
//           //                 Container(
//           //                   height: 3,
//           //                   width: 200,
//           //                   color: Colors.grey,
//           //                 ),
//           //                 Align(
//           //                   alignment: Alignment.bottomRight,
//           //                   child: Padding(
//           //                     padding: const EdgeInsets.only(top: 40.0),
//           //                     child: buildText(
//           //                       "مرحبا، هل أنت ..",
//           //                       20,
//           //                         FontWeight.normal,
//           //                         Colors.grey,
//           //                     ),
//           //                   ),
//           //                 ),
//           //                 const SizedBox(height: 20),
//           //                  Align(
//           //                   alignment: Alignment.centerRight,
//           //                   child: SizedBox(
//           //                     width: 300,
//           //                     height: 50,
//           //                     child: button("باحث عن خبرة",context,const IntersetsScreen(),null,null),
//           //                   ),
//           //                 ),
//           //                 const SizedBox(height: 20),
//           //                 Container(
//           //                   width: 300,
//           //                   height: 50,
//           //                   decoration: BoxDecoration(
//           //                     color: Colors.transparent,
//           //                     borderRadius: BorderRadius.circular(40),
//           //                     border: Border.all(color: const Color(0xFFF59039))
//           //                   ),
//           //                   child: TextButton(
//           //                     onPressed: () {
//           //                       Navigator.of(context).pushReplacement(
//           //                           MaterialPageRoute(builder: (_) => const YourPlan())
//           //                       );
//           //                     },
//           //                     child: buildText(
//           //                       "شركة",
//           //                         16,
//           //                         FontWeight.normal,
//           //                         secondaryColor,
//           //                       ),
//           //                     ),
//           //                   ),
//           //
//           //               ],
//           //             ),
//           //           ),
//           //         ),
//           //       ),
//           //     ],
//           //   ),
//           // ),
//         ],
//       ),
//     );
//   }
// }
