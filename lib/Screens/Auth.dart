import 'dart:convert';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import '../CompanyScreens/ProfileCompany.dart';
import '../TraineeScreens/Steps.dart';
import '../UI Components/Snackbar.dart';
import 'LoginScreen.dart';
import 'TypeUser.dart';



Future<Object> signInWithGoogle(BuildContext context, bool isCompany) async {
  try {
    // if (FirebaseAuth.instance.currentUser != null) {
    //   Navigator.of(context).pushReplacement(
    //     MaterialPageRoute(builder: (context) => TypeUser()),
    //   );
    //   return FirebaseAuth.instance.currentUser!;
    // }


    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth = await googleUser
        ?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    final userCredential = await FirebaseAuth.instance.signInWithCredential(
        credential);

    await sendUserData(context,(userCredential.user!.email).toString(),
        (userCredential.user!.displayName).toString(),isCompany);

    print(userCredential.user?.email);
    print(userCredential.user?.displayName);
    print(userCredential.user?.photoURL);

    emailGeneral = userCredential.user!.email!;
urlPhoto = userCredential.user?.photoURL ?? "لا توجد صوره";
name = userCredential.user!.displayName!;


    return userCredential;
  } on SocketException {
    showSnackBar(context, 'لا يتوفر انترنت', isError: true);
    print(" soket");
    return false;
  }
  catch (e) {
    showSnackBar(context, 'فشل تسجيل الدخول ', isError: true);
    print(" catch $e");
    return false;
  }
}


Future<void> sendUserData(BuildContext context,String email, String name,bool isCompany) async {
  final userData = {
    'email': email,
    'name': name,
  };
  print("Email: $email, name:$name");

  try {
    final response = await http.post(
      isCompany?
      Uri.parse('http://192.168.88.42:8085/companies/data_user'):
      Uri.parse('http://192.168.88.42:8085/users/data_user'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode(userData),
    );

    if (response.statusCode == 201) {
      print("تم إرسال بيانات المستخدم بنجاح");

      isCompany?
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => ProfileCompany(urlPhoto, email: email)),
      ) :  Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => Steps()));
    } else {
      print("فشل إرسال بيانات المستخدم: ${response.body}");
    }
  } catch (e) {
    print("خطأ في إرسال البيانات: $e");
  }
}
