import 'dart:ui';

import 'package:flutter/material.dart';

import 'LoginScreen.dart';

class StartedScreen extends StatefulWidget {
  const StartedScreen({super.key});

  @override
  State<StartedScreen> createState() => _StartedScreenState();
}

class _StartedScreenState extends State<StartedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Image.asset(
          "lib/images/backman.jpg",
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0),
          child: Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.black.withOpacity(0.2),
          ),
        ),

         const Row(
           mainAxisAlignment: MainAxisAlignment.start,
           children: [
             Padding(
                padding: EdgeInsets.only(top: 700.0,right: 15),
                child:
                    Text("مستقبلك المهني يبدأ هنا!! ",style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Tajawal",
                    ),),
                ),
           ],
         ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 760.0,right: 15),
                child: Text("- ربط الخريجين بالشركات وتطوير المهارات المطلوبة. ",
                  style: TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontFamily: "Tajawal",
                ),),
              ),
            ],
          ),
       const SizedBox(height: 20,),
        

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 800.0,right: 15),
              child: SizedBox(
                width: 300,
                height: 50,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                    WidgetStateProperty.all(
                      const Color(0xFFF59039),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                        builder: (context) => const Loginscreen()));
                  },
                  child: const Text(
                    "ابـــدأ",
                    textDirection: TextDirection.rtl,
                    style: TextStyle(
                        color: Colors.white70, fontSize: 16,fontFamily: "Tajawal"),
                  ),
                ),
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
