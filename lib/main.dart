import 'package:chanceapp/Screens/AddCv.dart';
import 'package:chanceapp/Screens/Intersets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'Screens/AddCv.dart';
import 'Screens/Splash.dart';
import 'Screens/Steps.dart';

void main() {
  runApp(const MaterialApp(
        debugShowCheckedModeBanner: false,
    home: Splash(),
    locale: const Locale('ar'),
    supportedLocales: const [
      Locale('ar'),
      Locale('en'),
    ],
    localizationsDelegates: const [
      GlobalMaterialLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
    ],
  ));
}




