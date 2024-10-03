import 'package:flutter/material.dart';

class AddProfile extends StatefulWidget {
  const AddProfile({super.key});

  @override
  State<AddProfile> createState() => _AddProfileState();
}

class _AddProfileState extends State<AddProfile> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFFEFEFEF),
        child: Column(
            children: [
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     Image.asset(
              //       "lib/images/logo.png",
              //       height: 20,
              //       width: 20,
              //     ),
              //     SizedBox(
              //       width: 10,
              //     ),
              //     const Text("الملف الشخصي",
              //         style: TextStyle(
              //             fontFamily: "Tajawal",
              //             fontSize: 20,
              //             color: Color(0xFF4A4C4D),
              //             fontWeight: FontWeight.bold)),
              //   ],
              // ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        height: 125,
                        width: 125,
                        decoration: BoxDecoration(
                          color: Color(0xFFE7E7E7),
                          borderRadius: BorderRadius.circular(80),
                        ),
                      ),
                      Image.asset(
                        "lib/images/ion_camera.png",
                        height: 50,
                        width: 50,
                      )
                    ],
                  ),
                ],
              ),

            ]),
      ),

      // body: SafeArea(child: Container(),)
        // child: Container(
        //   color: Color(0xFFEFEFEF),
        //   child: Column(
        //     children: [
        //       Row(
        //         mainAxisAlignment: MainAxisAlignment.center,
        //         children: [
        //           Image.asset(
        //             "lib/images/logo.png",
        //             height: 20,
        //             width: 20,
        //           ),
        //           SizedBox(
        //             width: 10,
        //           ),
        //           const Text("الملف الشخصي",
        //               style: TextStyle(
        //                   fontFamily: "Tajawal",
        //                   fontSize: 20,
        //                   color: Color(0xFF4A4C4D),
        //                   fontWeight: FontWeight.bold)),
        //         ],
        //       ),
        //       SizedBox(
        //         height: 20,
        //       ),
        //       Row(
        //         mainAxisAlignment: MainAxisAlignment.center,
        //         children: [
        //           Stack(
        //             alignment: Alignment.center,
        //             children: [
        //               Container(
        //                 height: 125,
        //                 width: 125,
        //                 decoration: BoxDecoration(
        //                   color: Color(0xFFE7E7E7),
        //                   borderRadius: BorderRadius.circular(80),
        //                 ),
        //               ),
        //               Image.asset(
        //                 "lib/images/ion_camera.png",
        //                 height: 50,
        //                 width: 50,
        //               )
        //             ],
        //           ),
        //         ],
        //       ),

              // const SizedBox(
              //   height: 40,
              // ),
        //       Row(
        //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //         children: [
        //           Row(
        //             children: [
        //               // الخط البرتقالي
        //               Container(
        //                 height: 2,
        //                 width: 30,
        //                 color: Color(0xFFF59039),
        //               ),
        //               // الدائرة
        //               Container(
        //                 height: 22,
        //                 width: 22,
        //                 decoration: BoxDecoration(
        //                   color: Color(0xFFF59039),
        //                   borderRadius: BorderRadius.circular(100),
        //                 ),
        //                 child: Center(
        //                   child: Text(
        //                     '1',
        //                     style: TextStyle(
        //                       color: Colors.white,
        //                       fontWeight: FontWeight.bold,
        //                     ),
        //                   ),
        //                 ),
        //               ),
        //             ],
        //           ),
        //           // الخطوة الثانية
        //           Row(
        //             children: [
        //               // الخط الرمادي
        //               Container(
        //                 height: 2,
        //                 width: 30,
        //                 color: Colors.grey,
        //               ),
        //               // الدائرة
        //               Container(
        //                 height: 22,
        //                 width: 22,
        //                 decoration: BoxDecoration(
        //                   color: Colors.grey,
        //                   borderRadius: BorderRadius.circular(100),
        //                 ),
        //                 child: Center(
        //                   child: Text(
        //                     '2',
        //                     style: TextStyle(
        //                       color: Colors.white,
        //                       fontWeight: FontWeight.bold,
        //                     ),
        //                   ),
        //                 ),
        //               ),
        //             ],
        //           ),
        //           // الخطوة الثالثة
        //           Row(
        //             children: [
        //               // الخط الرمادي
        //               Container(
        //                 height: 2,
        //                 width: 30,
        //                 color: Colors.grey,
        //               ),
        //               // الدائرة
        //               Container(
        //                 height: 22,
        //                 width: 22,
        //                 decoration: BoxDecoration(
        //                   color: Colors.grey,
        //                   borderRadius: BorderRadius.circular(100),
        //                 ),
        //                 child: Center(
        //                   child: Text(
        //                     '3',
        //                     style: TextStyle(
        //                       color: Colors.white,
        //                       fontWeight: FontWeight.bold,
        //                     ),
        //                   ),
        //                 ),
        //               ),
        //             ],
        //           ),
        //           // الخطوة الرابعة
        //           Row(
        //             children: [
        //               // لا حاجة لخط هنا
        //               Container(
        //                 height: 2,
        //                 width: 30,
        //                 color: Colors.grey,
        //               ),
        //               // الدائرة
        //               Container(
        //                 height: 22,
        //                 width: 22,
        //                 decoration: BoxDecoration(
        //                   color: Colors.grey,
        //                   borderRadius: BorderRadius.circular(100),
        //                 ),
        //                 child: Center(
        //                   child: Text(
        //                     '4',
        //                     style: TextStyle(
        //                       color: Colors.white,
        //                       fontWeight: FontWeight.bold,
        //                     ),
        //           ),
        //         ),
        //       ),
        //     ],
        //   ),
        //   ],
        // ),
        //       Column(
        //         children: [
        //
        //   ],
        //       ),

      );

  }


}

