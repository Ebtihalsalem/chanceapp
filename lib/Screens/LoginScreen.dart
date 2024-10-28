import 'package:chanceapp/Screens/TypeUser.dart';
import 'package:chanceapp/TraineeScreens/StartedScreen.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import '../Core/App_theme.dart';
import '../TraineeScreens/Intersets.dart';
import '../UI Components/BuildText.dart';
import '../UI Components/Button.dart';
import '../UI Components/Snackbar.dart';
import '../UI Components/TextField.dart';


import 'Auth.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();

}

class _LoginscreenState extends State<Loginscreen> {
  bool isLoading = false;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

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
                            width: 149,
                            color: Colors.grey,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top:40.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                textField("البريد الالكتروني",Icons.email,50,300,emailController,false),
                                const SizedBox(height: 16),
                                textField("كلمة المرور",Icons.lock,50,300, passwordController,
                                  true,),
                                Align(
                                    alignment: Alignment.centerRight,
                                    child: TextButton(onPressed: (){}, child: buildText("نسيت كلمة المرور؟",
                                      10, FontWeight.bold,const Color(0xFFF59039),
                                    ),)),
                                const SizedBox(height: 16,),
                                button("تسجيل الدخول",context,const TypeUser(),null,handleLogin),
                                const SizedBox(height: 40),
                                Row(
                                  children: [
                                    const Expanded(
                                      child: Divider(
                                        color: Color(0xFFBBBBBB),
                                        thickness: 1.0,
                                        endIndent: 10.0,
                                      ),
                                    ),
                                    buildText(
                                      "أو",
                                      16,
                                      FontWeight.normal,
                                      const Color(0xFFBBBBBB),
                                    ),
                                    const Expanded(
                                      child: Divider(
                                        color: Color(0xFFBBBBBB),
                                        thickness: 1.0,
                                        indent: 10.0,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 40),
                                isLoading
                                    ? CircularProgressIndicator()
                                    : Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    IconButton(
                                      onPressed: () async {

                                        await signInWithGoogle(context);
                                      },
                                      icon: Image.asset(
                                        "lib/images/google1.png",
                                        height: 40,
                                        width: 40,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
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
  Future<void> handleLogin() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    print("email : $email");
    if (email.isEmpty || password.isEmpty) {
      showSnackBar(context, 'يرجى إدخال اسم المستخدم وكلمة المرور');
      return;
    }

    try {

      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      print("تم تسجيل الدخول بنجاح: ${credential.user?.email}");

      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const TypeUser()),
      );
    } on FirebaseAuthException catch (e) {

      if (e.code == 'user-not-found') {
        print('المستخدم غير موجود، سيتم إنشاء حساب جديد.');

        try {

          final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: email,
            password: password,
          );

          print("تم إنشاء الحساب بنجاح: ${credential.user?.email}");

          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const TypeUser()),
          );
        } on FirebaseAuthException catch (e) {
          if (e.code == 'weak-password') {
            showSnackBar(context,'The password provided is too weak.');
          } else if (e.code == 'email-already-in-use') {
            showSnackBar(context,'The account already exists for that email.');
          }
        } catch (e) {
          print(e);
        }
      } else if (e.code == 'wrong-password') {
        print('كلمة المرور المدخلة غير صحيحة.');
        showSnackBar(context, 'كلمة المرور المدخلة غير صحيحة.');
      } else {
        print(e);
      }
    } catch (e) {
      print(e);
    }
  }



}





