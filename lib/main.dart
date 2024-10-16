import 'package:chanceapp/Core/App_theme.dart';
import 'package:chanceapp/Screens/LoginScreen.dart';
import 'package:chanceapp/Screens/TypeUser.dart';
import 'package:chanceapp/TraineeScreens/ChatsScreen.dart';
import 'package:chanceapp/TraineeScreens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'TraineeScreens/Steps.dart';
import 'TraineeScreens/TrianingDetils.dart';



void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: appTheme,
    home: const Steps(),
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




