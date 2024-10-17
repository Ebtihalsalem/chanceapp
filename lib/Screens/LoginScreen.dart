import 'package:flutter/material.dart';
import 'dart:ui';
import '../Core/App_theme.dart';
import '../TraineeScreens/Intersets.dart';
import '../UI Components/BuildText.dart';
import '../UI Components/Button.dart';
import '../UI Components/TextField.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final supabase = Supabase.instance.client;

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
                                textField("اسم المستخدم",Icons.person,50,300),
                                const SizedBox(height: 16),
                                textField("كلمة المرور",Icons.lock,50,300),
                                Align(
                                    alignment: Alignment.centerRight,
                                    child: TextButton(onPressed: (){}, child: buildText("نسيت كلمة المرور؟",
                                      10, FontWeight.bold,Color(0xFFF59039),
                                    ),)),
                                const SizedBox(height: 16,),
                                button("تسجيل الدخول",context,const IntersetsScreen(),null),
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
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    IconButton(onPressed: () async {
                                      await _googleSignIn(context);
                                      Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(builder: (context) => const IntersetsScreen()),
                                      );
                                    }, icon:
                                    Image.asset("lib/images/google1.png",
                                      height: 40,width: 40,),),
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
}

Future<void> _googleSignIn(BuildContext context ) async {
  const webClientId = '889566036592-3k6v89tb06mumcn17rsjur4koc7qgamg.apps.googleusercontent.com'; // استبدله بمعرف العميل الفعلي
  const androidClientId = '889566036592-1tcelvjvvc3avto767ogd6jh6cu0238i.apps.googleusercontent.com';


  final GoogleSignIn googleSignIn = GoogleSignIn(
    clientId: androidClientId,
    serverClientId: webClientId,
  );

  try {
    final googleUser = await googleSignIn.signIn();
    final googleAuth = await googleUser!.authentication;

    final accessToken = googleAuth.accessToken;
    final idToken = googleAuth.idToken;

    if (accessToken == null || idToken == null) {
      throw 'Missing tokens.';
    }

    final AuthResponse response = await supabase.auth.signInWithIdToken(
      provider: OAuthProvider.google,
      idToken: idToken,
      accessToken: accessToken,
    );

    // تحقق مما إذا كان تم تسجيل الدخول بنجاح
    if (response.user != null) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const IntersetsScreen(), // استبدله بشاشة الملف الشخصي الخاصة بك إذا لزم الأمر
        ),
      );
    }
  } catch (e) {
    print('Error during Google sign in: $e');
    // هنا يمكنك عرض رسالة خطأ للمستخدم
  }
}




