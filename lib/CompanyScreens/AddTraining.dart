// import 'package:eva_icons_flutter/eva_icons_flutter.dart';
// import 'package:flutter/material.dart';
//
// import '../UI Components/BuildText.dart';
//
// class AddTraining extends StatefulWidget {
//   const AddTraining({super.key});
//
//   @override
//   State<AddTraining> createState() => _AddTrainingState();
// }
//
// class _AddTrainingState extends State<AddTraining> {
//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       backgroundColor: const Color(0xFFEFEFEF),
//       title: _buildTitle(),
//       content: _buildContent(),
//     );
//   }
//
//   // دالة لإنشاء العنوان
//   Widget _buildTitle() {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Image.asset(
//           "lib/images/logo.png",
//           height: 15,
//           width: 15,
//         ),
//         const SizedBox(width: 10),
//         const Text(
//           "إضافة تدريب",
//           style: TextStyle(
//             fontFamily: "Tajawal",
//             fontSize: 15,
//             color: Color(0xFF4A4C4D),
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//       ],
//     );
//   }
//
//   // دالة لإنشاء المحتوى
//   Widget _buildContent() {
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         Padding(
//           padding: const EdgeInsets.all(16),
//           child: Column(
//             children: [
//               _buildLabel("المنصب"),
//               _buildTextField("منصب التدريب", 320),
//               const SizedBox(height: 15),
//               _buildDateFields(),
//               const SizedBox(height: 15),
//               _buildLabel("المدينة"),
//               _buildTextField("اسم المدينة", 320),
//               const SizedBox(height: 15),
//               _buildLabel("العدد المطلوب"),
//               _buildTextField("", 320),
//               const SizedBox(height: 15),
//               _buildLabel("المهارات"),
//               _buildTextField("", 320),
//               const SizedBox(height: 20),
//               _buildButtons(),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
//
//   // دالة لإنشاء التصنيفات (العناوين الصغيرة)
//   Widget _buildLabel(String labelText) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.start,
//       children: [
//         Padding(
//           padding: const EdgeInsets.only(bottom: 5, right: 20),
//           child: Text(
//             labelText,
//             style: const TextStyle(
//               fontFamily: "Tajawal",
//               color: Color(0xFF4A4C4D),
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ),
//       ],
//     );
//   }
//
//   // دالة لإنشاء حقول النصوص
//   Widget _buildTextField(String hintText, double width) {
//     return SizedBox(
//       width: width,
//       height: 50,
//       child: TextField(
//         textDirection: TextDirection.rtl,
//         textAlign: TextAlign.right,
//         decoration: InputDecoration(
//           hintText: hintText,
//           hintStyle: const TextStyle(
//             fontFamily: "Tajawal",
//             color: Color(0xFFBBBBBB),
//           ),
//           filled: true,
//           fillColor: Colors.white,
//           border: OutlineInputBorder(
//             borderSide: const BorderSide(color: Color(0xFFBCBCBC)),
//             borderRadius: BorderRadius.circular(30),
//           ),
//           enabledBorder: OutlineInputBorder(
//             borderSide: const BorderSide(color: Color(0xFFBCBCBC)),
//             borderRadius: BorderRadius.circular(30),
//           ),
//         ),
//       ),
//     );
//   }
//
//   // دالة لإنشاء حقلي تواريخ البدء والانتهاء
//   Widget _buildDateFields() {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         _buildDateField("تاريخ البدأ", 120),
//         _buildDateField("تاريخ الانتهاء", 120),
//       ],
//     );
//   }
//
//   // دالة لإنشاء حقل التاريخ
//   Widget _buildDateField(String label, double width) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.start,
//       children: [
//         Padding(
//           padding: const EdgeInsets.only(bottom: 5, right: 10),
//           child: Text(
//             label,
//             style: const TextStyle(
//               fontFamily: "Tajawal",
//               color: Color(0xFF4A4C4D),
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ),
//         SizedBox(
//           width: width,
//           height: 50,
//           child: TextField(
//             textDirection: TextDirection.rtl,
//             textAlign: TextAlign.right,
//             decoration: InputDecoration(
//               filled: true,
//               fillColor: Colors.white,
//               prefixIcon: const Icon(
//                 EvaIcons.calendarOutline,
//                 color: Color(0xFFBBBBBB),
//               ),
//               border: OutlineInputBorder(
//                 borderSide: const BorderSide(color: Color(0xFFBCBCBC)),
//                 borderRadius: BorderRadius.circular(30),
//               ),
//               enabledBorder: OutlineInputBorder(
//                 borderSide: const BorderSide(color: Color(0xFFBCBCBC)),
//                 borderRadius: BorderRadius.circular(30),
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
//
//   // دالة لإنشاء الأزرار
//   Widget _buildButtons() {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.end,
//       children: [
//         TextButton(
//           onPressed: () {
//             Navigator.of(context).pop();
//           },
//           child: buildText("الغاء", 17, FontWeight.bold, const Color(0xFFF59039)),
//         ),
//         Container(
//           height: 40,
//           width: 80,
//           decoration: BoxDecoration(
//             color: const Color(0xFFF59039),
//             borderRadius: BorderRadius.circular(10),
//           ),
//           child: TextButton(
//             onPressed: () {},
//             child: buildText("اضافة", 15, FontWeight.bold, Colors.white),
//           ),
//         ),
//       ],
//     );
//   }
// }


