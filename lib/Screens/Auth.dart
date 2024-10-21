
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../UI Components/Snackbar.dart';
import 'TypeUser.dart';

void checkIfUserIsSignedIn(BuildContext context) {

  if (FirebaseAuth.instance.currentUser != null) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => TypeUser()),
    );
  }
}

Future<Object> signInWithGoogle(BuildContext context) async {

try {

  if (FirebaseAuth.instance.currentUser != null) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => TypeUser()),
    );
    return FirebaseAuth.instance.currentUser!;
  }


  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
  final GoogleSignInAuthentication? googleAuth = await googleUser
      ?.authentication;

  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );

  final userCredential = await FirebaseAuth.instance.signInWithCredential(credential);

print(userCredential.user?.email);
  print(userCredential.user?.displayName);

  Navigator.of(context).pushReplacement(
    MaterialPageRoute(builder: (context) => TypeUser()),
  );
  return userCredential;
} on SocketException{
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