// import 'package:flutter/material.dart';
//
// class ProfileCompany extends StatefulWidget {
//   const ProfileCompany({super.key});
//
//   @override
//   State<ProfileCompany> createState() => _ProfileCompanyState();
// }
//
// class _ProfileCompanyState extends State<ProfileCompany> {
//   int currentStep = 0;
//
//   @override
//   Widget build(BuildContext context) {
//     Color backgroundColor = const Color(0xFFF5F5F5);
//     return Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.white,
//           title: Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Image.asset(
//                 "lib/images/logo.png",
//                 height: 20,
//                 width: 20,
//               ),
//               const SizedBox(
//                 width: 10,
//               ),
//               const Text("الملف الشخصي",
//                   style: TextStyle(
//                       fontFamily: "Tajawal",
//                       fontSize: 20,
//                       color: Color(0xFF4A4C4D),
//                       fontWeight: FontWeight.bold)),
//             ],
//           ),
//         ),
//         body: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 40.0),
//           child: Container(
//             color: const Color(0xffEAEAEA),
//             child: Theme(
//               data: ThemeData(
//                 colorScheme: const ColorScheme.light(
//                   primary: Color(0xFFF59039),
//                 ),
//               ),
//               child: Container(
//                 color: backgroundColor,
//                 child: SingleChildScrollView(
//                   child: Column(
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Stack(
//                             alignment: Alignment.center,
//                             children: [
//                               Container(
//                                 height: 125,
//                                 width: 125,
//                                 decoration: BoxDecoration(
//                                   color: const Color(0xFFE7E7E7),
//                                   borderRadius: BorderRadius.circular(80),
//                                 ),
//                               ),
//                               Image.asset(
//                                 "lib/images/ion_camera.png",
//                                 height: 50,
//                                 width: 50,
//                               )
//                             ],
//                           ),
//                         ],
//                       ),
//                       const SizedBox(
//                         height: 40,
//                       ),
//                       Column(
//                         children: [
//                           const Row(
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             children: [
//                               Padding(
//                                 padding:
//                                     EdgeInsets.only(bottom: 8.0, right: 20),
//                                 child: Text(
//                                   "الاسم",
//                                   style: TextStyle(
//                                       fontFamily: "Tajawal",
//                                       color: Color(0xFF4A4C4D),
//                                       fontWeight: FontWeight.bold),
//                                 ),
//                               ),
//                             ],
//                           ),
//                           SizedBox(
//                             width: 320,
//                             height: 50,
//                             child: TextField(
//                               textDirection: TextDirection.rtl,
//                               textAlign: TextAlign.right,
//                               decoration: InputDecoration(
//                                 hintText: "الاسم",
//                                 hintStyle: const TextStyle(
//                                     fontFamily: "Tajawal",
//                                     color: Color(0xFFBBBBBB)),
//                                 filled: true,
//                                 fillColor: Colors.white,
//                                 border: OutlineInputBorder(
//                                   borderSide: const BorderSide(
//                                       color: Color(0xFFBCBCBC)),
//                                   borderRadius: BorderRadius.circular(30),
//                                 ),
//                                 enabledBorder: OutlineInputBorder(
//                                   borderSide: const BorderSide(
//                                       color: Color(0xFFBCBCBC)),
//                                   borderRadius: BorderRadius.circular(30),
//                                 ),
//                               ),
//                             ),
//                           ),
//                           const SizedBox(height: 16),
//                           const Row(
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             children: [
//                               Padding(
//                                 padding:
//                                     EdgeInsets.only(bottom: 8.0, right: 20),
//                                 child: Text(
//                                   "الايميل",
//                                   style: TextStyle(
//                                       fontFamily: "Tajawal",
//                                       color: Color(0xFF4A4C4D),
//                                       fontWeight: FontWeight.bold),
//                                 ),
//                               ),
//                             ],
//                           ),
//                           SizedBox(
//                             width: 320,
//                             height: 50,
//                             child: TextField(
//                               textDirection: TextDirection.rtl,
//                               textAlign: TextAlign.right,
//                               decoration: InputDecoration(
//                                 hintText: "example@gmail.com",
//                                 hintStyle: const TextStyle(
//                                     fontFamily: "Tajawal",
//                                     color: Color(0xFFBBBBBB)),
//                                 filled: true,
//                                 fillColor: Colors.white,
//                                 border: OutlineInputBorder(
//                                   borderSide: const BorderSide(
//                                       color: Color(0xFFBCBCBC)),
//                                   borderRadius: BorderRadius.circular(30),
//                                 ),
//                                 enabledBorder: OutlineInputBorder(
//                                   borderSide: const BorderSide(
//                                       color: Color(0xFFBCBCBC)),
//                                   borderRadius: BorderRadius.circular(30),
//                                 ),
//                               ),
//                             ),
//                           ),
//                           const SizedBox(height: 16),
//                           const Row(
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             children: [
//                               Padding(
//                                 padding:
//                                     EdgeInsets.only(bottom: 8.0, right: 20),
//                                 child: Text(
//                                   "رقم الهاتف",
//                                   style: TextStyle(
//                                       fontFamily: "Tajawal",
//                                       color: Color(0xFF4A4C4D),
//                                       fontWeight: FontWeight.bold),
//                                 ),
//                               ),
//                             ],
//                           ),
//                           SizedBox(
//                             width: 320,
//                             height: 50,
//                             child: TextField(
//                               textAlign: TextAlign.right,
//                               decoration: InputDecoration(
//                                 hintText: "0000000 218+ ",
//                                 hintStyle: const TextStyle(
//                                     fontFamily: "Tajawal",
//                                     color: Color(0xFFBBBBBB)),
//                                 filled: true,
//                                 fillColor: Colors.white,
//                                 border: OutlineInputBorder(
//                                   borderSide: const BorderSide(
//                                       color: Color(0xFFBCBCBC)),
//                                   borderRadius: BorderRadius.circular(30),
//                                 ),
//                                 enabledBorder: OutlineInputBorder(
//                                   borderSide: const BorderSide(
//                                       color: Color(0xFFBCBCBC)),
//                                   borderRadius: BorderRadius.circular(30),
//                                 ),
//                               ),
//                             ),
//                           ),
//                           const SizedBox(height: 16),
//                           const Row(
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             children: [
//                               Padding(
//                                 padding:
//                                     EdgeInsets.only(bottom: 8.0, right: 20),
//                                 child: Text(
//                                   "تاريخ التأسيس",
//                                   style: TextStyle(
//                                       fontFamily: "Tajawal",
//                                       color: Color(0xFF4A4C4D),
//                                       fontWeight: FontWeight.bold),
//                                 ),
//                               ),
//                             ],
//                           ),
//                           SizedBox(
//                             width: 320,
//                             height: 50,
//                             child: TextField(
//                               textDirection: TextDirection.rtl,
//                               textAlign: TextAlign.right,
//                               decoration: InputDecoration(
//                                 hintText: "0000/00/00",
//                                 hintStyle: const TextStyle(
//                                     fontFamily: "Tajawal",
//                                     color: Color(0xFFBBBBBB)),
//                                 filled: true,
//                                 fillColor: Colors.white,
//                                 suffixIcon: const Icon(
//                                     Icons.calendar_month_sharp,
//                                     color: Color(0xFFBBBBBB)),
//                                 border: OutlineInputBorder(
//                                   borderSide: const BorderSide(
//                                       color: Color(0xFFBCBCBC)),
//                                   borderRadius: BorderRadius.circular(30),
//                                 ),
//                                 enabledBorder: OutlineInputBorder(
//                                   borderSide: const BorderSide(
//                                       color: Color(0xFFBCBCBC)),
//                                   borderRadius: BorderRadius.circular(30),
//                                 ),
//                               ),
//                             ),
//                           ),
//                           const SizedBox(height: 16),
//                           const Row(
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             children: [
//                               Padding(
//                                 padding:
//                                     EdgeInsets.only(bottom: 8.0, right: 20),
//                                 child: Text(
//                                   "المقر الرئيسي",
//                                   style: TextStyle(
//                                       fontFamily: "Tajawal",
//                                       color: Color(0xFF4A4C4D),
//                                       fontWeight: FontWeight.bold),
//                                 ),
//                               ),
//                             ],
//                           ),
//                           SizedBox(
//                             width: 320,
//                             height: 50,
//                             child: TextField(
//                               textDirection: TextDirection.rtl,
//                               textAlign: TextAlign.right,
//                               decoration: InputDecoration(
//                                 hintText: "اسم المدينة",
//                                 hintStyle: const TextStyle(
//                                     fontFamily: "Tajawal",
//                                     color: Color(0xFFBBBBBB)),
//                                 filled: true,
//                                 fillColor: Colors.white,
//                                 border: OutlineInputBorder(
//                                   borderSide: const BorderSide(
//                                       color: Color(0xFFBCBCBC)),
//                                   borderRadius: BorderRadius.circular(30),
//                                 ),
//                                 enabledBorder: OutlineInputBorder(
//                                   borderSide: const BorderSide(
//                                       color: Color(0xFFBCBCBC)),
//                                   borderRadius: BorderRadius.circular(30),
//                                 ),
//                               ),
//                             ),
//                           ),
//                           const SizedBox(height: 16),
//                           const Row(
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             children: [
//                               Padding(
//                                 padding:
//                                     EdgeInsets.only(bottom: 8.0, right: 20),
//                                 child: Text(
//                                   "عنوان المقر",
//                                   style: TextStyle(
//                                       fontFamily: "Tajawal",
//                                       color: Color(0xFF4A4C4D),
//                                       fontWeight: FontWeight.bold),
//                                 ),
//                               ),
//                             ],
//                           ),
//                           SizedBox(
//                             width: 320,
//                             height: 50,
//                             child: TextField(
//                               textDirection: TextDirection.rtl,
//                               textAlign: TextAlign.right,
//                               decoration: InputDecoration(
//                                 hintText: "المنطقة - الشارع",
//                                 hintStyle: const TextStyle(
//                                     fontFamily: "Tajawal",
//                                     color: Color(0xFFBBBBBB)),
//                                 filled: true,
//                                 fillColor: Colors.white,
//                                 border: OutlineInputBorder(
//                                   borderSide: const BorderSide(
//                                       color: Color(0xFFBCBCBC)),
//                                   borderRadius: BorderRadius.circular(30),
//                                 ),
//                                 enabledBorder: OutlineInputBorder(
//                                   borderSide: const BorderSide(
//                                       color: Color(0xFFBCBCBC)),
//                                   borderRadius: BorderRadius.circular(30),
//                                 ),
//                               ),
//                             ),
//                           ),
//                           const SizedBox(height: 16,),
//                           const Row(
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             children: [
//                               Padding(
//                                 padding:
//                                 EdgeInsets.only(bottom: 8.0, right: 20),
//                                 child: Text(
//                                   "المجال",
//                                   style: TextStyle(
//                                       fontFamily: "Tajawal",
//                                       color: Color(0xFF4A4C4D),
//                                       fontWeight: FontWeight.bold),
//                                 ),
//                               ),
//                             ],
//                           ),
//                           SizedBox(
//                             width: 320,
//                             height: 50,
//                             child: TextField(
//                               textDirection: TextDirection.rtl,
//                               textAlign: TextAlign.right,
//                               decoration: InputDecoration(
//                                 hintText: "اسم المجال..",
//                                 hintStyle: const TextStyle(
//                                     fontFamily: "Tajawal",
//                                     color: Color(0xFFBBBBBB)),
//                                 filled: true,
//                                 fillColor: Colors.white,
//                                 border: OutlineInputBorder(
//                                   borderSide: const BorderSide(
//                                       color: Color(0xFFBCBCBC)),
//                                   borderRadius: BorderRadius.circular(30),
//                                 ),
//                                 enabledBorder: OutlineInputBorder(
//                                   borderSide: const BorderSide(
//                                       color: Color(0xFFBCBCBC)),
//                                   borderRadius: BorderRadius.circular(30),
//                                 ),
//                               ),
//                             ),
//                           ),
//                           const SizedBox(height: 16,),
//                           const Row(
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             children: [
//                               Padding(
//                                 padding:
//                                 EdgeInsets.only(bottom: 8.0, right: 20),
//                                 child: Text(
//                                   "حجم الشركة",
//                                   style: TextStyle(
//                                       fontFamily: "Tajawal",
//                                       color: Color(0xFF4A4C4D),
//                                       fontWeight: FontWeight.bold),
//                                 ),
//                               ),
//                             ],
//                           ),
//                           SizedBox(
//                             width: 320,
//                             height: 50,
//                             child: TextField(
//                               textDirection: TextDirection.rtl,
//                               textAlign: TextAlign.right,
//                               decoration: InputDecoration(
//                                 hintText: "عدد الموظفين",
//                                 hintStyle: const TextStyle(
//                                     fontFamily: "Tajawal",
//                                     color: Color(0xFFBBBBBB)),
//                                 filled: true,
//                                 fillColor: Colors.white,
//                                 border: OutlineInputBorder(
//                                   borderSide: const BorderSide(
//                                       color: Color(0xFFBCBCBC)),
//                                   borderRadius: BorderRadius.circular(30),
//                                 ),
//                                 enabledBorder: OutlineInputBorder(
//                                   borderSide: const BorderSide(
//                                       color: Color(0xFFBCBCBC)),
//                                   borderRadius: BorderRadius.circular(30),
//                                 ),
//                               ),
//                             ),
//                           ),
//                           const SizedBox(height: 16,),
//                           const Row(
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             children: [
//                               Padding(
//                                 padding:
//                                 EdgeInsets.only(bottom: 8.0, right: 20),
//                                 child: Text(
//                                   "الموقع",
//                                   style: TextStyle(
//                                       fontFamily: "Tajawal",
//                                       color: Color(0xFF4A4C4D),
//                                       fontWeight: FontWeight.bold),
//                                 ),
//                               ),
//                             ],
//                           ),
//                           SizedBox(
//                             width: 320,
//                             height: 50,
//                             child: TextField(
//                               textDirection: TextDirection.rtl,
//                               textAlign: TextAlign.right,
//                               decoration: InputDecoration(
//                                 hintText: "https://example",
//                                 hintStyle: const TextStyle(
//                                     fontFamily: "Tajawal",
//                                     color: Color(0xFFBBBBBB)),
//                                 filled: true,
//                                 fillColor: Colors.white,
//                                 border: OutlineInputBorder(
//                                   borderSide: const BorderSide(
//                                       color: Color(0xFFBCBCBC)),
//                                   borderRadius: BorderRadius.circular(30),
//                                 ),
//                                 enabledBorder: OutlineInputBorder(
//                                   borderSide: const BorderSide(
//                                       color: Color(0xFFBCBCBC)),
//                                   borderRadius: BorderRadius.circular(30),
//                                 ),
//                               ),
//                             ),
//                           ),
//                           const SizedBox(height: 16,),
//                           const Row(
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             children: [
//                               Padding(
//                                 padding:
//                                 EdgeInsets.only(bottom: 8.0, right: 20),
//                                 child: Text(
//                                   "نوع الشركة",
//                                   style: TextStyle(
//                                       fontFamily: "Tajawal",
//                                       color: Color(0xFF4A4C4D),
//                                       fontWeight: FontWeight.bold),
//                                 ),
//                               ),
//                             ],
//                           ),
//                           SizedBox(
//                             width: 320,
//                             height: 50,
//                             child: TextField(
//                               textDirection: TextDirection.rtl,
//                               textAlign: TextAlign.right,
//                               decoration: InputDecoration(
//                                 hintText: "عامة/خاصة",
//                                 hintStyle: const TextStyle(
//                                     fontFamily: "Tajawal",
//                                     color: Color(0xFFBBBBBB)),
//                                 filled: true,
//                                 fillColor: Colors.white,
//                                 border: OutlineInputBorder(
//                                   borderSide: const BorderSide(
//                                       color: Color(0xFFBCBCBC)),
//                                   borderRadius: BorderRadius.circular(30),
//                                 ),
//                                 enabledBorder: OutlineInputBorder(
//                                   borderSide: const BorderSide(
//                                       color: Color(0xFFBCBCBC)),
//                                   borderRadius: BorderRadius.circular(30),
//                                 ),
//                               ),
//                             ),
//                           ),
//                           const SizedBox(height: 16,),
//                           const Row(
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             children: [
//                               Padding(
//                                 padding:
//                                 EdgeInsets.only(bottom: 8.0, right: 20),
//                                 child: Text(
//                                   "التخصص",
//                                   style: TextStyle(
//                                       fontFamily: "Tajawal",
//                                       color: Color(0xFF4A4C4D),
//                                       fontWeight: FontWeight.bold),
//                                 ),
//                               ),
//                             ],
//                           ),
//                           SizedBox(
//                             width: 320,
//                             height: 50,
//                             child: TextField(
//                               textDirection: TextDirection.rtl,
//                               textAlign: TextAlign.right,
//                               decoration: InputDecoration(
//                                 hintText: "اكتب التخصصات..",
//                                 hintStyle: const TextStyle(
//                                     fontFamily: "Tajawal",
//                                     color: Color(0xFFBBBBBB)),
//                                 filled: true,
//                                 fillColor: Colors.white,
//                                 border: OutlineInputBorder(
//                                   borderSide: const BorderSide(
//                                       color: Color(0xFFBCBCBC)),
//                                   borderRadius: BorderRadius.circular(30),
//                                 ),
//                                 enabledBorder: OutlineInputBorder(
//                                   borderSide: const BorderSide(
//                                       color: Color(0xFFBCBCBC)),
//                                   borderRadius: BorderRadius.circular(30),
//                                 ),
//                               ),
//                             ),
//                           ),
//                           const SizedBox(height: 16,),
//                           _buildSummaryField(),
//                           const SizedBox(height: 26),
//                           _buildNextButton()
//
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ));
//   }

import 'package:chanceapp/CompanyScreens/DoneScreen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:chanceapp/CompanyScreens/jsoncompany.dart';

class ProfileCompany extends StatefulWidget {
  const ProfileCompany({super.key});

  @override
  State<ProfileCompany> createState() => _ProfileCompanyState();
}

class _ProfileCompanyState extends State<ProfileCompany> {
  int currentStep = 0;

  // Controllers for input fields
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _foundedYearController = TextEditingController();
  final TextEditingController _headquartersController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _industryController = TextEditingController();
  final TextEditingController _sizeController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _companyTypeController = TextEditingController();
  final TextEditingController _specializationController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  // Function to add company
  Future<void> addCompany(Jsoncompany company) async {
    final url = 'http://192.168.1.14:8085/companies'; // Your API endpoint
    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(company.toJson()), // Send data as JSON
    );

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
  }

  @override
  Widget build(BuildContext context) {
    Color backgroundColor = const Color(0xFFF5F5F5);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: _buildAppBarTitle(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 40.0),
        child: Container(
          width: double.infinity,
          color: const Color(0xffEAEAEA),
          child: Theme(
            data: ThemeData(
              colorScheme: const ColorScheme.light(
                primary: Color(0xFFF59039),
              ),
            ),
            child: Container(
              width: double.infinity,
              height: MediaQuery
                  .of(context)
                  .size
                  .height * 0.90,
              color: backgroundColor,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _buildProfileImage(),
                    const SizedBox(height: 40),
                    _buildInputFields(),
                    const SizedBox(height: 26),
                    _buildNextButton(context),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Row _buildAppBarTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          "lib/images/logo.png",
          height: 20,
          width: 20,
        ),
        const SizedBox(width: 10),
        const Text(
          "الملف الشخصي",
          style: TextStyle(
            fontFamily: "Tajawal",
            fontSize: 20,
            color: Color(0xFF4A4C4D),
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Stack _buildProfileImage() {
    return Stack(
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
        ),
      ],
    );
  }

  Column _buildInputFields() {
    return Column(
      children: [
        _buildInputField("الاسم", "الاسم", controller: _nameController),
        _buildInputField(
            "الايميل", "example@gmail.com", controller: _emailController),
        _buildInputField(
            "رقم الهاتف", "0000000 218+", controller: _phoneController),
        _buildInputField("تاريخ التأسيس", "0000/00/00",
            suffixIcon: Icons.calendar_month_sharp,
            controller: _foundedYearController),
        _buildInputField("المقر الرئيسي", "اسم المدينة",
            controller: _headquartersController),
        _buildInputField(
            "عنوان المقر", "المنطقة - الشارع", controller: _addressController),
        _buildInputField(
            "المجال", "اسم المجال..", controller: _industryController),
        _buildInputField(
            "حجم الشركة", "عدد الموظفين", controller: _sizeController),
        _buildInputField(
            "الموقع", "https://example", controller: _locationController),
        _buildInputField(
            "نوع الشركة", "عامة/خاصة", controller: _companyTypeController),
        _buildInputField(
            "التخصص", "اكتب التخصصات..", controller: _specializationController),
        _buildSummaryField(),
      ],
    );
  }

  Widget _buildInputField(String label, String hint,
      {IconData? suffixIcon, TextEditingController? controller}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0, right: 20),
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
          width: 320,
          height: 50,
          child: TextField(
            controller: controller,
            textDirection: TextDirection.rtl,
            textAlign: TextAlign.right,
            decoration: InputDecoration(
              hintText: hint,
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
              suffixIcon: suffixIcon != null
                  ? Icon(suffixIcon, color: const Color(0xFFBBBBBB))
                  : null,
            ),
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildSummaryField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(bottom: 8.0, right: 20),
          child: Text(
            "ملخص عن الشركة",
            style: TextStyle(
              fontFamily: "Tajawal",
              color: Color(0xFF4A4C4D),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          width: 320,
          height: 50,
          child: TextField(
            controller: _descriptionController,
            textDirection: TextDirection.rtl,
            textAlign: TextAlign.right,
            decoration: InputDecoration(
              hintText: "اكتب ملخص عن شركتك.. ",
              hintStyle: const TextStyle(
                fontFamily: "Tajawal",
                fontSize: 15,
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
        ),
      ],
    );
  }

  Widget _buildNextButton(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFF59039),
        ),
        onPressed: () async {
          // Gather input from the form
          Jsoncompany newCompany = Jsoncompany(
            userId: 1,
            // Sample data, replace with actual input
            name: _nameController.text,
            industry: _industryController.text,
            size: _sizeController.text,
            location: _locationController.text,
            description: _descriptionController.text,
            foundedYear: int.tryParse(_foundedYearController.text) ?? 0,
            // Convert to int
            extendedDescription: "Detailed Description",
            // Placeholder
            email: _emailController.text,
            phoneNumber: _phoneController.text,
            headquarters: _headquartersController.text,
            headquartersAddress: _addressController.text,
          );

          // Call addCompany() method
          await addCompany(newCompany);

          // Navigate to the next screen
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  DoneScreen(), // استبدل NextScreen بالشاشة التي تريد الانتقال إليها
            ),
          );
        },
        child: const Text(
          "التــالي",
          style: TextStyle(
            fontFamily: "Tajawal",
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
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

