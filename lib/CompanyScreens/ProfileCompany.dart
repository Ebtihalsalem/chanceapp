import 'package:flutter/material.dart';

class ProfileCompany extends StatefulWidget {
  const ProfileCompany({super.key});

  @override
  State<ProfileCompany> createState() => _ProfileCompanyState();
}

class _ProfileCompanyState extends State<ProfileCompany> {
  int currentStep = 0;

  @override
  Widget build(BuildContext context) {
    Color backgroundColor = const Color(0xFFF5F5F5);

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "lib/images/logo.png",
                height: 20,
                width: 20,
              ),
              const SizedBox(
                width: 10,
              ),
              const Text("الملف الشخصي",
                  style: TextStyle(
                      fontFamily: "Tajawal",
                      fontSize: 20,
                      color: Color(0xFF4A4C4D),
                      fontWeight: FontWeight.bold)),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 40.0),
          child: Container(
            color: const Color(0xffEAEAEA),
            child: Theme(
              data: ThemeData(
                colorScheme: const ColorScheme.light(
                  primary: Color(0xFFF59039),
                ),
              ),
              child: Container(
                color: backgroundColor,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                height: 125,
                                width: 125,
                                decoration: BoxDecoration(
                                  color: const Color(0xFFE7E7E7),
                                  borderRadius: BorderRadius.circular(80),
                                ),
                              ),
                              Image.asset(
                                "lib/images/ion_camera.png",
                                height: 50,
                                width: 50,
                              )
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Column(
                        children: [
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsets.only(bottom: 8.0, right: 20),
                                child: Text(
                                  "الاسم",
                                  style: TextStyle(
                                      fontFamily: "Tajawal",
                                      color: Color(0xFF4A4C4D),
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 320,
                            height: 50,
                            child: TextField(
                              textDirection: TextDirection.rtl,
                              textAlign: TextAlign.right,
                              decoration: InputDecoration(
                                hintText: "الاسم",
                                hintStyle: const TextStyle(
                                    fontFamily: "Tajawal",
                                    color: Color(0xFFBBBBBB)),
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Color(0xFFBCBCBC)),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Color(0xFFBCBCBC)),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsets.only(bottom: 8.0, right: 20),
                                child: Text(
                                  "الايميل",
                                  style: TextStyle(
                                      fontFamily: "Tajawal",
                                      color: Color(0xFF4A4C4D),
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 320,
                            height: 50,
                            child: TextField(
                              textDirection: TextDirection.rtl,
                              textAlign: TextAlign.right,
                              decoration: InputDecoration(
                                hintText: "example@gmail.com",
                                hintStyle: const TextStyle(
                                    fontFamily: "Tajawal",
                                    color: Color(0xFFBBBBBB)),
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Color(0xFFBCBCBC)),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Color(0xFFBCBCBC)),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsets.only(bottom: 8.0, right: 20),
                                child: Text(
                                  "رقم الهاتف",
                                  style: TextStyle(
                                      fontFamily: "Tajawal",
                                      color: Color(0xFF4A4C4D),
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 320,
                            height: 50,
                            child: TextField(
                              textAlign: TextAlign.right,
                              decoration: InputDecoration(
                                hintText: "0000000 218+ ",
                                hintStyle: const TextStyle(
                                    fontFamily: "Tajawal",
                                    color: Color(0xFFBBBBBB)),
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Color(0xFFBCBCBC)),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Color(0xFFBCBCBC)),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsets.only(bottom: 8.0, right: 20),
                                child: Text(
                                  "تاريخ التأسيس",
                                  style: TextStyle(
                                      fontFamily: "Tajawal",
                                      color: Color(0xFF4A4C4D),
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 320,
                            height: 50,
                            child: TextField(
                              textDirection: TextDirection.rtl,
                              textAlign: TextAlign.right,
                              decoration: InputDecoration(
                                hintText: "0000/00/00",
                                hintStyle: const TextStyle(
                                    fontFamily: "Tajawal",
                                    color: Color(0xFFBBBBBB)),
                                filled: true,
                                fillColor: Colors.white,
                                suffixIcon: const Icon(
                                    Icons.calendar_month_sharp,
                                    color: Color(0xFFBBBBBB)),
                                border: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Color(0xFFBCBCBC)),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Color(0xFFBCBCBC)),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsets.only(bottom: 8.0, right: 20),
                                child: Text(
                                  "المقر الرئيسي",
                                  style: TextStyle(
                                      fontFamily: "Tajawal",
                                      color: Color(0xFF4A4C4D),
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 320,
                            height: 50,
                            child: TextField(
                              textDirection: TextDirection.rtl,
                              textAlign: TextAlign.right,
                              decoration: InputDecoration(
                                hintText: "اسم المدينة",
                                hintStyle: const TextStyle(
                                    fontFamily: "Tajawal",
                                    color: Color(0xFFBBBBBB)),
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Color(0xFFBCBCBC)),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Color(0xFFBCBCBC)),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsets.only(bottom: 8.0, right: 20),
                                child: Text(
                                  "عنوان المقر",
                                  style: TextStyle(
                                      fontFamily: "Tajawal",
                                      color: Color(0xFF4A4C4D),
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 320,
                            height: 50,
                            child: TextField(
                              textDirection: TextDirection.rtl,
                              textAlign: TextAlign.right,
                              decoration: InputDecoration(
                                hintText: "المنطقة - الشارع",
                                hintStyle: const TextStyle(
                                    fontFamily: "Tajawal",
                                    color: Color(0xFFBBBBBB)),
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Color(0xFFBCBCBC)),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Color(0xFFBCBCBC)),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 16,),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                EdgeInsets.only(bottom: 8.0, right: 20),
                                child: Text(
                                  "المجال",
                                  style: TextStyle(
                                      fontFamily: "Tajawal",
                                      color: Color(0xFF4A4C4D),
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 320,
                            height: 50,
                            child: TextField(
                              textDirection: TextDirection.rtl,
                              textAlign: TextAlign.right,
                              decoration: InputDecoration(
                                hintText: "اسم المجال..",
                                hintStyle: const TextStyle(
                                    fontFamily: "Tajawal",
                                    color: Color(0xFFBBBBBB)),
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Color(0xFFBCBCBC)),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Color(0xFFBCBCBC)),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 16,),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                EdgeInsets.only(bottom: 8.0, right: 20),
                                child: Text(
                                  "حجم الشركة",
                                  style: TextStyle(
                                      fontFamily: "Tajawal",
                                      color: Color(0xFF4A4C4D),
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 320,
                            height: 50,
                            child: TextField(
                              textDirection: TextDirection.rtl,
                              textAlign: TextAlign.right,
                              decoration: InputDecoration(
                                hintText: "عدد الموظفين",
                                hintStyle: const TextStyle(
                                    fontFamily: "Tajawal",
                                    color: Color(0xFFBBBBBB)),
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Color(0xFFBCBCBC)),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Color(0xFFBCBCBC)),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 16,),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                EdgeInsets.only(bottom: 8.0, right: 20),
                                child: Text(
                                  "الموقع",
                                  style: TextStyle(
                                      fontFamily: "Tajawal",
                                      color: Color(0xFF4A4C4D),
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 320,
                            height: 50,
                            child: TextField(
                              textDirection: TextDirection.rtl,
                              textAlign: TextAlign.right,
                              decoration: InputDecoration(
                                hintText: "https://example",
                                hintStyle: const TextStyle(
                                    fontFamily: "Tajawal",
                                    color: Color(0xFFBBBBBB)),
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Color(0xFFBCBCBC)),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Color(0xFFBCBCBC)),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 16,),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                EdgeInsets.only(bottom: 8.0, right: 20),
                                child: Text(
                                  "نوع الشركة",
                                  style: TextStyle(
                                      fontFamily: "Tajawal",
                                      color: Color(0xFF4A4C4D),
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 320,
                            height: 50,
                            child: TextField(
                              textDirection: TextDirection.rtl,
                              textAlign: TextAlign.right,
                              decoration: InputDecoration(
                                hintText: "عامة/خاصة",
                                hintStyle: const TextStyle(
                                    fontFamily: "Tajawal",
                                    color: Color(0xFFBBBBBB)),
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Color(0xFFBCBCBC)),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Color(0xFFBCBCBC)),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 16,),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                EdgeInsets.only(bottom: 8.0, right: 20),
                                child: Text(
                                  "التخصص",
                                  style: TextStyle(
                                      fontFamily: "Tajawal",
                                      color: Color(0xFF4A4C4D),
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 320,
                            height: 50,
                            child: TextField(
                              textDirection: TextDirection.rtl,
                              textAlign: TextAlign.right,
                              decoration: InputDecoration(
                                hintText: "اكتب التخصصات..",
                                hintStyle: const TextStyle(
                                    fontFamily: "Tajawal",
                                    color: Color(0xFFBBBBBB)),
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Color(0xFFBCBCBC)),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Color(0xFFBCBCBC)),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 16,),
                          Column(
                            children: [
                              const Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding:
                                        EdgeInsets.only(bottom: 8.0, right: 20),
                                    child: Text(
                                      "ملخص عن الشركة",
                                      style: TextStyle(
                                          fontFamily: "Tajawal",
                                          color: Color(0xFF4A4C4D),
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),

                              SizedBox(
                                width: 320,
                                height: 50,
                                child: TextField(
                                  textDirection: TextDirection.rtl,
                                  textAlign: TextAlign.right,
                                  decoration: InputDecoration(
                                    hintText: "اكتب ملخص عن شركتك.. ",
                                    hintStyle: const TextStyle(
                                        fontFamily: "Tajawal",
                                        fontSize: 15,
                                        color: Color(0xFFBBBBBB)),
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Color(0xFFBCBCBC)),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Color(0xFFBCBCBC)),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                  ),
                                ),
                              ),

                            ],
                          ),
                          const SizedBox(height: 26),
                  SizedBox(
                    width: 300,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFF59039),
                      ),
                      onPressed: () {

                      },
                      child:
                          const Text(
                            "التــالي",
                            textDirection: TextDirection.rtl,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontFamily: "Tajawal",
                            ),
                          ),
                    ),
                  ),

                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
//
// List<Step> getSteps() => [
//       Step(
//         isActive: currentStep >= 0,
//         title: const Text(
//           " ",
//         ),
//         content: Column(children: <Widget>[
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Stack(
//                 alignment: Alignment.center,
//                 children: [
//                   Container(
//                     height: 125,
//                     width: 125,
//                     decoration: BoxDecoration(
//                       color: const Color(0xFFE7E7E7),
//                       borderRadius: BorderRadius.circular(80),
//                     ),
//                   ),
//                   Image.asset(
//                     "lib/images/ion_camera.png",
//                     height: 50,
//                     width: 50,
//                   )
//                 ],
//               ),
//             ],
//           ),
//           const SizedBox(
//             height: 15,
//           ),
//           const Padding(
//             padding: EdgeInsets.all(10.0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 Text("المعلومات الشخصية",
//                     style: TextStyle(
//                       fontFamily: "Tajawal",
//                       fontSize: 16,
//                       color: Color(0xFFF59039),
//                       fontWeight: FontWeight.bold,
//                     )),
//               ],
//             ),
//           ),
//           const SizedBox(
//             height: 8,
//           ),
//           Column(
//             children: [
//               const Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   Padding(
//                     padding: EdgeInsets.only(bottom: 8.0, right: 20),
//                     child: Text(
//                       "الاسم كامل",
//                       style: TextStyle(
//                           fontFamily: "Tajawal",
//                           color: Color(0xFF4A4C4D),
//                           fontWeight: FontWeight.bold),
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(
//                 width: 320,
//                 height: 50,
//                 child: TextField(
//                   textDirection: TextDirection.rtl,
//                   textAlign: TextAlign.right,
//                   decoration: InputDecoration(
//                     hintText: "الاسم كامل ",
//                     hintStyle: const TextStyle(
//                         fontFamily: "Tajawal", color: Color(0xFFBBBBBB)),
//                     filled: true,
//                     fillColor: Colors.white,
//                     border: OutlineInputBorder(
//                       borderSide: const BorderSide(color: Color(0xFFBCBCBC)),
//                       borderRadius: BorderRadius.circular(30),
//                     ),
//                     enabledBorder: OutlineInputBorder(
//                       borderSide: const BorderSide(color: Color(0xFFBCBCBC)),
//                       borderRadius: BorderRadius.circular(30),
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 16),
//               const Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   Padding(
//                     padding: EdgeInsets.only(bottom: 8.0, right: 20),
//                     child: Text(
//                       "الايميل",
//                       style: TextStyle(
//                           fontFamily: "Tajawal",
//                           color: Color(0xFF4A4C4D),
//                           fontWeight: FontWeight.bold),
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(
//                 width: 320,
//                 height: 50,
//                 child: TextField(
//                   textDirection: TextDirection.rtl,
//                   textAlign: TextAlign.right,
//                   decoration: InputDecoration(
//                     hintText: "example@gmail.com",
//                     hintStyle: const TextStyle(
//                         fontFamily: "Tajawal", color: Color(0xFFBBBBBB)),
//                     filled: true,
//                     fillColor: Colors.white,
//                     border: OutlineInputBorder(
//                       borderSide: const BorderSide(color: Color(0xFFBCBCBC)),
//                       borderRadius: BorderRadius.circular(30),
//                     ),
//                     enabledBorder: OutlineInputBorder(
//                       borderSide: const BorderSide(color: Color(0xFFBCBCBC)),
//                       borderRadius: BorderRadius.circular(30),
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 16),
//               const Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   Padding(
//                     padding: EdgeInsets.only(bottom: 8.0, right: 20),
//                     child: Text(
//                       "رقم الهاتف",
//                       style: TextStyle(
//                           fontFamily: "Tajawal",
//                           color: Color(0xFF4A4C4D),
//                           fontWeight: FontWeight.bold),
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(
//                 width: 320,
//                 height: 50,
//                 child: TextField(
//                   textAlign: TextAlign.right,
//                   decoration: InputDecoration(
//                     hintText: "0000000 218+ ",
//                     hintStyle: const TextStyle(
//                         fontFamily: "Tajawal", color: Color(0xFFBBBBBB)),
//                     filled: true,
//                     fillColor: Colors.white,
//                     border: OutlineInputBorder(
//                       borderSide: const BorderSide(color: Color(0xFFBCBCBC)),
//                       borderRadius: BorderRadius.circular(30),
//                     ),
//                     enabledBorder: OutlineInputBorder(
//                       borderSide: const BorderSide(color: Color(0xFFBCBCBC)),
//                       borderRadius: BorderRadius.circular(30),
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 16),
//               const Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   Padding(
//                     padding: EdgeInsets.only(bottom: 8.0, right: 20),
//                     child: Text(
//                       "تاريخ الميلاد",
//                       style: TextStyle(
//                           fontFamily: "Tajawal",
//                           color: Color(0xFF4A4C4D),
//                           fontWeight: FontWeight.bold),
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(
//                 width: 320,
//                 height: 50,
//                 child: TextField(
//                   textDirection: TextDirection.rtl,
//                   textAlign: TextAlign.right,
//                   decoration: InputDecoration(
//                     hintText: "0000/00/00",
//                     hintStyle: const TextStyle(
//                         fontFamily: "Tajawal", color: Color(0xFFBBBBBB)),
//                     filled: true,
//                     fillColor: Colors.white,
//                     suffixIcon: const Icon(Icons.calendar_month_sharp,
//                         color: Color(0xFFBBBBBB)),
//                     border: OutlineInputBorder(
//                       borderSide: const BorderSide(color: Color(0xFFBCBCBC)),
//                       borderRadius: BorderRadius.circular(30),
//                     ),
//                     enabledBorder: OutlineInputBorder(
//                       borderSide: const BorderSide(color: Color(0xFFBCBCBC)),
//                       borderRadius: BorderRadius.circular(30),
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 16),
//               const Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   Padding(
//                     padding: EdgeInsets.only(bottom: 8.0, right: 20),
//                     child: Text(
//                       "المدينة",
//                       style: TextStyle(
//                           fontFamily: "Tajawal",
//                           color: Color(0xFF4A4C4D),
//                           fontWeight: FontWeight.bold),
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(
//                 width: 320,
//                 height: 50,
//                 child: TextField(
//                   textDirection: TextDirection.rtl,
//                   textAlign: TextAlign.right,
//                   decoration: InputDecoration(
//                     hintText: "اسم المدينة",
//                     hintStyle: const TextStyle(
//                         fontFamily: "Tajawal", color: Color(0xFFBBBBBB)),
//                     filled: true,
//                     fillColor: Colors.white,
//                     border: OutlineInputBorder(
//                       borderSide: const BorderSide(color: Color(0xFFBCBCBC)),
//                       borderRadius: BorderRadius.circular(30),
//                     ),
//                     enabledBorder: OutlineInputBorder(
//                       borderSide: const BorderSide(color: Color(0xFFBCBCBC)),
//                       borderRadius: BorderRadius.circular(30),
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 16),
//               const Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   Padding(
//                     padding: EdgeInsets.only(bottom: 8.0, right: 20),
//                     child: Text(
//                       "عنوان السكن",
//                       style: TextStyle(
//                           fontFamily: "Tajawal",
//                           color: Color(0xFF4A4C4D),
//                           fontWeight: FontWeight.bold),
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(
//                 width: 320,
//                 height: 50,
//                 child: TextField(
//                   textDirection: TextDirection.rtl,
//                   textAlign: TextAlign.right,
//                   decoration: InputDecoration(
//                     hintText: "المنطقة - الشارع",
//                     hintStyle: const TextStyle(
//                         fontFamily: "Tajawal", color: Color(0xFFBBBBBB)),
//                     filled: true,
//                     fillColor: Colors.white,
//                     border: OutlineInputBorder(
//                       borderSide: const BorderSide(color: Color(0xFFBCBCBC)),
//                       borderRadius: BorderRadius.circular(30),
//                     ),
//                     enabledBorder: OutlineInputBorder(
//                       borderSide: const BorderSide(color: Color(0xFFBCBCBC)),
//                       borderRadius: BorderRadius.circular(30),
//                     ),
//                   ),
//                 ),
//               ),
//               Column(
//                 children: [
//                   const Row(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       Padding(
//                         padding: EdgeInsets.only(bottom: 8.0, right: 20),
//                         child: Text(
//                           "ملخص عن الشركة",
//                           style: TextStyle(
//                               fontFamily: "Tajawal",
//                               color: Color(0xFF4A4C4D),
//                               fontWeight: FontWeight.bold),
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(
//                     width: 320,
//                     height: 50,
//                     child: TextField(
//                       textDirection: TextDirection.rtl,
//                       textAlign: TextAlign.right,
//                       decoration: InputDecoration(
//                         hintText: "اكتب ملخص عن شركتك.. ",
//                         hintStyle: const TextStyle(
//                             fontFamily: "Tajawal",
//                             fontSize: 15,
//                             color: Color(0xFFBBBBBB)),
//                         filled: true,
//                         fillColor: Colors.white,
//                         border: OutlineInputBorder(
//                           borderSide:
//                               const BorderSide(color: Color(0xFFBCBCBC)),
//                           borderRadius: BorderRadius.circular(30),
//                         ),
//                         enabledBorder: OutlineInputBorder(
//                           borderSide:
//                               const BorderSide(color: Color(0xFFBCBCBC)),
//                           borderRadius: BorderRadius.circular(30),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ]),
//       )
//     ];
}
