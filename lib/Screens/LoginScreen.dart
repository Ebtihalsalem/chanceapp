import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:chanceapp/CompanyScreens/HomeScreen.dart';
import 'package:chanceapp/CompanyScreens/ProfileCompany.dart';
import 'package:chanceapp/Screens/TypeUser.dart';
import 'package:chanceapp/TraineeScreens/StartedScreen.dart';
import 'package:chanceapp/TraineeScreens/home.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import '../Core/App_theme.dart';
import '../TraineeScreens/Intersets.dart';
import '../TraineeScreens/Steps.dart';
import '../UI Components/BuildText.dart';
import '../UI Components/Button.dart';
import '../UI Components/Snackbar.dart';
import '../UI Components/TextField.dart';
import 'package:http/http.dart' as http;
import 'Auth.dart';

late String emailGeneral;
String urlPhoto = "توجد صورة";
late String name;
class Loginscreen extends StatefulWidget {
  final bool isCompany;
  const Loginscreen({super.key,required this.isCompany});

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
                      setState(() { isLoading = true; });
                      await handleLogin();
                      setState(() { isLoading = false; });
                  },
                  child: isLoading
                      ? CircularProgressIndicator():
                  Row(
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
                            await signInWithGoogle(context,widget.isCompany);
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

        try {
          final credential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: email,
            password: password,
          );
          print("photo : ${credential.user?.photoURL}");
          print("تم تسجيل الدخول بنجاح: ${credential.user?.email}");

          emailGeneral = email;
          urlPhoto = credential.user?.photoURL ?? "";
          name = credential.user?.displayName ?? "";

          widget.isCompany
              ? Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => CHomeScreen()),
          )
              : Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => HomeScreen()));
        } on FirebaseAuthException catch (e) {
          if (e.code == 'invalid-credential') {
            showSnackBar(context, 'كلمة المرور غير صحيحة',isError: true);
          } else {
            print(" كود الخطأ $e.code");
            showSnackBar(context, 'حدث خطأ أثناء تسجيل الدخول: ${e.message}',isError: true);
          }
        }
      } else {
        print("المستخدم غير موجود");
        try {
          final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: email,
            password: password,
          );

          print("تم إنشاء الحساب بنجاح: ${credential.user?.email}");

          await sendUserData(email, credential.user?.displayName ?? "");

          emailGeneral = email;
          urlPhoto = credential.user?.photoURL ?? "";
          name = credential.user?.displayName ?? "";

          widget.isCompany
              ? Navigator.of(context).pushReplacement(
            MaterialPageRoute(
                builder: (context) =>
                    ProfileCompany(urlPhoto, email: emailGeneral)),
          )
              : Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => Steps()));
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
        showSnackBar(context, 'الحساب غير موجود لهذا البريد الإلكتروني',isError: true);
      }
    } catch (e) {
      print(e);
    }
  }

    Future<bool> checkIfUserExists(String email) async {
    print("إرسال الطلب للتحقق من وجود المستخدم ");

    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      print("المستخدم موجود ");
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print("المستخدم غير موجود");
        return false;
      } else {
        print("خطأ غير متوقع: ${e.message}");
        return false;
      }
    } catch (e) {
      print("خطأ في فحص البريد الإلكتروني: $e");
      return false;
    }
  }
  //
  // Future<bool> checkIfUserExists(String email) async {
  //   print("إرسال الطلب للتحقق من وجود المستخدم");
  //
  //   try {
  //     final response = await http.post(
  //       widget.isCompany?
  //       Uri.parse("http://192.168.1.4:8085/companies/check_user")
  //       : Uri.parse("http://192.168.1.4:8085/users/check_user"),
  //
  //       headers: {'Content-Type': 'application/json'},
  //       body: json.encode({'email': email}),
  //     );
  //
  //     print("Response status: ${response.statusCode}");
  //     print("Response body: ${response.body}");
  //
  //     if (response.statusCode == 200) {
  //       return true;
  //     } else {
  //       print("خطأ في فحص المستخدم: ${response.body}");
  //       return false;
  //     }
  //   } catch (e) {
  //     print("خطأ في فحص البريد الإلكتروني: $e");
  //     return false;
  //   }
  // }

  Future<void> sendUserData(String email, String name) async {
    final userData = {
      'email': email,
      'name': name,
    };
    print("Email: $email, name:$name");

    try {

      final response = await http.post(
        widget.isCompany?
        Uri.parse("http://192.168.88.42:8085/companies/data_user"):
        Uri.parse("http://192.168.88.42:8085/users/data_user"),

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

  }

}