// import 'package:eva_icons_flutter/eva_icons_flutter.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
//
// import '../UI Components/BuildText.dart';
//
// class AddTraining extends StatefulWidget {
//   const AddTraining({super.key});
//
//   @override
//   State<AddTraining> createState() => _AddTrainingState();
// }
//
// class _AddTrainingState extends State<AddTraining> {
//   final TextEditingController positionController = TextEditingController();
//   final TextEditingController cityController = TextEditingController();
//   final TextEditingController requiredNumberController = TextEditingController();
//   final TextEditingController skillsController = TextEditingController();
//   final TextEditingController startDateController = TextEditingController();
//   final TextEditingController endDateController = TextEditingController();
//
//   // دالة لإرسال البيانات إلى API
//   // Future<void> _submitData() async {
//   //   final url = Uri.parse('http://192.168.1.100:8085/api/trainings'); // تعديل الرابط حسب الحاجة
//   //
//   //   final data = {
//   //     "position": positionController.text,
//   //     "startDate": startDateController.text,
//   //     "endDate": endDateController.text,
//   //     "city": cityController.text,
//   //     "requiredNumber": requiredNumberController.text,
//   //     "skills": skillsController.text,
//   //   };
//   //
//   //   try {
//   //     final response = await http.post(
//   //       url,
//   //       headers: {"Content-Type": "application/json"},
//   //       body: jsonEncode(data),
//   //     );
//   //
//   //     if (response.statusCode == 200) {
//   //       // نجاح العملية
//   //       _showMessageDialog("تمت إضافة التدريب بنجاح!");
//   //     } else {
//   //       // حدث خطأ
//   //       _showMessageDialog("حدث خطأ أثناء إضافة التدريب. حاول مرة أخرى.");
//   //     }
//   //   } catch (e) {
//   //     // في حال وجود خطأ في الاتصال
//   //     _showMessageDialog("تعذر الاتصال بالخادم. تحقق من الاتصال بالشبكة.");
//   //   }
//   // }
//   Future<void> _submitData() async {
//     final url = Uri.parse('http://192.168.1.100:8085/api/trainings'); // تعديل الرابط حسب الحاجة
//
//     // Adjust the data format to match the Training class
//     final data = {
//       "trainingPosition": positionController.text,  // Matching 'trainingPosition'
//       "startDate": startDateController.text,  // Matching 'startDate'
//       "endDate": endDateController.text,  // Matching 'endDate'
//       "city": cityController.text,  // Matching 'city'
//       "numberOfPositions": int.tryParse(requiredNumberController.text) ?? 0,  // Matching 'numberOfPositions'
//       "requiredSkills": skillsController.text.split(','),  // Matching 'requiredSkills', expecting a list
//       "title": "Sample Title",  // You can add additional fields like 'title' here as needed
//       "description": "Sample Description",  // Example placeholder values
//       "type": "تقني",  // You can add static or dynamic values as required
//       "level": "متوسط",  // Adjust based on your requirements
//       "companyId": 1001,  // Example company ID
//       "certificate": true,  // You can adjust this as well
//     };
//
//     try {
//       final response = await http.post(
//         url,
//         headers: {"Content-Type": "application/json"},
//         body: jsonEncode(data),
//       );
//
//       if (response.statusCode == 200) {
//         _showMessageDialog("تمت إضافة التدريب بنجاح!");
//       } else {
//         _showMessageDialog("حدث خطأ أثناء إضافة التدريب. حاول مرة أخرى.");
//       }
//     } catch (e) {
//       _showMessageDialog("تعذر الاتصال بالخادم. تحقق من الاتصال بالشبكة.");
//     }
//   }
//
//   void _showMessageDialog(String message) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: const Text("إشعار"),
//           content: Text(message),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//               child: const Text("موافق"),
//             ),
//           ],
//         );
//       },
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       backgroundColor: const Color(0xFFEFEFEF),
//       title: _buildTitle(),
//       content: _buildContent(),
//     );
//   }
//
//   Widget _buildTitle() {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Image.asset(
//           "lib/images/logo.png",
//           height: 15,
//           width: 15,
//         ),
//         const SizedBox(width: 10),
//         const Text(
//           "إضافة تدريب",
//           style: TextStyle(
//             fontFamily: "Tajawal",
//             fontSize: 15,
//             color: Color(0xFF4A4C4D),
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget _buildContent() {
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         Padding(
//           padding: const EdgeInsets.all(16),
//           child: Column(
//             children: [
//               _buildLabel("المنصب"),
//               _buildTextField("منصب التدريب", positionController, 320),
//               const SizedBox(height: 15),
//               _buildDateFields(),
//               const SizedBox(height: 15),
//               _buildLabel("المدينة"),
//               _buildTextField("اسم المدينة", cityController, 320),
//               const SizedBox(height: 15),
//               _buildLabel("العدد المطلوب"),
//               _buildTextField("", requiredNumberController, 320),
//               const SizedBox(height: 15),
//               _buildLabel("المهارات"),
//               _buildTextField("", skillsController, 320),
//               const SizedBox(height: 20),
//               _buildButtons(),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget _buildLabel(String labelText) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.start,
//       children: [
//         Padding(
//           padding: const EdgeInsets.only(bottom: 5, right: 20),
//           child: Text(
//             labelText,
//             style: const TextStyle(
//               fontFamily: "Tajawal",
//               color: Color(0xFF4A4C4D),
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget _buildTextField(String hintText, TextEditingController controller, double width) {
//     return SizedBox(
//       width: width,
//       height: 50,
//       child: TextField(
//         controller: controller,
//         textDirection: TextDirection.rtl,
//         textAlign: TextAlign.right,
//         decoration: InputDecoration(
//           hintText: hintText,
//           hintStyle: const TextStyle(
//             fontFamily: "Tajawal",
//             color: Color(0xFFBBBBBB),
//           ),
//           filled: true,
//           fillColor: Colors.white,
//           border: OutlineInputBorder(
//             borderSide: const BorderSide(color: Color(0xFFBCBCBC)),
//             borderRadius: BorderRadius.circular(30),
//           ),
//           enabledBorder: OutlineInputBorder(
//             borderSide: const BorderSide(color: Color(0xFFBCBCBC)),
//             borderRadius: BorderRadius.circular(30),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildDateFields() {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         _buildDateField("تاريخ البدأ", startDateController, 120),
//         _buildDateField("تاريخ الانتهاء", endDateController, 120),
//       ],
//     );
//   }
//
//   Widget _buildDateField(String label, TextEditingController controller, double width) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.start,
//       children: [
//         Padding(
//           padding: const EdgeInsets.only(bottom: 5, right: 10),
//           child: Text(
//             label,
//             style: const TextStyle(
//               fontFamily: "Tajawal",
//               color: Color(0xFF4A4C4D),
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ),
//         SizedBox(
//           width: width,
//           height: 50,
//           child: TextField(
//             controller: controller,
//             textDirection: TextDirection.rtl,
//             textAlign: TextAlign.right,
//             decoration: InputDecoration(
//               filled: true,
//               fillColor: Colors.white,
//               prefixIcon: const Icon(
//                 EvaIcons.calendarOutline,
//                 color: Color(0xFFBBBBBB),
//               ),
//               border: OutlineInputBorder(
//                 borderSide: const BorderSide(color: Color(0xFFBCBCBC)),
//                 borderRadius: BorderRadius.circular(30),
//               ),
//               enabledBorder: OutlineInputBorder(
//                 borderSide: const BorderSide(color: Color(0xFFBCBCBC)),
//                 borderRadius: BorderRadius.circular(30),
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget _buildButtons() {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.end,
//       children: [
//         TextButton(
//           onPressed: () {
//             Navigator.of(context).pop();
//           },
//           child: buildText("الغاء", 17, FontWeight.bold, const Color(0xFFF59039)),
//         ),
//         Container(
//           height: 40,
//           width: 80,
//           decoration: BoxDecoration(
//             color: const Color(0xFFF59039),
//             borderRadius: BorderRadius.circular(10),
//           ),
//           child: TextButton(
//             onPressed: _submitData, // استدعاء الدالة لإرسال البيانات
//             child: buildText("اضافة", 15, FontWeight.bold, Colors.white),
//           ),
//         ),
//       ],
//     );
//   }
// }


import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../UI Components/BuildText.dart';

class AddTraining extends StatefulWidget {
  const AddTraining({super.key});

  @override
  State<AddTraining> createState() => _AddTrainingState();
}

class _AddTrainingState extends State<AddTraining> {
  final TextEditingController positionController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController requiredNumberController = TextEditingController();
  final TextEditingController skillsController = TextEditingController();
  final TextEditingController startDateController = TextEditingController();
  final TextEditingController endDateController = TextEditingController();

  Future<void> _submitData() async {
    final url = Uri.parse('http://192.168.1.100:8085/api/trainings'); // تعديل الرابط حسب الحاجة

    // التحقق من المدخلات
    if (positionController.text.isEmpty ||
        cityController.text.isEmpty ||
        requiredNumberController.text.isEmpty ||
        skillsController.text.isEmpty ||
        startDateController.text.isEmpty ||
        endDateController.text.isEmpty) {
      _showMessageDialog("يرجى ملء جميع الحقول.");
      return;
    }

    // ضبط تنسيق البيانات ليتوافق مع كلاس Training
    final data = {
      "trainingPosition": positionController.text,
      "startDate": startDateController.text, // تأكد من أن التاريخ في التنسيق الصحيح (YYYY-MM-DD)
      "endDate": endDateController.text, // تأكد من أن التاريخ في التنسيق الصحيح (YYYY-MM-DD)
      "city": cityController.text,
      "numberOfPositions": int.tryParse(requiredNumberController.text) ?? 0,
      "requiredSkills": skillsController.text.split(',').map((skill) => skill.trim()).toList(), // تحويل النص إلى قائمة
      "title": "Sample Title",
      "description": "Sample Description",
      "type": "تقني",
      "level": "متوسط",
      "companyId": 1001,
      "certificate": true,
    };

    try {
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(data),
      );

      if (response.statusCode == 200) {
        _showMessageDialog("تمت إضافة التدريب بنجاح!");
      } else {
        _showMessageDialog("حدث خطأ أثناء إضافة التدريب. حاول مرة أخرى.");
      }
    } catch (e) {
      _showMessageDialog("تعذر الاتصال بالخادم. تحقق من الاتصال بالشبكة.");
    }
  }

  void _showMessageDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("إشعار"),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("موافق"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color(0xFFEFEFEF),
      title: _buildTitle(),
      content: _buildContent(),
    );
  }

  Widget _buildTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          "lib/images/logo.png",
          height: 15,
          width: 15,
        ),
        const SizedBox(width: 10),
        const Text(
          "إضافة تدريب",
          style: TextStyle(
            fontFamily: "Tajawal",
            fontSize: 15,
            color: Color(0xFF4A4C4D),
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildContent() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              _buildLabel("المنصب"),
              _buildTextField("منصب التدريب", positionController, 320),
              const SizedBox(height: 15),
              _buildDateFields(),
              const SizedBox(height: 15),
              _buildLabel("المدينة"),
              _buildTextField("اسم المدينة", cityController, 320),
              const SizedBox(height: 15),
              _buildLabel("العدد المطلوب"),
              _buildTextField("", requiredNumberController, 320),
              const SizedBox(height: 15),
              _buildLabel("المهارات"),
              _buildTextField("", skillsController, 320),
              const SizedBox(height: 20),
              _buildButtons(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildLabel(String labelText) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 5, right: 20),
          child: Text(
            labelText,
            style: const TextStyle(
              fontFamily: "Tajawal",
              color: Color(0xFF4A4C4D),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTextField(String hintText, TextEditingController controller, double width) {
    return SizedBox(
      width: width,
      height: 50,
      child: TextField(
        controller: controller,
        textDirection: TextDirection.rtl,
        textAlign: TextAlign.right,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(
            fontFamily: "Tajawal",
            color: Color(0xFFBBBBBB),
          ),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xFFBCBCBC)),
            borderRadius: BorderRadius.circular(30),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xFFBCBCBC)),
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    );
  }

  Widget _buildDateFields() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildDateField("تاريخ البدأ", startDateController, 120),
        _buildDateField("تاريخ الانتهاء", endDateController, 120),
      ],
    );
  }

  Widget _buildDateField(String label, TextEditingController controller, double width) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 5, right: 10),
          child: Text(
            label,
            style: const TextStyle(
              fontFamily: "Tajawal",
              color: Color(0xFF4A4C4D),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          width: width,
          height: 50,
          child: TextField(
            controller: controller,
            textDirection: TextDirection.rtl,
            textAlign: TextAlign.right,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              prefixIcon: const Icon(
                EvaIcons.calendarOutline,
                color: Color(0xFFBBBBBB),
              ),
              border: OutlineInputBorder(
                borderSide: const BorderSide(color: Color(0xFFBCBCBC)),
                borderRadius: BorderRadius.circular(30),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Color(0xFFBCBCBC)),
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: buildText("الغاء", 17, FontWeight.bold, const Color(0xFFF59039)),
        ),
        Container(
          height: 40,
          width: 80,
          decoration: BoxDecoration(
            color: const Color(0xFFF59039),
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextButton(
            onPressed: _submitData, // استدعاء الدالة لإرسال البيانات
            child: buildText("اضافة", 15, FontWeight.bold, Colors.white),
          ),
        ),
      ],
    );
  }
}
