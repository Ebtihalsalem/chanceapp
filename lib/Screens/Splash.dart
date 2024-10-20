import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:chanceapp/Screens/TypeUser.dart';

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
    SystemChrome.setEnabledSystemUIMode(
        SystemUiMode.manual, overlays: SystemUiOverlay.values);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Color(0xFFF59039), Color(0xFFF59039)
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
            // const Text("فرصتك في يدك", style: TextStyle(color: Colors.white70,fontFamily: "Tajawal",
            //     fontSize: 18,
            //     fontWeight: FontWeight.bold),),
          ],
        ),
      ),
    );
  }
}
