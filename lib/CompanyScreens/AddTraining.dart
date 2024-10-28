// import 'package:eva_icons_flutter/eva_icons_flutter.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import '../UI Components/BuildText.dart';
// class AddTraining extends StatefulWidget {
//   const AddTraining({super.key});
//
//   @override
//   State<AddTraining> createState() => _AddTrainingState();
// }
// class _AddTrainingState extends State<AddTraining> {
//   Future<void> _addTraining() async {
//     print("Attempting to add training...");
//     // الحصول على القيم من الحقول
//     String position = positionController.text;
//     String city = cityController.text;
//     String requiredNumber = requiredNumberController.text;
//     String skills = skillsController.text;
//     String startDate = startDateController.text;
//     String endDate = endDateController.text;
//
//     // تحقق من القيم (يمكنك إضافة المزيد من التحقق حسب الحاجة)
//     if (position.isEmpty || city.isEmpty || requiredNumber.isEmpty || skills.isEmpty || startDate.isEmpty || endDate.isEmpty) {
//       _showMessageDialog("يرجى ملء جميع الحقول.");
//       return;
//     }
//
//     // إعداد البيانات للإرسال
//     Map<String, dynamic> trainingData = {
//       "trainingPosition": position,
//       "city": city,
//       "numberOfPositions": int.parse(requiredNumber),
//       "requiredSkills": skills.split(",").map((skill) => skill.trim()).toList(),
//       "startDate": startDate,
//       "endDate": endDate,
//     };
//
//     // إرسال البيانات إلى API
//     try {
//       final response = await http.post(
//         Uri.parse('https://192.168.1.14:8085/trainings'), // استبدل YOUR_API_URL بالرابط الخاص بك
//         headers: {
//           "Content-Type": "application/json",
//         },
//         body: jsonEncode(trainingData),
//       );
//
//       if (response.statusCode == 201) {
//         // تم الإضافة بنجاح
//         _showMessageDialog("تم إضافة التدريب بنجاح.");
//         // يمكنك إعادة تعيين الحقول هنا إذا كنت ترغب في ذلك
//         positionController.clear();
//         cityController.clear();
//         requiredNumberController.clear();
//         skillsController.clear();
//         startDateController.clear();
//         endDateController.clear();
//       } else {
//         // حدث خطأ
//         _showMessageDialog("حدث خطأ أثناء إضافة التدريب.");
//       }
//     } catch (e) {
//       // معالجة الأخطاء
//       _showMessageDialog("حدث خطأ: ${e.toString()}");
//     }
//   }
//   final TextEditingController positionController = TextEditingController();
//   final TextEditingController cityController = TextEditingController();
//   final TextEditingController requiredNumberController = TextEditingController();
//   final TextEditingController skillsController = TextEditingController();
//   final TextEditingController startDateController = TextEditingController();
//   final TextEditingController endDateController = TextEditingController();
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
//   @override
//
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       backgroundColor: const Color(0xFFEFEFEF),
//       title: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Image.asset(
//             "lib/images/logo.png",
//             height: 15,
//             width: 15,
//           ),
//           const SizedBox(
//             width: 10,
//           ),
//           const Text("إضافة تدريب",
//               style: TextStyle(
//                   fontFamily: "Tajawal",
//                   fontSize: 15,
//                   color: Color(0xFF4A4C4D),
//                   fontWeight: FontWeight.bold)),
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
//                 const Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     Padding(
//                       padding: EdgeInsets.only(bottom: 5, right: 20),
//                       child: Text(
//                         "المنصب",
//                         style: TextStyle(
//                             fontFamily: "Tajawal",
//                             color: Color(0xFF4A4C4D),
//                             fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(
//                   width: 320,
//                   height: 50,
//                   child: TextField(
//                     controller: positionController,
//                     textDirection: TextDirection.rtl,
//                     textAlign: TextAlign.right,
//                     decoration: InputDecoration(
//                       hintText: "منصب التدريب",
//                       hintStyle: const TextStyle(
//                           fontFamily: "Tajawal", color: Color(0xFFBBBBBB)),
//                       filled: true,
//                       fillColor: Colors.white,
//                       border: OutlineInputBorder(
//                         borderSide:
//                         const BorderSide(color: Color(0xFFBCBCBC)),
//                         borderRadius: BorderRadius.circular(30),
//                       ),
//                       enabledBorder: OutlineInputBorder(
//                         borderSide:
//                         const BorderSide(color: Color(0xFFBCBCBC)),
//                         borderRadius: BorderRadius.circular(30),
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 15,),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Column(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         const Padding(
//                           padding: EdgeInsets.only(bottom: 5,  right: 10),
//                           child: Text(
//                             "تاريخ البدأ",
//                             style: TextStyle(
//                                 fontFamily: "Tajawal",
//                                 color: Color(0xFF4A4C4D),
//                                 fontWeight: FontWeight.bold),
//                           ),
//                         ),
//                         SizedBox(
//                           width: 120,
//                           height: 50,
//                           child: TextField(
//                             controller: startDateController,
//                             textDirection: TextDirection.rtl,
//                             textAlign: TextAlign.right,
//                             decoration: InputDecoration(
//                               filled: true,
//                               fillColor: Colors.white,
//                               prefixIcon: const Icon(EvaIcons.calendarOutline,
//                                   color: Color(0xFFBBBBBB)),
//                               border: OutlineInputBorder(
//                                 borderSide:
//                                 const BorderSide(color: Color(0xFFBCBCBC)),
//                                 borderRadius: BorderRadius.circular(30),
//                               ),
//                               enabledBorder: OutlineInputBorder(
//                                 borderSide:
//                                 const BorderSide(color: Color(0xFFBCBCBC)),
//                                 borderRadius: BorderRadius.circular(30),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//
//                     Column(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         const Padding(
//                           padding: EdgeInsets.only(bottom: 5,  right: 10),
//                           child: Text(
//                             "تاريخ الانتهاء",
//                             style: TextStyle(
//                                 fontFamily: "Tajawal",
//                                 color: Color(0xFF4A4C4D),
//                                 fontWeight: FontWeight.bold),
//                           ),
//                         ),
//                         SizedBox(
//                           width: 120,
//                           height: 50,
//                           child: TextField(
//                             controller: endDateController,
//                             textDirection: TextDirection.rtl,
//                             textAlign: TextAlign.right,
//                             decoration: InputDecoration(
//                               filled: true,
//                               fillColor: Colors.white,
//                               prefixIcon: const Icon(EvaIcons.calendarOutline,
//                                   color: Color(0xFFBBBBBB)),
//                               border: OutlineInputBorder(
//                                 borderSide:
//                                 const BorderSide(color: Color(0xFFBCBCBC)),
//                                 borderRadius: BorderRadius.circular(30),
//                               ),
//                               enabledBorder: OutlineInputBorder(
//                                 borderSide:
//                                 const BorderSide(color: Color(0xFFBCBCBC)),
//                                 borderRadius: BorderRadius.circular(30),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//
//                   ],
//                 ),
//
//                 const SizedBox(height: 15,),
//                 const Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     Padding(
//                       padding: EdgeInsets.only(bottom: 5,  right: 20),
//                       child: Text(
//                         "المدينة",
//                         style: TextStyle(
//                             fontFamily: "Tajawal",
//                             color: Color(0xFF4A4C4D),
//                             fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(
//                   width: 320,
//                   height: 50,
//                   child: TextField(
//                     controller: cityController,
//                     textDirection: TextDirection.rtl,
//                     textAlign: TextAlign.right,
//                     decoration: InputDecoration(
//                       hintText: "اسم المدينة",
//                       hintStyle: const TextStyle(
//                           fontFamily: "Tajawal", color: Color(0xFFBBBBBB)),
//                       filled: true,
//                       fillColor: Colors.white,
//                       border: OutlineInputBorder(
//                         borderSide:
//                         const BorderSide(color: Color(0xFFBCBCBC)),
//                         borderRadius: BorderRadius.circular(30),
//                       ),
//                       enabledBorder: OutlineInputBorder(
//                         borderSide:
//                         const BorderSide(color: Color(0xFFBCBCBC)),
//                         borderRadius: BorderRadius.circular(30),
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 15,),
//                 const Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     Padding(
//                       padding: EdgeInsets.only(bottom: 5,  right: 20),
//                       child: Text(
//                         "العدد المطلوب",
//                         style: TextStyle(
//                             fontFamily: "Tajawal",
//                             color: Color(0xFF4A4C4D),
//                             fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(
//                   width: 320,
//                   height: 50,
//                   child: TextField(
//                     controller: requiredNumberController,
//                     textDirection: TextDirection.rtl,
//                     textAlign: TextAlign.right,
//                     decoration: InputDecoration(
//                       filled: true,
//                       fillColor: Colors.white,
//                       border: OutlineInputBorder(
//                         borderSide:
//                         const BorderSide(color: Color(0xFFBCBCBC)),
//                         borderRadius: BorderRadius.circular(30),
//                       ),
//                       enabledBorder: OutlineInputBorder(
//                         borderSide:
//                         const BorderSide(color: Color(0xFFBCBCBC)),
//                         borderRadius: BorderRadius.circular(30),
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 15,),
//                 const Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     Padding(
//                       padding: EdgeInsets.only(bottom: 5,  right: 20),
//                       child: Text(
//                         "المهارات",
//                         style: TextStyle(
//                             fontFamily: "Tajawal",
//                             color: Color(0xFF4A4C4D),
//                             fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(
//                   width: 320,
//                   height: 50,
//                   child: TextField(
//                     controller: skillsController,
//                     textDirection: TextDirection.rtl,
//                     textAlign: TextAlign.right,
//                     decoration: InputDecoration(
//                       filled: true,
//                       fillColor: Colors.white,
//                       border: OutlineInputBorder(
//                         borderSide:
//                         const BorderSide(color: Color(0xFFBCBCBC)),
//                         borderRadius: BorderRadius.circular(30),
//                       ),
//                       enabledBorder: OutlineInputBorder(
//                         borderSide:
//                         const BorderSide(color: Color(0xFFBCBCBC)),
//                         borderRadius: BorderRadius.circular(30),
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 20,),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     TextButton(
//                       onPressed: () {
//                         Navigator.of(context).pop();
//                       },
//                       child: buildText("الغاء",17,FontWeight.bold,const Color(0xFFF59039)),
//                     ),
//                     Container(
//                       height: 40,
//                       width: 80,
//                       decoration: BoxDecoration(
//                           color: const Color(0xFFF59039),
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
//      // title: _buildTitle(),
//       //content: _buildContent(),
//     );
//   }
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
//             onPressed: _addTraining,
//             child: buildText("اضافة", 15, FontWeight.bold, Colors.white),
//           ),
//         ),
//       ],
//     );
//   }
// }

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'dart:convert';
import '../TraineeScreens/NotifationScreen.dart';
import '../UI Components/BuildText.dart';
import 'package:chanceapp/TraineeScreens/notification_provider.dart'; // استيراد NotificationProvider
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

  Future<void> _addTraining() async {
    String position = positionController.text;
    String city = cityController.text;
    String requiredNumber = requiredNumberController.text;
    String skills = skillsController.text;
    String startDate = startDateController.text;
    String endDate = endDateController.text;

    if (position.isEmpty || city.isEmpty || requiredNumber.isEmpty || skills.isEmpty || startDate.isEmpty || endDate.isEmpty) {
      _showMessageDialog("يرجى ملء جميع الحقول.");
      return;
    }

    Map<String, dynamic> trainingData = {
      "trainingPosition": position,
      "city": city,
      "numberOfPositions": int.parse(requiredNumber),
      "requiredSkills": skills.split(",").map((skill) => skill.trim()).toList(),
      "startDate": startDate,
      "endDate": endDate,
    };

    try {
      final response = await http.post(
        Uri.parse('http://192.168.1.14:8085/api/trainings'),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(trainingData),
      );

      if (response.statusCode == 201) {
        _showMessageDialog("تم إضافة التدريب بنجاح.");
        _clearForm();
       // Provider.of<NotificationProvider>(context, listen: false).addNotification("تم إضافة تدريب جديد: $position");
        context.read<NotificationProvider>().addNotification("تم إضافة تدريب جديد: $position");
      } else {
        _showMessageDialog("حدث خطأ أثناء إضافة التدريب.");
      }
    } catch (e) {
      _showMessageDialog("حدث خطأ: ${e.toString()}");
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
                Navigator.of(context).pop(); // إغلاق مربع الحوار
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => NotifationScreen()),
                ); // الانتقال إلى شاشة NotifationScreen
              },
              child: const Text("موافق"),
            ),
          ],
        );
      },
    );
  }

  void _clearForm() {
    positionController.clear();
    cityController.clear();
    requiredNumberController.clear();
    skillsController.clear();
    startDateController.clear();
    endDateController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color(0xFFEFEFEF),
      title: _buildTitle(),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildTextField("المنصب", "منصب التدريب", positionController),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildDateField("تاريخ البدأ", startDateController),
              _buildDateField("تاريخ الانتهاء", endDateController),
            ],
          ),
          const SizedBox(height: 15),
          _buildTextField("المدينة", "اسم المدينة", cityController),
          const SizedBox(height: 15),
          _buildTextField("العدد المطلوب", null, requiredNumberController, isNumeric: true),
          const SizedBox(height: 15),
          _buildTextField("المهارات", null, skillsController),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: buildText("إلغاء", 17, FontWeight.bold, const Color(0xFFF59039)),
              ),
              const SizedBox(width: 10),
              Container(
                height: 40,
                width: 80,
                decoration: BoxDecoration(
                    color: const Color(0xFFF59039),
                    borderRadius: BorderRadius.circular(10)
                ),
                child: TextButton(
                  onPressed: _addTraining,
                  child: buildText("إضافة", 15, FontWeight.bold, Colors.white),
                ),
              ),
            ],
          ),
        ],
      ),
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

  Widget _buildTextField(String label, String? hint, TextEditingController controller, {bool isNumeric = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontFamily: "Tajawal", color: Color(0xFF4A4C4D), fontWeight: FontWeight.bold)),
        const SizedBox(height: 5),
        SizedBox(
          width: 320,
          height: 50,
          child: TextField(
            controller: controller,
            textDirection: TextDirection.rtl,
            textAlign: TextAlign.right,
            keyboardType: isNumeric ? TextInputType.number : TextInputType.text,
            decoration: InputDecoration(
              hintText: hint,
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
        ),
      ],
    );
  }

  Widget _buildDateField(String label, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontFamily: "Tajawal", color: Color(0xFF4A4C4D), fontWeight: FontWeight.bold)),
        const SizedBox(height: 5),
        SizedBox(
          width: 120,
          height: 50,
          child: TextField(
            controller: controller,
            readOnly: true,
            textDirection: TextDirection.rtl,
            textAlign: TextAlign.right,
            onTap: () async {
              DateTime? picked = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(2000),
                lastDate: DateTime(2101),
              );
              if (picked != null) {
                setState(() {
                  controller.text = "${picked.toLocal()}".split(' ')[0];
                });
              }
            },
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              prefixIcon: const Icon(EvaIcons.calendarOutline, color: Color(0xFFBBBBBB)),
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
}
