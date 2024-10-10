import 'dart:ui';

import 'package:flutter/material.dart';

import 'StartedScreen.dart';

class TypeUser extends StatefulWidget {
  const TypeUser({super.key});

  @override
  State<TypeUser> createState() => _TypeUserState();
}

class _TypeUserState extends State<TypeUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Image.asset(
            "lib/images/backgroundFill3.jpg",
            fit: BoxFit.cover,
            width: 600,
            height: 600,
            // height: double.infinity,
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0),
            child: Container(
              height: double.infinity,
              width: double.infinity,
              color: Colors.black.withOpacity(0.2),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children:[
                const Expanded(
                  flex: 7,
                  child: SizedBox(height: 10),
                ),
                Expanded(
                  flex: 3,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(40.0),
                      topRight: Radius.circular(40.0),
                    ),
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(50, 25, 50, 50),
                      decoration: const BoxDecoration(
                        color: Color(0xFFEFEFEF),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40.0),
                          topRight: Radius.circular(40.0),
                        ),
                      ),
                      child: Column(
                        children: [
                          Container(
                            height: 3,
                            width: 200,
                            color: Colors.grey,
                          ),
                          const Align(
                            alignment: Alignment.bottomRight,
                            child: Padding(
                              padding: EdgeInsets.only(top:30.0),
                              child: Text(
                                "مرحبا، هل أنت ..",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 20,
                                  fontWeight: FontWeight.normal,
                                  fontFamily: "Tajawal",
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                           Align(
                            alignment: Alignment.centerRight,
                            child: SizedBox(
                              width: 300,
                              height: 50,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFFF59039),
                                ),
                                onPressed: () {
                                  Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(builder: (_) => const StartedScreen())
                                  );
                                },
                                child: const Text(
                                  "باحث عن خبرة",
                                  textDirection: TextDirection.rtl,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontFamily: "Tajawal",
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Container(
                            width: 300,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(40),
                              border: Border.all(color: const Color(0xFFF59039))
                            ),
                            child: TextButton(
                              onPressed: () {},
                              child: const Text(
                                "شركة",
                                textDirection: TextDirection.rtl,
                                style: TextStyle(
                                  color: Color(0xFFF59039),
                                  fontSize: 16,
                                  fontFamily: "Tajawal",
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
