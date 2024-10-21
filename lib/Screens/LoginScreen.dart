import 'package:chanceapp/Screens/TypeUser.dart';
import 'package:chanceapp/TraineeScreens/StartedScreen.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
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
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      checkIfUserIsSignedIn(context);
    });
  }


  @override
  void dispose() {
    usernameController.dispose();
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
                                textField("اسم المستخدم",Icons.person,50,300,usernameController,false),
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
                                      Color(0xFFBBBBBB),
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

  void handleLogin() {
    final username = usernameController.text.trim();
    final password = passwordController.text.trim();



    print("username : $username");
    if (username.isEmpty || password.isEmpty) {
      showSnackBar(context, 'يرجى إدخال اسم المستخدم وكلمة المرور');
      return;
    }

    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const TypeUser()),
    );
  }


  // Future<void> _googleSignIn(BuildContext context ) async {
  //
  //   setState(() {
  //     isLoading = true;
  //   });
  //
  //
  //   const webClientId = '889566036592-3k6v89tb06mumcn17rsjur4koc7qgamg.apps.googleusercontent.com'; // استبدله بمعرف العميل الفعلي
  //   const androidClientId = '889566036592-1tcelvjvvc3avto767ogd6jh6cu0238i.apps.googleusercontent.com';
  //
  //
  //   final GoogleSignIn googleSignIn = GoogleSignIn(
  //     clientId: androidClientId,
  //     serverClientId: webClientId,
  //   );
  //
  //   try {
  //     final googleUser = await googleSignIn.signIn();
  //     if (googleUser == null) {
  //       showSnackBar(context, 'تم إلغاء تسجيل الدخول بواسطة المستخدم.');
  //       setState(() {
  //         isLoading = false;
  //       });
  //       return;
  //     }
  //     final googleAuth = await googleUser!.authentication;
  //
  //     final accessToken = googleAuth.accessToken;
  //     final idToken = googleAuth.idToken;
  //
  //     if (accessToken == null || idToken == null) {
  //       throw 'لم يتم الحصول على رموز الدخول.';
  //     }
  //
  //     final AuthResponse response = await supabase.auth.signInWithIdToken(
  //       provider: OAuthProvider.google,
  //       idToken: idToken,
  //       accessToken: accessToken,
  //     );
  //
  //     print('Response: ${response.user}');
  //     if (response.user != null) {
  //       Navigator.of(context).pushReplacement(
  //         MaterialPageRoute(
  //           builder: (context) => const TypeUser(),
  //         ),
  //       );
  //     } else {
  //       showSnackBar(context, 'فشل تسجيل الدخول. الرجاء المحاولة مرة أخرى.');
  //     }
  //   } catch (e) {
  //     showSnackBar(context, 'حدث خطأ أثناء تسجيل الدخول ');
  //     print(e);
  //   } finally {
  //     setState(() {
  //       isLoading = false;
  //     });
  //   }
  // }


}





