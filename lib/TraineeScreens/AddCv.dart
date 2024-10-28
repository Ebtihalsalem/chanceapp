// import 'package:chanceapp/Core/App_theme.dart';
// import 'package:chanceapp/UI%20Components/textFieldWithoutIcon.dart';
// import 'package:flutter/material.dart';
// import '../UI Components/BuildText.dart';
//
// class AddCv extends StatefulWidget {
//
//   final String title;
//   final String name;
//
//   const AddCv({super.key, required this.title, required this.name});
//
//   @override
//   State<AddCv> createState() => _AddCvState();
// }
//
// class _AddCvState extends State<AddCv> {
//
//   @override
//   Widget build(BuildContext context) {
//
//     String title = widget.title;
//     String name = widget.name;
//
//     return AlertDialog(
//       backgroundColor: primaryColor,
//       title:  Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Image.asset(
//             "lib/images/logo.png",
//             height: 18,
//             width: 18,
//           ),
//           const SizedBox(
//             width: 10,
//           ),
//            buildTextTitle(title,
//                18,FontWeight.bold),
//         ],
//       ),
//       content:
//       Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Container(
//             padding: const EdgeInsets.all(16),
//             child: Column(
//               children: [
//                  Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.only(bottom: 5, right: 20),
//                       child: buildTextTitle(
//                         name,
//                           12,
//                           FontWeight.bold
//                       ),
//                     ),
//                   ],
//                 ),
//                 textFieldWithoutIcon(name, 50, 320),
//                 const SizedBox(height: 15,),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.only(bottom: 5,  right: 20),
//                       child: buildTextTitle(
//                         "تاريخ الحصول عليها",
//                           12,
//                           FontWeight.bold
//                       ),
//                     ),
//                   ],
//                 ),
//                 textFieldWithoutIcon("0000/00/00", 50, 320),
//
//                 const SizedBox(height: 15,),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.only(bottom: 5,  right: 20),
//                       child: buildTextTitle(
//                         "مكان الحصول عليها",
//                         12,
//                           FontWeight.bold
//                       ),
//                     ),
//                   ],
//                 ),
//                 textFieldWithoutIcon("اسم الجهة", 50, 320),
//                 const SizedBox(height: 30,),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     TextButton(
//                       onPressed: () {
//                         Navigator.of(context).pop();
//                       },
//                       child: Padding(
//                         padding: const EdgeInsets.only(left:8.0),
//                         child: buildText("الغاء",17,FontWeight.bold,secondaryColor),
//                       ),
//                     ),
//                     Container(
//                       height: 40,
//                       width: 80,
//                       decoration: BoxDecoration(
//                           color: secondaryColor,
//                           borderRadius: BorderRadius.circular(10)
//                       ),
//                       child: TextButton(
//                         onPressed: () {},
//                         child:  buildText("اضافة",15,FontWeight.bold,Colors.white),
//                       ),
//                     ),
//                   ],
//                 ),
//
//               ],
//             ),
//           ),
//         ],
//       ),
//
//     );
//
//   }
//
// }
//


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:chanceapp/Core/App_theme.dart';
import 'package:chanceapp/UI%20Components/textFieldWithoutIcon.dart';
import '../UI Components/BuildText.dart';

class AddCvDialog extends StatefulWidget {
  final String title;
  final String name;
  final String hintText1;
  final String hintText2;
  final String hintText3;

  const AddCvDialog({
    super.key,
    required this.title,
    required this.name,
    required this.hintText1,
    required this.hintText2,
    required this.hintText3,
  });

  @override
  State<AddCvDialog> createState() => _AddCvDialogState();
}

class _AddCvDialogState extends State<AddCvDialog> {
  final TextEditingController _firstFieldController = TextEditingController();
  final TextEditingController _secondFieldController = TextEditingController();
  final TextEditingController _thirdFieldController = TextEditingController();

  bool _isFormValid() {
    return _firstFieldController.text.isNotEmpty &&
        _secondFieldController.text.isNotEmpty &&
        _thirdFieldController.text.isNotEmpty;
  }

