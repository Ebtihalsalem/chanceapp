import 'package:chanceapp/Screens/LoginScreen.dart';
import 'package:chanceapp/Screens/TypeUser.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../Core/App_theme.dart';


class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    Future.delayed(const Duration(seconds: 10), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const TypeUser())
      );
    });
  }

  @override
  void dispose() {
    super.dispose();
    SystemChrome.setEnabledSystemUIMode(
        SystemUiMode.manual, overlays: SystemUiOverlay.values);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            primaryColor, const Color(0xFFEA590C)
          ],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(13.0),
              child: Image.asset("lib/images/logo white.png", height: 90, width: 90,),
            ),

          ],
        ),
      ),
    );
  }
}
