import 'dart:convert';

import 'package:chanceapp/CompanyScreens/DoneScreen.dart';
import 'package:chanceapp/UI%20Components/Button.dart';
import 'package:chanceapp/UI%20Components/CenterAppBar.dart';
import 'package:chanceapp/UI%20Components/textFieldWithoutIcon.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../Core/App_theme.dart';
import '../UI Components/BuildText.dart';
import '../UI Components/Snackbar.dart';

const String apiUrl = 'http://192.168.1.8:8085/companies';

class ProfileCompany extends StatefulWidget {
  const ProfileCompany({super.key});

  @override
  State<ProfileCompany> createState() => _ProfileCompanyState();
}

class _ProfileCompanyState extends State<ProfileCompany> {

  final _formKey = GlobalKey<FormState>();

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
                    textFieldWithoutIcon("الاسم", 50, 320,nameController,_formKey),
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
                    textFieldWithoutIcon("example@gmail.com", 50, 320,emailController,_formKey),
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
                    textFieldWithoutIcon("0000000 218+ ", 50, 320,phoneNumberController,_formKey),
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
                    textFieldWithoutIcon("0000/00/00", 50, 320,foundedYearController,_formKey),
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
                    textFieldWithoutIcon("اسم المدينة", 50, 320,locationController,_formKey),
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
                    textFieldWithoutIcon("المنطقة - الشارع", 50, 320,headquartersController,_formKey),
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
                    textFieldWithoutIcon("اسم المجال", 50, 320,industryController,_formKey),
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
                    textFieldWithoutIcon("عدد الموظفين", 50, 320,sizeController,_formKey),
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
                    textFieldWithoutIcon("https://example", 50, 320,websiteController,_formKey),
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
                    textFieldWithoutIcon("عامة/خاصة", 50, 320,typeCompanyController,_formKey),
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
                    textFieldWithoutIcon("اكتب التخصصات..", 50, 320,specializationsController,_formKey),
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
                        textFieldWithoutIcon("اكتب ملخص عن شركتك.. ", 50, 320,descriptionController,_formKey),
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
                 addCompany();

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

    final email = emailController.text.trim();
    final name = nameController.text.trim();
    final industry = industryController.text.trim();
    final size = sizeController.text.trim();
    final location = locationController.text.trim();
    final description = descriptionController.text.trim();
    final foundedYear = foundedYearController.text.trim();
    final phoneNumber = phoneNumberController.text.trim();
    final headquarters = headquartersController.text.trim();
    final website = websiteController.text.trim();
    final typeCompany = typeCompanyController.text.trim();
    final specializations = specializationsController.text.trim();

    if (email.isEmpty || name.isEmpty ||industry.isEmpty || size.isEmpty
    || location.isEmpty || description.isEmpty || foundedYear.isEmpty || phoneNumber.isEmpty || headquarters.isEmpty
    || specializations.isEmpty) {
      showSnackBar(context,"يرجى تعبئة جميع الحقول");
      return;
    }

      final companyData = {
        "email": email,
        "name": name,
        "industry":industry,
        "size": size,
        "location": location,
        "description": description,
        "foundedYear": foundedYear,
        "phoneNumber": phoneNumber,
        "headquarters": headquarters,
        "website" :website,
        "typeCompany":typeCompany,
        "specializations":specializations,
        "trainings":[]
      };

      try {

        final response = await http.post(
          Uri.parse(apiUrl),
          headers: {'Content-Type': 'application/json'},
          body: json.encode(companyData),
        );

        if (response.statusCode == 201) {
          print("تم اضافة الشركة بنجاح");
          showSnackBar(context, "سيتم وضع البيانات في الملف الشخصي");
          // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          //   content: Text('تم إضافة الشركة بنجاح!'),
          // ));
          Navigator.of(context).push(
              MaterialPageRoute(builder: (_)=>DoneScreen())
          );
        } else {
          // التعامل مع الفشل
          print("Failed : ${response.body}");
          showSnackBar(context, "لم تتم الاضافة، حاول مرة اخرى!!",isError: true);
          // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          //   content: Text('فشل في إضافة الشركة.'),
          // ));
        }
      } catch (e) {
        print("Error: $e");
        showSnackBar(context, "حدث خطأ أثناء إضافة الشركة.",isError: true);
        // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        //   content: Text('حدث خطأ أثناء إضافة الشركة.'),
        // ));
      }
    }


}