  Widget textFieldWithoutIcon2(String text, double h, double w, {TextEditingController? controller, List<TextInputFormatter>? inputFormatters}) {
    return SizedBox(
      width: w,
      height: h,
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.text,
        inputFormatters: inputFormatters,
        decoration: InputDecoration(
          hintText: text,
          hintStyle: const TextStyle(color: Color(0xFFBBBBBB), fontFamily: "Tajawal"),
          filled: true,
          fillColor: const Color(0xFFFDFDFD),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: borderColor),
            borderRadius: BorderRadius.circular(30),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: borderColor),
            borderRadius: BorderRadius.circular(30),
          ),
          focusColor: secondaryColor,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: secondaryColor),
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    );
  }
  @override

  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: primaryColor,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "lib/images/logo.png",
            height: 18,
            width: 18,
          ),
          const SizedBox(width: 10),
          buildTextTitle(widget.title, 18, FontWeight.bold),
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 10.0), // اضبط المسافة اليمنى هنا
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start, // يبدأ كل عنصر من اليسار داخل العمود
                      children: [
                        buildTextTitle(widget.name, 12, FontWeight.bold),
                        const SizedBox(height: 8),
                        textFieldWithoutIcon2(widget.hintText1, 50, 320, controller: _firstFieldController),
                        const SizedBox(height: 15),
                        buildTextTitle("تاريخ الحصول عليها", 12, FontWeight.bold),
                        textFieldWithoutIcon2(widget.hintText2, 50, 320, controller: _secondFieldController),
                        const SizedBox(height: 15),
                        buildTextTitle("مكان الحصول عليها", 12, FontWeight.bold),
                        textFieldWithoutIcon2(widget.hintText3, 50, 320, controller: _thirdFieldController),
                        const SizedBox(height: 30),
                      ],
                    ),
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: buildText("الغاء", 17, FontWeight.bold, secondaryColor),
                      ),
                    ),
                    Container(
                      height: 40,
                      width: 80,
                      decoration: BoxDecoration(
                        color: secondaryColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child:TextButton(
                        onPressed: () {
                          if (_isFormValid()) {
                            Navigator.of(context).pop({
                              'degree': _firstFieldController.text,
                              'date': _secondFieldController.text,
                              'institution': _thirdFieldController.text,
                            });
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('يرجى ملء جميع الحقول'),
                              ),
                            );
                          }
                        },
                        child: buildText("اضافة", 15, FontWeight.bold, Colors.white),
                      ),
                    //TextButton(
                      //   onPressed: () {
                      //     if (_isFormValid()) {
                      //       Navigator.of(context).pop({
                      //         'degree': _firstFieldController.text,
                      //         'date': _secondFieldController.text,
                      //         'institution': _thirdFieldController.text,
                      //       });
                      //     } else {
                      //       ScaffoldMessenger.of(context).showSnackBar(
                      //         const SnackBar(
                      //           content: Text('يرجى ملء جميع الحقول'),
                      //         ),
                      //       );
                      //     }
                      //   },
                      //   child: buildText("اضافة", 15, FontWeight.bold, Colors.white),
                      // ),

                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

