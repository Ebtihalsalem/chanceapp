import 'package:flutter/material.dart';
import 'dart:ui';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Image.asset(
              "lib/images/backgroundFill3.jpg",
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
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.only(top: 80.0),
                child: Column(
                  children: [
                    Image.asset(
                      'lib/images/logo.png',
                      height: 140,
                      width: 140,
                    ),
                    const SizedBox(height: 15),
                    const Text(
                      "فرصتك في يدك",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Tajawal",
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: Column(
                children: [
                  const Expanded(
                    flex: 7,
                    child: SizedBox(height: 10),
                  ),
                  Expanded(
                    flex: 10,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(40.0),
                        topRight: Radius.circular(40.0),
                      ),
                        child: Container(
                          padding: const EdgeInsets.fromLTRB(50, 50, 50, 50),
                          decoration: const BoxDecoration(
                            color: Color(0xFFEFEFEF),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(40.0),
                              topRight: Radius.circular(40.0),
                            ),
                          ),
                          child: Form(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const SizedBox(height: 5),
                                SizedBox(
                                  width: 300,
                                  height: 60,
                                  child: TextField(
                                    textDirection: TextDirection.rtl,
                                    textAlign: TextAlign.right,
                                    decoration: InputDecoration(
                                      // label: const Text("اسم المستخدم",style: TextStyle(fontFamily: "Tajawal",
                                      //     color: Colors.grey),),
                                      hintText: "اسم المستخدم",
                                      hintStyle: TextStyle(fontFamily: "Tajawal", color: Colors.grey),
                                      filled: true,
                                      fillColor: const Color(0xFFF1F0F0),
                                      suffixIcon: const Icon(Icons.person,
                                          color: Color(0xFF777777)),
                                      border: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Colors.transparent),
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Colors.transparent),
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 30),
                                SizedBox(
                                  width: 300,
                                  height: 60,
                                  child: TextField(
                                    textDirection: TextDirection.rtl,
                                    textAlign: TextAlign.right,
                                    obscureText: true,
                                    decoration: InputDecoration(
                                      // label: const Text("كلمة المرور",style: TextStyle(fontFamily: "Tajawal",
                                      //     color: Colors.grey),),
                                      hintText: "كلمة المرور",
                                      hintStyle: const TextStyle(fontFamily: "Tajawal", color: Colors.grey),
                                      filled: true,
                                      fillColor: const Color(0xFFF1F0F0),
                                      suffixIcon: const Icon(Icons.lock,
                                          color: Color(0xFF777777)),
                                      border: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Colors.transparent),
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Colors.transparent),
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 40),
                                SizedBox(
                                  width: 300,
                                  height: 50,
                                  child: ElevatedButton(
                                    style: ButtonStyle(
                                      backgroundColor:
                                      WidgetStateProperty.all(
                                        const Color(0xFFF59039),
                                      ),
                                    ),
                                    onPressed: () {},
                                    child: const Text(
                                      "تسجيل الدخول",
                                      style: TextStyle(
                                          color: Colors.white70, fontSize: 16,fontFamily: "Tajawal"),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 40),
                                const Text("أو",
                                    style: TextStyle(
                                        color: Color(0xFFD9D9D9),
                                        fontSize: 20,fontFamily: "Tajawal",)),
                                const SizedBox(height: 40),
                                SizedBox(
                                  width: 300,
                                  height: 50,
                                  child: ElevatedButton(
                                    style: ButtonStyle(
                                      backgroundColor: WidgetStateProperty.all(
                                        const Color(0xFFF1F0F0),
                                      ),
                                    ),
                                    onPressed: () {},
                                    child: const Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      textDirection: TextDirection.rtl,
                                      children: [
                                        SizedBox(width: 10),
                                        Text(
                                          "التسجيل باستخدام جوجل",
                                          style: TextStyle(
                                            color: Colors.black54,
                                            fontSize: 16,
                                            fontFamily: "Tajawal"
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
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
