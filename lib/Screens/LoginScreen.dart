import 'package:flutter/material.dart';
import 'package:chanceapp/Screens/Intersets.dart';
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
              width: 600,
              height: 600,
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
                padding: const EdgeInsets.only(top: 120.0),
                child: Column(
                  children: [
                    Image.asset(
                      'lib/images/logo.png',
                      height: 119,
                      width: 120,
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
                    flex: 8,
                    child: SizedBox(height: 10),
                  ),
                  Expanded(
                    flex: 12,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(40.0),
                        topRight: Radius.circular(40.0),
                      ),
                        child: Container(
                          padding: const EdgeInsets.fromLTRB(50, 20, 50, 50),
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
                                width: 149,
                                color: Colors.grey,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top:40.0),
                                child: Form(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        width: 300,
                                        height: 60,
                                        child: TextField(
                                          textDirection: TextDirection.rtl,
                                          textAlign: TextAlign.right,
                                          decoration: InputDecoration(
                                            hintText: "اسم المستخدم",
                                            hintStyle: const TextStyle(fontFamily: "Tajawal", color: Color(0xFFBBBBBB)),
                                            filled: true,
                                            fillColor: const Color(0xFFF3F3F3),
                                            suffixIcon: const Icon(Icons.person,
                                                color: Color(0xFFBBBBBB)),
                                            border: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                  color: Color(0xFFBCBCBC)),
                                              borderRadius: BorderRadius.circular(30),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                  color: Color(0xFFBCBCBC)),
                                              borderRadius: BorderRadius.circular(30),
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 16),
                                      SizedBox(
                                        width: 300,
                                        height: 60,
                                        child: TextField(
                                          textDirection: TextDirection.rtl,
                                          textAlign: TextAlign.right,
                                          obscureText: true,
                                          decoration: InputDecoration(
                                            hintText: "كلمة المرور",
                                            hintStyle: const TextStyle(fontFamily: "Tajawal", color: Color(0xFFBBBBBB)),
                                            filled: true,
                                            fillColor: const Color(0xFFF3F3F3),
                                            suffixIcon: const Icon(Icons.lock,
                                                color: Color(0xFFBBBBBB)),
                                            border: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                  color: Color(0xFFBCBCBC)),
                                              borderRadius: BorderRadius.circular(30),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                  color: Color(0xFFBCBCBC)),
                                              borderRadius: BorderRadius.circular(30),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.centerRight,
                                        child: TextButton(onPressed: (){}, child: Text("نسيت كلمة المرور؟",style: TextStyle(
                                          fontSize: 10,color: Color(0xFFF59039), fontFamily: "Tajawal",
                                            fontWeight: FontWeight.bold
                                        ),)),
                                      ),
                                      SizedBox(height: 20,),
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
                                          onPressed: () {
                                            Navigator.of(context).push(
                                              MaterialPageRoute(builder: (context)=> IntersetsScreen())
                                            );
                                          },
                                          child: const Text(
                                            "تسجيل الدخول",
                                            style: TextStyle(
                                                color: Colors.white70, fontSize: 16,fontFamily: "Tajawal",
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 40),
                                      const Row(
                                        children: [
                                          Expanded(
                                            child: Divider(
                                              color: Color(0xFFBBBBBB),
                                              thickness: 1.0,
                                              endIndent: 10.0,
                                            ),
                                          ),
                                          Text(
                                            "أو",
                                            style: TextStyle(
                                              color: Color(0xFFBBBBBB),
                                              fontSize: 16,
                                              fontFamily: "Tajawal",
                                            ),
                                          ),
                                          Expanded(
                                            child: Divider(
                                              color: Color(0xFFBBBBBB),
                                              thickness: 1.0,
                                              indent: 10.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 40),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          IconButton(onPressed: (){}, icon:
                                           Image.asset("lib/images/google1.png",
                                             height: 40,width: 40,),),

                                          IconButton(onPressed: (){}, icon:
                                           Image.asset("lib/images/linkedin.png",
                                            height: 45,width: 45,),),
                                        ],
                                      ),

                                    ],
                                  ),
                                ),
                              )
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
