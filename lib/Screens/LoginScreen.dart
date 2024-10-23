import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
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

import 'package:http/http.dart' as http;
import 'Auth.dart';

const String apiUrl = "http://192.168.1.15:8085/users/data_user";

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  bool isLoading = false;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  List<String> sliderImg = [
    "lib/images/Libyan-Spider2016-04.jpg",
    "lib/images/2148222637.jpg",
    "lib/images/2149930992.jpg",
    "lib/images/b79e7388224459.5dcfccf0a3a99.jpeg"
  ];

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Container(
            height: 3,
            width: 100,
            color: borderColor,
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(50, 40, 50, 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              textField("البريد الالكتروني", Icons.email, 50, 300,
                  emailController, false),
              const SizedBox(height: 16),
              textField(
                "كلمة المرور",
                Icons.lock,
                50,
                300,
                passwordController,
                true,
              ),
              Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: buildText(
                      "نسيت كلمة المرور؟",
                      10,
                      FontWeight.bold,
                      primaryColor,
                    ),
                  )),
              const SizedBox(
                height: 16,
              ),
              // button("تسجيل الدخول",context,const TypeUser(),null,handleLogin),
              SizedBox(
                width: 300,
                height: 50,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(
                      primaryColor,
                    ),
                  ),
                  onPressed: () async {
                    handleLogin();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Center(
                          child: buildText(
                            "تسجيل",
                            16,
                            FontWeight.bold,
                            backgroundColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
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
              const SizedBox(height: 30),
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
    );
    //                 ),
    //               ),
    //             ),
    //           ],
    //         ),
    //       ),
    //     ],
    //   ),
    //
    // );
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
      final userExists = await checkIfUserExists(email);

      print("Exists : $userExists");
      if (userExists) {
        print("المستخدم موجود، تسجيل الدخول");

        final credential =
            await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password,
        );

        print("تم تسجيل الدخول بنجاح: ${credential.user?.email}");

        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const TypeUser()),
        );
      } else {
        print("المستخدم غير موجود");
        showSnackBar(context, 'البريد الإلكتروني غير موجود');
        try {
          final credential =
              await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: email,
            password: password,
          );

          print("تم إنشاء الحساب بنجاح: ${credential.user?.email}");

          await sendUserData(email, credential.user?.displayName ?? '');

          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const TypeUser()),
          );
        } on FirebaseAuthException catch (e) {
          if (e.code == 'weak-password') {
            showSnackBar(context, 'كلمة المرور ضعيفة.');
          } else if (e.code == 'email-already-in-use') {
            showSnackBar(context, 'الحساب موجود بالفعل');
          }
        } catch (e) {
          print(e);
        }
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        showSnackBar(context, 'الحساب غير موجود لهذا البريد الإلكتروني');
      } else if (e.code == 'wrong-password') {
        showSnackBar(context, 'كلمة المرور غير صحيحة');
      }
    } catch (e) {
      print(e);
    }
  }
}


Future<bool> checkIfUserExists(String email) async {
  print("إرسال الطلب للتحقق من وجود المستخدم");

  try {
    final response = await http.post(
      Uri.parse("http://192.168.1.15:8085/users/check_user"),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'email': email}),
    );

    print("Response status: ${response.statusCode}");
    print("Response body: ${response.body}");

    if (response.statusCode == 200) {
      return true;
    } else {
      print("خطأ في فحص المستخدم: ${response.body}");
      return false;
    }
  } catch (e) {
    print("خطأ في فحص البريد الإلكتروني: $e");
    return false;
  }
}

Future<void> sendUserData(String email, String name) async {
  final userData = {
    'email': email,
    'name': name,
  };
  print("Email: $email, name:$name");

  try {

    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode(userData),
    );

    if (response.statusCode == 201) {
      print("تم إرسال بيانات المستخدم بنجاح");
    } else {
      print("فشل إرسال بيانات المستخدم: ${response.body}");
    }
  } catch (e) {
    print("خطأ في إرسال البيانات: $e");
  }

  // Future<void> handleLogin() async {
  //   final email = emailController.text.trim();
  //   final password = passwordController.text.trim();
  //
  //   if (email.isEmpty || password.isEmpty) {
  //     showSnackBar(context, 'يرجى إدخال اسم المستخدم وكلمة المرور');
  //     return;
  //   }
  //
  //   // تحقق من وجود المستخدم في MongoDB
  //   final response = await http.post(
  //     Uri.parse('https://your-api-url.com/checkUser'), // استبدل بالـ API الخاصة بك
  //     body: jsonEncode({
  //       'email': email,
  //     }),
  //     headers: {
  //       'Content-Type': 'application/json',
  //     },
  //   );
  //
  //   if (response.statusCode == 200) {
  //     final data = jsonDecode(response.body);
  //
  //     if (data['exists'] == true) {
  //       // المستخدم موجود، قم بتسجيل الدخول
  //       try {
  //         final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
  //           email: email,
  //           password: password,
  //         );
  //
  //         print("تم تسجيل الدخول بنجاح: ${credential.user?.email}");
  //         Navigator.of(context).pushReplacement(
  //           MaterialPageRoute(builder: (context) => const TypeUser()),
  //         );
  //       } on FirebaseAuthException catch (e) {
  //         if (e.code == 'wrong-password') {
  //           showSnackBar(context, 'كلمة المرور المدخلة غير صحيحة.');
  //         } else {
  //           print(e);
  //         }
  //       }
  //     } else {
  //       // المستخدم غير موجود، قم بإنشاء حساب جديد
  //       try {
  //         final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
  //           email: email,
  //           password: password,
  //         );
  //
  //         print("تم إنشاء الحساب بنجاح: ${credential.user?.email}");
  //         Navigator.of(context).pushReplacement(
  //           MaterialPageRoute(builder: (context) => const TypeUser()),
  //         );
  //       } on FirebaseAuthException catch (e) {
  //         if (e.code == 'weak-password') {
  //           showSnackBar(context, 'The password provided is too weak.');
  //         } else if (e.code == 'email-already-in-use') {
  //           showSnackBar(context, 'The account already exists for that email.');
  //         }
  //       } catch (e) {
  //         print(e);
  //       }
  //     }
  //   } else {
  //     showSnackBar(context, 'حدث خطأ أثناء التحقق من البريد الإلكتروني.');
  //   }
  // }
}
