import 'dart:async';
import 'dart:convert';

import 'package:chanceapp/CompanyScreens/DoneScreen.dart';
import 'package:chanceapp/Screens/Auth.dart';
import 'package:chanceapp/UI%20Components/Button.dart';
import 'package:chanceapp/UI%20Components/CenterAppBar.dart';
import 'package:chanceapp/UI%20Components/textFieldWithoutIcon.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../Core/App_theme.dart';
import '../Screens/LoginScreen.dart';
import '../UI Components/BuildText.dart';
import '../UI Components/Snackbar.dart';

String apiUrl = 'http://192.168.88.42:8085/companies/$emailGeneral';

class ProfileCompany extends StatefulWidget {
  const ProfileCompany(String urlPhoto,{super.key, required String email});

  @override
  State<ProfileCompany> createState() => _ProfileCompanyState();
}

class _ProfileCompanyState extends State<ProfileCompany> {


  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController headquartersController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController industryController = TextEditingController();
  final TextEditingController typeCompanyController = TextEditingController();
  final TextEditingController websiteController = TextEditingController();
  final TextEditingController sizeController = TextEditingController();
  final TextEditingController specializationsController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController foundedYearController = TextEditingController();
  final TextEditingController extendedDescriptionController = TextEditingController();

