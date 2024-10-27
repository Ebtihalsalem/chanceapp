// import 'package:flutter/material.dart';
//
// import '../Core/App_theme.dart';
// import '../UI Components/BuildText.dart';
// import '../UI Components/CenterAppBar.dart';
// import 'home.dart';
//
// class AfterCv extends StatefulWidget {
//   const AfterCv({super.key});
//
//   @override
//   State<AfterCv> createState() => _AfterCvState();
// }
//
// class _AfterCvState extends State<AfterCv> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: centerAppBar(context,"فرصتك في يدك"),
//         body: Align(
//           alignment: Alignment.center,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//             Image.asset(
//               "lib/images/10739702.png",
//               height: 280,
//               width: 280,
//             ),
//             const SizedBox(height: 25,),
//                 buildTextTitle("عمل جيد !!",26,FontWeight.bold),
//                 const SizedBox(height: 20,),
//                 buildTextTitle("الان هل تريد انشاء نسخة كــ سيرة ذاتية مبدئية؟",
//                 15,FontWeight.normal),
//                 const SizedBox(height: 20,),
//             SizedBox(
//                 width: 300,
//                 height: 50,
//                 child: ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: const Color(0xFFF59039),
//                   ),
//                   onPressed: () {},
//                   child: buildText(
//                     "نعم", 16,
//                     FontWeight.normal,
//                       const Color(0xFFFDFDFD)
//                   ),
//                 ),
//               ),
//             const SizedBox(height: 16),
//             Container(
//               width: 300,
//               height: 50,
//               decoration: BoxDecoration(
//                   color: Colors.transparent,
//                   borderRadius: BorderRadius.circular(40),
//                   border: Border.all(color: const Color(0xFFF59039))),
//               child: TextButton(
//                 onPressed: () {
//                   Navigator.of(context).pushReplacement(
//                       MaterialPageRoute(builder: (context) => const HomeScreen())
//                   );
//                 },
//                 child: buildText(
//                   "تخطي", 16,FontWeight.bold,
//                     secondaryColor,
//                 ),
//               ),
//             ),
//           ]),
//         ));
//   }
// }
//


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
      appBar: centerAppBar(context, "فرصتك في يدك"),
      body: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildImage(),
            const SizedBox(height: 25),
            buildTitleText(),
            const SizedBox(height: 20),
            buildDescriptionText(),
            const SizedBox(height: 20),
            buildYesButton(context),
            const SizedBox(height: 16),
            buildSkipButton(context),
          ],
        ),
      ),
    );
  }

  Widget buildImage() {
    return Image.asset(
      "lib/images/10739702.png",
      height: 280,
      width: 280,
    );
  }

  Widget buildTitleText() {
    return buildTextTitle("عمل جيد !!", 26, FontWeight.bold);
  }

  Widget buildDescriptionText() {
    return buildTextTitle(
        "الان هل تريد انشاء نسخة كــ سيرة ذاتية مبدئية؟", 15, FontWeight.normal);
  }

  Widget buildYesButton(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFF59039),
        ),
        onPressed: () {
          showConfirmationDialog(
              context,
              "تأكيد",
              "سيتم تخزين البيانات ووضعها في الملف الشخصي. هل تريد المتابعة؟",
              onConfirmed: () {
                // غلق الـ Dialog بعد الموافقة
                Navigator.of(context).pop();

                // // إظهار رسالة تأكيد نجاح التخزين
                // ScaffoldMessenger.of(context).showSnackBar(
                //   const SnackBar(content: Text("تم تخزين البيانات بنجاح")),
                // );

                // الانتقال إلى الشاشة الرئيسية
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => const HomeScreen())
                );
              }
          );
        },
        child: buildText("نعم", 16, FontWeight.normal, const Color(0xFFFDFDFD)),

      ),
    );
  }

  Widget buildSkipButton(BuildContext context) {
    return Container(
      width: 300,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(40),
        border: Border.all(color: const Color(0xFFF59039)),
      ),
      child: TextButton(
        onPressed: () {
          showConfirmationDialog(
              context,
              "تأكيد",
              "لم يتم وضع البيانات في الملف الشخصي. هل تريد المتابعة؟",
              onConfirmed: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => const HomeScreen())
                );
              }
          );
        },
        child: buildText("تخطي", 16, FontWeight.bold, secondaryColor),
      ),
    );
  }

  void showConfirmationDialog(
      BuildContext context, String title, String content,
      {required VoidCallback onConfirmed}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            title,
            style: const TextStyle(
              color: Color(0xFFF59039), // اللون البرتقالي
              fontWeight: FontWeight.bold, // تغليظ النص
            ),
          ),
          content: Text(content),
          actions: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), // حواف غير حادة
                color: Colors.transparent,
                border: Border.all(color: const Color(0xFFF59039)),
              ),
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // إلغاء العملية وغلق الـ Dialog
                },
                child: const Text(
                  "إلغاء",
                  style: TextStyle(
                    color:const Color(0xFFF59039), // اللون الافتراضي للنص
                  ),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), // حواف غير حادة
                color: const Color(0xFFF59039), // اللون البرتقالي للخلفية
              ),
              child: TextButton(
                onPressed: onConfirmed,
                child: const Text(
                  "موافق",
                  style: TextStyle(
                    color: Colors.white, // النص بلون أبيض
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
