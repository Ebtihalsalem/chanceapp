import 'package:flutter/material.dart';

import '../Core/App_theme.dart';
import '../UI Components/BuildText.dart';
import '../UI Components/CenterAppBar.dart';
import 'home.dart';

class AfterCv extends StatefulWidget {
  const AfterCv({super.key});

  @override
  State<AfterCv> createState() => _AfterCvState();
}

class _AfterCvState extends State<AfterCv> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: centerAppBar(context,"فرصتك في يدك"),
        body: Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
              children: [
            Image.asset(
              "lib/images/10739702.png",
              height: 280,
              width: 280,
            ),
            const SizedBox(height: 25,),
                buildTextTitle("عمل جيد !!",26,FontWeight.bold),
                const SizedBox(height: 20,),
                buildTextTitle("الان هل تريد انشاء نسخة كــ سيرة ذاتية مبدئية؟",
                15,FontWeight.normal),
                const SizedBox(height: 20,),
            SizedBox(
                width: 300,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                  ),
                  onPressed: () {},
                  child: buildText(
                    "نعم", 16,
                    FontWeight.normal,
                      const Color(0xFFFDFDFD)
                  ),
                ),
              ),
            const SizedBox(height: 16),
            Container(
              width: 300,
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(40),
                  border: Border.all(color: primaryColor)),
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => const HomeScreen())
                  );
                },
                child: buildText(
                  "تخطي", 16,FontWeight.bold,
                    primaryColor,
                ),
              ),
            ),
          ]),
        ));
  }
}