//
//
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:chanceapp/Core/App_theme.dart';
// import 'package:chanceapp/UI%20Components/textFieldWithoutIcon.dart';
// import '../UI Components/BuildText.dart';
//
// class AddCv extends StatefulWidget {
//   final String title;
//   final String name;
//
//   const AddCv({super.key, required this.title, required this.name});
//
//   @override
//   State<AddCv> createState() => _AddCvState();
// }
// Widget textFieldWithoutIcon(String text, double h, double w, TextEditingController controller, {List<TextInputFormatter>? inputFormatters}) {
//   return SizedBox(
//     width: w,
//     height: h,
//     child: TextField(
//       controller: controller,
//       keyboardType: TextInputType.text,
//       inputFormatters: inputFormatters,
//       decoration: InputDecoration(
//         hintText: text,
//         hintStyle: const TextStyle(color: Color(0xFFBBBBBB), fontFamily: "Tajawal"),
//         filled: true,
//         fillColor: const Color(0xFFFDFDFD),
//         border: OutlineInputBorder(
//           borderSide: BorderSide(color: borderColor),
//           borderRadius: BorderRadius.circular(30),
//         ),
//         enabledBorder: OutlineInputBorder(
//           borderSide: BorderSide(color: borderColor),
//           borderRadius: BorderRadius.circular(30),
//         ),
//         focusColor: secondaryColor,
//         focusedBorder: OutlineInputBorder(
//           borderSide: BorderSide(color: secondaryColor),
//           borderRadius: BorderRadius.circular(30),
//         ),
//       ),
//     ),
//   );
// }
//
// class _AddCvState extends State<AddCv> {
//   final TextEditingController _degreeController = TextEditingController();
//   final TextEditingController _dateController = TextEditingController();
//   final TextEditingController _institutionController = TextEditingController();
//
//   bool _isFormValid() {
//     return _degreeController.text.isNotEmpty &&
//         _dateController.text.isNotEmpty &&
//         _institutionController.text.isNotEmpty;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     String title = widget.title;
//     String name = widget.name;
//
//     return AlertDialog(
//       backgroundColor: primaryColor,
//       title: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Image.asset(
//             "lib/images/logo.png",
//             height: 18,
//             width: 18,
//           ),
//           const SizedBox(width: 10),
//           buildTextTitle(title, 18, FontWeight.bold),
//         ],
//       ),
//       content: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Container(
//             padding: const EdgeInsets.all(16),
//             child: Column(
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.only(bottom: 5, right: 20),
//                       child: buildTextTitle(name, 12, FontWeight.bold),
//                     ),
//                   ],
//                 ),
//                 textFieldWithoutIcon(name, 50, 320, _degreeController),
//
//                 const SizedBox(height: 15),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.only(bottom: 5, right: 20),
//                       child: buildTextTitle("تاريخ الحصول عليها", 12, FontWeight.bold),
//                     ),
//                   ],
//                 ),
//                 textFieldWithoutIcon("0000/00/00", 50, 320, _dateController),
//                 const SizedBox(height: 15),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.only(bottom: 5, right: 20),
//                       child: buildTextTitle("مكان الحصول عليها", 12, FontWeight.bold),
//                     ),
//                   ],
//                 ),
//                 textFieldWithoutIcon("اسم الجهة", 50, 320, _institutionController),
//                 const SizedBox(height: 30),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     TextButton(
//                       onPressed: () {
//                         Navigator.of(context).pop();
//                       },
//                       child: Padding(
//                         padding: const EdgeInsets.only(left: 8.0),
//                         child: buildText("الغاء", 17, FontWeight.bold, secondaryColor),
//                       ),
//                     ),
//                     Container(
//                       height: 40,
//                       width: 80,
//                       decoration: BoxDecoration(
//                         color: secondaryColor,
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       child: TextButton(
//                         onPressed: () {
//                           if (_isFormValid()) {
//                             // هنا يمكنك إضافة المنطق لإضافة السيرة الذاتية
//                             Navigator.of(context).pop({
//                               'degree': _degreeController.text,
//                               'date': _dateController.text,
//                               'institution': _institutionController.text,
//                             });
//                           } else {
//                             // إظهار رسالة خطأ إذا لم يتم ملء الحقول
//                             ScaffoldMessenger.of(context).showSnackBar(
//                               const SnackBar(
//                                 content: Text('يرجى ملء جميع الحقول'),
//                               ),
//                             );
//                           }
//                         },
//                         child: buildText("اضافة", 15, FontWeight.bold, Colors.white),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

//buildTextTitle(widget.name, 12, FontWeight.bold),
// Padding(
//   padding: const EdgeInsets.only(right: 10.0), // اضبط القيمة كما تريد
//   child: Align(
//     alignment: Alignment.centerRight,
//     child: buildTextTitle(widget.name, 12, FontWeight.bold),
//
//   ),
// ),
//
// textFieldWithoutIcon2(widget.hintText1, 50, 320, controller: _firstFieldController),
// const SizedBox(height: 15),
// buildTextTitle("تاريخ الحصول عليها", 12, FontWeight.bold),
// textFieldWithoutIcon2(widget.hintText2, 50, 320, controller: _secondFieldController),
// const SizedBox(height: 15),
// buildTextTitle("مكان الحصول عليها", 12, FontWeight.bold),
// textFieldWithoutIcon2(widget.hintText3, 50, 320, controller: _thirdFieldController),
// const SizedBox(height: 30),