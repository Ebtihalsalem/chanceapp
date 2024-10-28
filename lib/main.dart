// import 'package:chanceapp/Core/App_theme.dart';
// import 'package:chanceapp/Screens/LoginScreen.dart';
// import 'package:chanceapp/TraineeScreens/ChatsScreen.dart';
// import 'package:chanceapp/TraineeScreens/CompanyScreen.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_localizations/flutter_localizations.dart';
//
// import 'TraineeScreens/CvScreen.dart';
//
// void main() {
//   WidgetsFlutterBinding.ensureInitialized();
//   runApp(
//       MaterialApp(
//         debugShowCheckedModeBanner: false,
//         theme: appTheme,
//     home: const Loginscreen(),
//     locale: const Locale('ar'),
//     supportedLocales: const [
//       Locale('ar'),
//       Locale('en'),
//     ],
//     localizationsDelegates: const [
//       GlobalMaterialLocalizations.delegate,
//       GlobalCupertinoLocalizations.delegate,
//       GlobalWidgetsLocalizations.delegate,
//     ],
//   ));
// }
import 'package:chanceapp/CompanyScreens/AddTraining.dart';
import 'package:chanceapp/CompanyScreens/CompanyMyProfile.dart';
import 'package:chanceapp/CompanyScreens/DoneScreen.dart';
import 'package:chanceapp/CompanyScreens/HomeScreen.dart';
import 'package:chanceapp/CompanyScreens/ProfileCompany.dart';
import 'package:chanceapp/CompanyScreens/TraineeProfile.dart';
import 'package:chanceapp/CompanyScreens/TrainingDetails.dart';
import 'package:chanceapp/CompanyScreens/TrainingScreen.dart';
import 'package:chanceapp/Screens/Bouquets.dart';
import 'package:chanceapp/Screens/IntroScreen.dart';
import 'package:chanceapp/Screens/PayScreen.dart';
import 'package:chanceapp/Screens/yourPlan.dart';
import 'package:chanceapp/TraineeScreens/CompanyScreen.dart';
import 'package:chanceapp/TraineeScreens/CvScreen.dart';
import 'package:chanceapp/TraineeScreens/Intersets.dart';
import 'package:chanceapp/TraineeScreens/MessageScreen.dart';
import 'package:chanceapp/TraineeScreens/MyAccount.dart';
import 'package:chanceapp/TraineeScreens/MyTraining.dart';
import 'package:chanceapp/TraineeScreens/NotifationScreen.dart';
import 'package:chanceapp/TraineeScreens/SavedScreen.dart';
import 'package:chanceapp/TraineeScreens/StartedScreen.dart';
import 'package:chanceapp/TraineeScreens/TrackingScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:chanceapp/Core/App_theme.dart';
import 'package:chanceapp/Screens/LoginScreen.dart';
import 'package:chanceapp/Screens/TypeUser.dart';
import 'package:chanceapp/TraineeScreens/ChatsScreen.dart';
import 'package:chanceapp/TraineeScreens/home.dart';
import 'TraineeScreens/ReqScreen.dart';
import 'TraineeScreens/Steps.dart';
import 'TraineeScreens/TrianingDetils.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(

  );

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      home: FirebaseAuth.instance.currentUser == null ? const Steps():const Steps(),
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
    ),
  );
}