  //
  // bool isValid() =>
  //     nameController.text.isNotEmpty &&
  //         emailController.text.isNotEmpty &&
  //         phoneNumberController.text.isNotEmpty &&
  //         headquartersController.text.isNotEmpty &&
  //         industryController.text.isNotEmpty &&
  //         websiteController.text.isNotEmpty &&
  //         sizeController.text.isNotEmpty &&
  //         specializationsController.text.isNotEmpty &&
  //         foundedYearController.text.isNotEmpty &&
  //         locationController.text.isNotEmpty &&
  //         descriptionController.text.isNotEmpty &&
  //         extendedDescriptionController.text.isNotEmpty &&
  //         typeCompanyController.text.isNotEmpty;
  //

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: centerAppBar(context, "الملف الشخصي"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 18.0),
        child: Container(
          color: backgroundColor,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 125,
                      width: 125,
                      decoration: const BoxDecoration(
                        color: Color(0xFFE7E7E7),
                        shape: BoxShape.circle,
                      ),
                      clipBehavior: Clip.antiAlias,
                      child: Image.network(
                        urlPhoto,
                        fit: BoxFit.cover,
                      ),
                    ),
                      ],
                    ),
                const SizedBox(
                  height: 40,
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.only(bottom: 8.0, right: 20),
                          child: Text(
                            "الاسم",
                            style: TextStyle(
                                fontFamily: "Tajawal",
                                color: fontColorBlack,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    textFieldWithoutIcon("الاسم", 50, 320,nameController),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.only(bottom: 8.0, right: 20),
                          child: Text(
                            "الايميل",
                            style: TextStyle(
                                fontFamily: "Tajawal",
                                color: fontColorBlack,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    textFieldWithoutIcon("example@gmail.com", 50, 320,emailController),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.only(bottom: 8.0, right: 20),
                          child: Text(
                            "رقم الهاتف",
                            style: TextStyle(
                                fontFamily: "Tajawal",
                                color: fontColorBlack,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    textFieldWithoutIcon("0000000 218+ ", 50, 320,phoneNumberController),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.only(bottom: 8.0, right: 20),
                          child: Text(
                            "تاريخ التأسيس",
                            style: TextStyle(
                                fontFamily: "Tajawal",
                                color: fontColorBlack,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    textFieldWithoutIcon("0000/00/00", 50, 320,foundedYearController),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.only(bottom: 8.0, right: 20),
                          child: Text(
                            "المقر الرئيسي",
                            style: TextStyle(
                                fontFamily: "Tajawal",
                                color: fontColorBlack,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    textFieldWithoutIcon("اسم المدينة", 50, 320,locationController),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.only(bottom: 8.0, right: 20),
                          child: Text(
                            "عنوان المقر",
                            style: TextStyle(
                                fontFamily: "Tajawal",
                                color: fontColorBlack,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    textFieldWithoutIcon("المنطقة - الشارع", 50, 320,headquartersController),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.only(bottom: 8.0, right: 20),
                          child: Text(
                            "المجال",
                            style: TextStyle(
                                fontFamily: "Tajawal",
                                color: fontColorBlack,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    textFieldWithoutIcon("اسم المجال", 50, 320,industryController),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.only(bottom: 8.0, right: 20),
                          child: Text(
                            "حجم الشركة",
                            style: TextStyle(
                                fontFamily: "Tajawal",
                                color: fontColorBlack,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    textFieldWithoutIcon("عدد الموظفين", 50, 320,sizeController),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.only(bottom: 8.0, right: 20),
                          child: Text(
                            "الموقع",
                            style: TextStyle(
                                fontFamily: "Tajawal",
                                color: fontColorBlack,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    textFieldWithoutIcon("https://example", 50, 320,websiteController),
                    const SizedBox(
                      height: 16,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: 8.0, right: 20),
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
                    textFieldWithoutIcon("عامة/خاصة", 50, 320,typeCompanyController),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.only(bottom: 8.0, right: 20),
                          child: Text(
                            "التخصص",
                            style: TextStyle(
                                fontFamily: "Tajawal",
                                color: fontColorBlack,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    textFieldWithoutIcon("اكتب التخصصات..", 50, 320,specializationsController),
                    const SizedBox(
                      height: 16,
                    ),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(bottom: 8.0, right: 20),
                              child: Text(
                                "ملخص عن الشركة",
                                style: TextStyle(
                                    fontFamily: "Tajawal",
                                    color: fontColorBlack,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        textFieldWithoutIcon("اكتب ملخص عن شركتك.. ", 50, 320,descriptionController),
                      ],
                    ),
                    const SizedBox(height: 26),
                    // button("التـالي", context, DoneScreen(),
                    //     Icon(EvaIcons.arrowIosBack, color: primaryColor), addCompany)

            SizedBox(
              width: 300,
              height: 50,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(
                    primaryColor,
                  ),
                ),
                onPressed:() async {
                  // isValid()?
                 addCompany();
                      // showSnackBar(context, "الرجاء تعبئة جميع الحقول");
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Center(
                        child: buildText(
                          "التــالي",
                          16,
                          FontWeight.bold,
                          backgroundColor,
                        ),
                      ),
                    ),
                  ],
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
    );
  }

  Future<void> addCompany() async {
    final companyData = {
      "email": emailController.text.trim(),
      "name": nameController.text.trim(),
      "company": {
        "industry": industryController.text.trim(),
        "size": sizeController.text.trim(),
        "location": locationController.text.trim(),
        "description": descriptionController.text.trim(),
        "foundedYear": foundedYearController.text.trim(),
        "phoneNumber": phoneNumberController.text.trim(),
        "headquarters": headquartersController.text.trim(),
        "website": websiteController.text.trim(),
        "typeCompany": typeCompanyController.text.trim(),
        "specializations": specializationsController.text.trim(),
        "trainings": []
      }
    };


    try {
      showSnackBar(context, "جاري إضافة الشركة...");

      final response = await http.put(
        Uri.parse(apiUrl),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(companyData),
      ).timeout(const Duration(seconds: 10));

      if (response.statusCode == 200) {
        print("تم اضافة الشركة بنجاح");
        Navigator.of(context).push(MaterialPageRoute(builder: (_) => DoneScreen()));
      } else {
        print("فشل في الإضافة: ${response.body}");
        showSnackBar(context, "لم تتم الإضافة، حاول مرة أخرى!", isError: true);
      }
    } on TimeoutException catch (_) {
      showSnackBar(context, "انتهت مدة الاتصال، تأكد من الشبكة وحاول مرة أخرى", isError: true);
    } catch (e) {
      print("خطأ: $e");
      showSnackBar(context, "حدث خطأ غير متوقع، حاول مرة أخرى", isError: true);
    }
  }



}
