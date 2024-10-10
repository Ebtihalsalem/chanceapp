import 'package:chanceapp/Screens/AddCv.dart';
import 'package:chanceapp/Screens/AfterCv.dart';
import 'package:chanceapp/Screens/CvScreen.dart';
import 'package:chanceapp/Screens/Intersets.dart';
import 'package:chanceapp/Screens/LoginScreen.dart';
import 'package:chanceapp/Screens/MyTraining.dart';
import 'package:chanceapp/Screens/TypeUser.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'Screens/AddCv.dart';
import 'Screens/MyAccount.dart';
import 'Screens/Splash.dart';
import 'Screens/Steps.dart';
import 'Screens/home.dart';

void main() {
  runApp( const MaterialApp(
        debugShowCheckedModeBanner: false,

    home: CvScreen(),
    locale: Locale('ar'),
    supportedLocales: [
      Locale('ar'),
      Locale('en'),
    ],
    localizationsDelegates: [
      GlobalMaterialLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
    ],
  ));
}




