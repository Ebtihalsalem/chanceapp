import 'package:chanceapp/Screens/AddProfile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'Screens/AddProfile.dart';
import 'Screens/Steps.dart';

void main() {
  runApp(const MaterialApp(
        debugShowCheckedModeBanner: false,
    home: Steps(),
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


