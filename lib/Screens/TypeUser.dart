import 'dart:ui';
import 'package:flutter/material.dart';
import '../CompanyScreens/HomeScreen.dart';
import '../Core/App_theme.dart';
import '../TraineeScreens/StartedScreen.dart';
import '../UI Components/BuildText.dart';
import '../UI Components/Button.dart';


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
                  flex: 4,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(40.0),
                      topRight: Radius.circular(40.0),
                    ),
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(50, 25, 50, 50),
                      decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: const BorderRadius.only(
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
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 40.0),
                              child: buildText(
                                "مرحبا، هل أنت ..",
                                20,
                                  FontWeight.normal,
                                  Colors.grey,
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                           Align(
                            alignment: Alignment.centerRight,
                            child: SizedBox(
                              width: 300,
                              height: 50,
                              child: button("باحث عن خبرة",context,const StartedScreen(),null),
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
                              onPressed: () {
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(builder: (_) => const CHomeScreen())
                                );
                              },
                              child: buildText(
                                "شركة",
                                  16,
                                  FontWeight.normal,
                                  secondaryColor,
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
