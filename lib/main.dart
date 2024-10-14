import 'package:chanceapp/Screens/ChatsScreen.dart';
import 'package:chanceapp/Screens/NotifationScreen.dart';
import 'package:chanceapp/Screens/TrackingScreen.dart';
import 'package:chanceapp/Screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: "Tajawal", // الخط المستخدم
        ),
    home: const TrackingScreen(),
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




