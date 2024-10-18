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
import 'package:chanceapp/Screens/Bouquets.dart';
import 'package:chanceapp/Screens/yourPlan.dart';
import 'package:chanceapp/TraineeScreens/Intersets.dart';
import 'package:chanceapp/TraineeScreens/MyAccount.dart';
import 'package:chanceapp/TraineeScreens/MyTraining.dart';
import 'package:chanceapp/TraineeScreens/NotifationScreen.dart';
import 'package:chanceapp/TraineeScreens/SavedScreen.dart';
import 'package:chanceapp/TraineeScreens/StartedScreen.dart';
import 'package:chanceapp/TraineeScreens/TrackingScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:chanceapp/Core/App_theme.dart';
import 'package:chanceapp/Screens/LoginScreen.dart';
import 'package:chanceapp/Screens/TypeUser.dart';
import 'package:chanceapp/TraineeScreens/ChatsScreen.dart';
import 'package:chanceapp/TraineeScreens/home.dart';
import 'TraineeScreens/Steps.dart';
import 'TraineeScreens/TrianingDetils.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Supabase
  await Supabase.initialize(
    url: 'https://pgnmyytyclxxmxwycljm.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InBnbm15eXR5Y2x4eG14d3ljbGptIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MjkxNjc2NjEsImV4cCI6MjA0NDc0MzY2MX0.iO7eESyetiaWjG8ZKtMDGg3Nvvi_xYY1srcb_SkvU7s',
  );

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      home: const Bouquets(),
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
