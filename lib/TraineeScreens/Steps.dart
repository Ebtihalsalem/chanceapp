
import 'package:chanceapp/Core/App_theme.dart';
import 'package:chanceapp/TraineeScreens/AfterCv.dart';
import 'package:chanceapp/TraineeScreens/stepsjson.dart';
import 'package:chanceapp/TraineeScreens/user_information_step1_entity.dart';
import 'package:chanceapp/TraineeScreens/user_information_step2_entity.dart';
import 'package:chanceapp/UI Components/CenterAppBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../UI Components/BuildText.dart';
import '../UI Components/textFieldWithoutIcon.dart';
import 'AddCv.dart';
import 'AddCv3.dart';
import 'AssCv2.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:chanceapp/UIComponents/Basics.dart';
class UserInformationStep2Entity {
  final String education;
  final String workExperience;
  final String courses;

  UserInformationStep2Entity({
    required this.education,
    required this.workExperience,
    required this.courses,
  });

  Map<String, dynamic> toJson() {
    return {
      'education': education,
      'workExperience': workExperience,
      'courses': courses,
    };
  }
}
class UserInformationStep3Entity {
  final String personalSkills;
  final String computerSkills;
  final String languages;

  UserInformationStep3Entity({
    required this.personalSkills,
    required this.computerSkills,
    required this.languages,
  });

  Map<String, dynamic> toJson() {
    return {
      'personalSkills': personalSkills,
      'computerSkills': computerSkills,
      'languages': languages,
    };
  }
}
class UserInformationStep4Entity {
  final String activities;
  final String volunteerWork;
  final String projects;

  UserInformationStep4Entity({
    required this.activities,
    required this.volunteerWork,
    required this.projects,
  });

  Map<String, dynamic> toJson() {
    return {
      'activities': activities,
      'volunteerWork': volunteerWork,
      'projects': projects,
    };
  }
}
// كرر نفس الشيء لبقية الخطوات
class Steps extends StatefulWidget {
  const Steps({super.key});
  @override
  State<Steps> createState() => _StepsState();
}
class _StepsState extends State<Steps> {

  Future<Map<String, String>?> showAddCvDialog({
    required BuildContext context,
    required String title,
    required String name,
    required String hintText1,
    required String hintText2,
    required String hintText3,
  }) {
    final TextEditingController firstFieldController = TextEditingController();
    final TextEditingController secondFieldController = TextEditingController();
    final TextEditingController thirdFieldController = TextEditingController();

    bool isFormValid() {
      return firstFieldController.text.isNotEmpty &&
          secondFieldController.text.isNotEmpty &&
          thirdFieldController.text.isNotEmpty;
    }

    return showDialog<Map<String, String>>(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: primaryColor,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("lib/images/logo.png", height: 18, width: 18),
              const SizedBox(width: 10),
              buildTextTitle(title, 18, FontWeight.bold),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          buildTextTitle(name, 12, FontWeight.bold),
                          const SizedBox(height: 8),
                          textFieldWithoutIcon2(hintText1, 50, 320, controller: firstFieldController),
                          const SizedBox(height: 15),
                          buildTextTitle("تاريخ الحصول عليها", 12, FontWeight.bold),
                          textFieldWithoutIcon2(hintText2, 50, 320, controller: secondFieldController),
                          const SizedBox(height: 15),
                          buildTextTitle("مكان الحصول عليها", 12, FontWeight.bold),
                          textFieldWithoutIcon2(hintText3, 50, 320, controller: thirdFieldController),
                          const SizedBox(height: 30),
                        ],
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
                          child: TextButton(
                            onPressed: () {
                              if (isFormValid()) {
                                Navigator.of(context).pop({
                                  'degree': firstFieldController.text,
                                  'date': secondFieldController.text,
                                  'institution': thirdFieldController.text,
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
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  int currentStep = 0;
  // TextEditingController variables for all steps
  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final birthDateController = TextEditingController();
  final cityController = TextEditingController();
  final addressController = TextEditingController();
  final educationController = TextEditingController();
  final workExperienceController = TextEditingController();
  final coursesController = TextEditingController();
  final personalSkillsController = TextEditingController();
  final computerSkillsController = TextEditingController();
  final languagesController = TextEditingController();
  final activitiesController = TextEditingController();
  final volunteerWorkController = TextEditingController();
  final projectsController = TextEditingController();
  bool isStepOneValid() =>
      fullNameController.text.isNotEmpty &&
          isEmailValid(emailController.text) &&
          isPhoneNumberValid(phoneNumberController.text) &&
          isDateValid(birthDateController.text) &&  // Correct placement of isDateValid
          cityController.text.isNotEmpty &&
          addressController.text.isNotEmpty;
  bool isStepTwoValid() => educationController.text.isNotEmpty &&
      workExperienceController.text.isNotEmpty &&
      coursesController.text.isNotEmpty;
  bool isStepThreeValid() => personalSkillsController.text.isNotEmpty ||
      computerSkillsController.text.isNotEmpty ||
      languagesController.text.isNotEmpty;
  bool isStepFourValid() => activitiesController.text.isNotEmpty ||
      volunteerWorkController.text.isNotEmpty ||
      projectsController.text.isNotEmpty;
  bool isEmailValid(String email) {
    // Regular expression for validating an email
    final RegExp emailRegExp = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    return emailRegExp.hasMatch(email);
  }
  bool isPhoneNumberValid(String phoneNumber) {
    // Regular expression for validating a Libyan phone number
    final RegExp phoneRegExp = RegExp(
      r'^\+218[0-9]{9}$',
    );
    return phoneRegExp.hasMatch(phoneNumber);
  }
  bool isDateValid(String date) {
    // Regular expression for validating the date format DD/MM/YYYY
    final RegExp dateRegExp = RegExp(
      r'^(0[1-9]|[12][0-9]|3[01])/(0[1-9]|1[0-2])/\d{4}$',
    );

    // Check if the date format is valid
    if (!dateRegExp.hasMatch(date)) {
      return false; // Invalid format
    }

    // Split the date into day, month, and year
    List<String> parts = date.split('/');
    int day = int.parse(parts[0]);
    int month = int.parse(parts[1]);
    int year = int.parse(parts[2]);

    // Check for valid days in month
    if (month == 2) {
      // Check for leap year
      bool isLeapYear = (year % 4 == 0 && year % 100 != 0) || (year % 400 == 0);
      if (day > (isLeapYear ? 29 : 28)) {
        return false; // Invalid day for February
      }
    } else if ([4, 6, 9, 11].contains(month)) {
      if (day > 30) {
        return false; // Invalid day for April, June, September, November
      }
    } else {
      if (day > 31) {
        return false; // Invalid day for other months
      }
    }

    return true; // Valid date
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: centerAppBar(context, "الملف الشخصي"),
      body: Container(
        color: primaryColor,
        child: Theme(
          data: ThemeData(
            colorScheme: ColorScheme.light(primary: secondaryColor),
            canvasColor: primaryColor,
          ),
          child: Stepper(
            type: StepperType.horizontal,
            steps: getSteps(),
            currentStep: currentStep,
            onStepContinue: onStepContinue,
            controlsBuilder: (BuildContext context, ControlsDetails details) {
              return controls(details);
            },
          ),
        ),
      ),
    );
  }Future<void> onStepContinue() async {
    if (currentStep == 0) {
      // Check the validity of step one inputs
      if (!isStepOneValid()) {
        // Show error message
        showSnackBar('يجب ملء جميع الحقول للانتقال إلى الخطوة التالية');
      } else {
        // If all validations pass, send data to the API
        await saveStep1Data();
        setState(() => currentStep += 1);
      }
    } else if (currentStep == 1) {
      // Validate step two
      if (!isStepTwoValid()) {
        showSnackBar('يجب ملء جميع الحقول في الخطوة الثانية');
      } else {
        // Send step 2 data
        await saveStep2Data();
        setState(() => currentStep += 1);
      }
    } else if (currentStep == 2) {
      // Validate step three
      if (!isStepThreeValid()) {
        showSnackBar('يجب ملء جميع الحقول في الخطوة الثالثة');
      } else {
        // Send step 3 data
        await saveStep3Data();
        setState(() => currentStep += 1);
      }
    } else if (currentStep == 3) {
      // Validate step four
      if (!isStepFourValid()) {
        showSnackBar('يجب ملء جميع الحقول في الخطوة الرابعة');
      } else {
        // Send step 4 data
        await saveStep4Data();
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const AfterCv()),
        );
      }
    }
  }

  Future<void> saveStep1Data() async {
    final step1Data = UserInformationStep1Entity(
      email: emailController.text,
      name: fullNameController.text,
      phoneNumber: phoneNumberController.text,
      birthDate: birthDateController.text,
      city: cityController.text,
      address: addressController.text,
    );

    final response = await http.post(
      Uri.parse('http://192.168.1.14:8085/users/step1'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(step1Data.toJson()),
    );

    // Log the response status and body
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode != 201) {
      throw Exception('Failed to save step 1 data');
    }
  }

  Future<void> saveStep2Data() async {
    final step2Data = UserInformationStep2Entity(
      education: educationController.text,
      workExperience: workExperienceController.text,
      courses: coursesController.text,
    );

    final response = await http.post(
      Uri.parse('http://192.168.1.14:8085/users/step2'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(step2Data.toJson()),
    );

    // Log the response status and body
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 201) {
      // بيانات تم تخزينها بنجاح
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('تم تخزين البيانات بنجاح')),
      );
    } else {
      // حدث خطأ في التخزين
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('فشل في تخزين البيانات')),
      );
    }
  }
  Future<void> saveStep3Data() async {
    final step3Data = UserInformationStep3Entity(
      personalSkills: personalSkillsController.text,
      computerSkills: computerSkillsController.text,
      languages: languagesController.text,
    );

    final response = await http.post(
      Uri.parse('http://192.168.1.14:8085/users/step3'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(step3Data.toJson()),
    );

    // Log the response status and body
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 201) {
      // بيانات تم تخزينها بنجاح
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('تم تخزين البيانات بنجاح')),
      );
    } else {
      // حدث خطأ في التخزين
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('فشل في تخزين البيانات')),
      );
    }
  }

  Future<void> saveStep4Data() async {
    final step4Data = UserInformationStep4Entity(
      activities: activitiesController.text,
      volunteerWork: volunteerWorkController.text,
      projects: projectsController.text,
    );

    final response = await http.post(
      Uri.parse('http://192.168.1.14:8085/users/step4'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(step4Data.toJson()),
    );

    // Log the response status and body
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 201) {
      // بيانات تم تخزينها بنجاح
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('تم تخزين البيانات بنجاح')),
      );
    } else {
      // حدث خطأ في التخزين
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('فشل في تخزين البيانات')),
      );
    }
  }
  void showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      ),
    );
  }
  Column controls(ControlsDetails details) {
    return Column(
      children: [
        const SizedBox(height: 26),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Container(
              height: 35,
              width: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: const Color(0xFFF59039)),
              ),
              child: TextButton(
                onPressed: details.onStepCancel,
                style: TextButton.styleFrom(
                  textStyle: const TextStyle(
                    fontFamily: "Tajawal",
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                child: const Text('رجـوع'),
              ),
            ),
            const SizedBox(width: 10),
            Container(
              height: 35,
              width: 45,
              decoration: BoxDecoration(
                color: const Color(0xFFF59039),
                borderRadius: BorderRadius.circular(10),
              ),
              child: IconButton(
                onPressed: details.onStepContinue,
                icon: const Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
  List<Step> getSteps() => [
    stepOne(),
    stepTwo(),
    stepThree(),
    stepFour(),
  ];
  Step stepOne() {
    return Step(
      isActive: currentStep >= 0,
      title: const Text(" "),
      content: Column(
        children: <Widget>[
          buildProfileImage(),
          const SizedBox(height: 15),
          buildHeaderText("المعلومات الشخصية"),
          const SizedBox(height: 8),
          buildPersonalInfoFields(),
        ],
      ),
    );
  }
  Widget buildProfileImage() {
    return Row(
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
            ),
          ],
        ),
      ],
    );
  }
  Padding buildHeaderText(String title) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          buildText(title, 16, FontWeight.bold, secondaryColor),
        ],
      ),
    );
  }

  Column buildPersonalInfoFields() {
    return Column(
      children: [
        buildLabeledTextField("الاسم كامل", fullNameController),
        buildLabeledTextField("الايميل", emailController),
        buildLabeledTextField("رقم الهاتف", phoneNumberController),
        buildLabeledTextField("تاريخ الميلاد", birthDateController),
        buildLabeledTextField("المدينة", cityController),
        buildLabeledTextField("عنوان السكن", addressController),
      ],
    );
  }
  Column buildLabeledTextField(String label, TextEditingController controller) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0, right: 20),
              child: buildTextTitle(label, 14, FontWeight.bold),
            ),
          ],
        ),
        buildTextFieldWithController(label, controller),
        const SizedBox(height: 16),
      ],
    );
  }
  Widget buildTextFieldWithController(String hint, TextEditingController controller) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          hintText: hint,
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
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: secondaryColor),
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    );
  }
  Future<Map<String, String>?> showAddCvDialog234({
    required BuildContext context,
    required String title,
    required String name,
    required String hintText1,
    required String hintText2,
    required String hintText3,
  }) {
    final TextEditingController firstFieldController = TextEditingController();
    final TextEditingController secondFieldController = TextEditingController();
    final TextEditingController thirdFieldController = TextEditingController();
    bool isFormValid() {
      return firstFieldController.text.isNotEmpty &&
          secondFieldController.text.isNotEmpty &&
          thirdFieldController.text.isNotEmpty;
    }
    return showDialog<Map<String, String>>(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: primaryColor,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("lib/images/logo.png", height: 18, width: 18),
              const SizedBox(width: 10),
              buildTextTitle(title, 18, FontWeight.bold),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          buildTextTitle(name, 12, FontWeight.bold),
                          const SizedBox(height: 8),
                          textFieldWithoutIcon2(hintText1, 50, 320, controller: firstFieldController),
                          const SizedBox(height: 15),
                          buildTextTitle("تاريخ الحصول عليها", 12, FontWeight.bold),
                          textFieldWithoutIcon2(hintText2, 50, 320, controller: secondFieldController),
                          const SizedBox(height: 15),
                          buildTextTitle("مكان الحصول عليها", 12, FontWeight.bold),
                          textFieldWithoutIcon2(hintText3, 50, 320, controller: thirdFieldController),
                          const SizedBox(height: 30),
                        ],
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
                          child: TextButton(
                            onPressed: () {
                              if (isFormValid()) {
                                Navigator.of(context).pop({
                                  'degree': firstFieldController.text,
                                  'date': secondFieldController.text,
                                  'institution': thirdFieldController.text,
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
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
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
  Step stepTwo() {
    return Step(
      isActive: currentStep >= 1,
      title: const Text(" "),
      content: Column(
        children: <Widget>[
          buildSectionTitle("المؤهلات العلمية والخبرات"),
          const SizedBox(height: 8),
          buildEducationSection(),
          const SizedBox(height: 16),
          buildWorkExperienceSection(),
          const SizedBox(height: 16),
          buildCoursesSection(),
        ],
      ),
    );
  }
  Widget buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          buildText(title, 16, FontWeight.bold, secondaryColor),
        ],
      ),
    );}
  Widget buildInputSection({required String title, required VoidCallback onPressed}) {
      return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0, right: 20),
                child: buildTextTitle(title, 14, FontWeight.bold),
              ),
            ],
          ),
          Container(
            width: 320,
            height: 50,
            decoration: BoxDecoration(
              color: const Color(0xFFFDFDFD),
              borderRadius: BorderRadius.circular(30),
              border: Border.all(color: const Color(0xFFBCBCBC)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.only(right: 15.0),
                  child: Text(
                    "اضافة..",
                    style: TextStyle(color: Color(0xFFBBBBBB)),
                  ),
                ),
                IconButton(
                  onPressed: onPressed,
                  icon: const Icon(Icons.add, color: Color(0xFFBBBBBB)),
                ),
              ],
            ),
          ),
        ],
      );
    }
  Widget buildEducationSection() {
    return buildInputSection(
      title: "التعليم",
      onPressed: () {
        showAddCvDialog(
          context: context,
          title: "التعليم",
          name: "نوع الشهادة",
          hintText1: "اسم الشهادة",
          hintText2: "تاريخ الحصول عليها",
          hintText3: "مكان الحصول عليها",
        ).then((result) {
          if (result != null) {
            educationController.text = result['degree'] ?? '';
          }
        });
      },
    );
  }
  Widget buildWorkExperienceSection() {
    return buildInputSection(
      title: "الخبرة العملية",
      onPressed: () {
        showAddCvDialog(
          context: context,
          title: "الخبرة العملية",
          name: "اسم الدورة",
          hintText1: "اسم الدورة",
          hintText2: "تاريخ الحصول عليها",
          hintText3: "مكان الحصول عليها",
        ).then((result) {
          if (result != null) {
            workExperienceController.text = result['experience'] ?? '';
          }
        });
      },
    );
  }
  Widget buildCoursesSection() {
    return buildInputSection(
      title: "الدورات التدريبية",
      onPressed: () {
        showAddCvDialog(
          context: context,
          title: "الدورات التدريبية",
          name: "اسم الدورة",
          hintText1: "اسم الدورة",
          hintText2: "تاريخ الحصول عليها",
          hintText3: "مكان الحصول عليها",
        ).then((result) {
          if (result != null) {
            coursesController.text = result['course'] ?? '';
            setState(() {
              currentStep = 2; // الانتقال إلى الخطوة الثالثة
            });
          }
        });
      },
    );
  }
  Step stepThree() {
    return Step(
      isActive: currentStep >= 2,
      title: const Text(" "),
      content: Column(
        children: <Widget>[
          buildSectionTitle("المهــارات"),
          const SizedBox(height: 8),
          buildPersonalSkillsSection(),
          const SizedBox(height: 16),
          buildComputerSkillsSection(),
          const SizedBox(height: 16),
          buildLanguagesSection(),
        ],
      ),
    );
  }
  Widget buildPersonalSkillsSection() {
    return buildInputSection(
      title: "المهـــارات الشخصية",
      onPressed: () {
        showAddCvDialog(
          context: context,
          title: "المهارات الشخصية",
          name: "المهارة",
          hintText1: "اسم الدورة",
          hintText2: "تاريخ الحصول عليها",
          hintText3: "مكان الحصول عليها",
        ).then((result) {
          if (result != null) {
            personalSkillsController.text = result['degree'] ?? '';
          }
        });
      },
    );
  }
  Widget buildComputerSkillsSection() {
    return buildInputSection(
      title: "مهـــارات الحاسوب",
      onPressed: () {
        showAddCvDialog(
          context: context,
          title: "مهارات الحاسوب",
          name: "المهارة",
          hintText1: "اسم الدورة",
          hintText2: "تاريخ الحصول عليها",
          hintText3: "مكان الحصول عليها",
        ).then((result) {
          if (result != null) {
            computerSkillsController.text = result['experience'] ?? '';
          }
        });
      },
    );
  }
  Widget buildLanguagesSection() {
    return buildInputSection(
      title: "اللغات",
      onPressed: () {
        showAddCvDialog(
          context: context,
          title: "اللغات",
          name: "اللغة",
          hintText1: "اسم الدورة",
          hintText2: "تاريخ الحصول عليها",
          hintText3: "مكان الحصول عليها",
        ).then((result) {
          if (result != null) {
            languagesController.text = result['course'] ?? '';
            setState(() {
              currentStep = 3; // الانتقال إلى الخطوة الثالثة
            });
          }
        });
      },
    );
  }
  Step stepFour() {
    return Step(
      isActive: currentStep >= 3,
      title: const Text(" "),
      content: Column(
        children: <Widget>[
          buildSectionTitle("النشاطات والاعمال الأخرى"),
          const SizedBox(height: 8),
          buildActivitiesSection(),
          const SizedBox(height: 16),
          buildVolunteerWorkSection(),
          const SizedBox(height: 16),
          buildProjectsSection(),
        ],
      ),
    );
  }
  Widget buildActivitiesSection() {
    return buildInputSection(
      title: "النشاطات",
      onPressed: () {
        showAddCvDialog(
          context: context,
          title: "النشاطات",
          name: "اسم النشاط",
          hintText1: "اسم الدورة",
          hintText2: "تاريخ الحصول عليها",
          hintText3: "مكان الحصول عليها",
        ).then((result) {
          if (result != null) {
            activitiesController.text = result['degree'] ?? '';
          }
        });
      },
    );
  }
  Widget buildVolunteerWorkSection() {
    return buildInputSection(
      title: "الأعمال التطوعية",
      onPressed: () {
        showAddCvDialog(
          context: context,
          title: "الأعمال التطوعية",
          name: "اسم العمل",
          hintText1: "اسم الدورة",
          hintText2: "تاريخ الحصول عليها",
          hintText3: "مكان الحصول عليها",
        ).then((result) {
          if (result != null) {
            volunteerWorkController.text = result['experience'] ?? '';
          }
        });
      },
    );
  }
  Widget buildProjectsSection() {
    return buildInputSection(
      title: "المشاريع",
      onPressed: () {
        showAddCvDialog(
          context: context,
          title: "المشاريع",
          name: "اسم المشروع",
          hintText1: "اسم الدورة",
          hintText2: "تاريخ الحصول عليها",
          hintText3: "مكان الحصول عليها",
        ).then((result) {
          if (result != null) {
            projectsController.text = result['course'] ?? '';
            setState(() {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => AfterCv()), // شاشة AfterCv
              );
            });
          }
        });
      },
    );
  }}

// Widget buildEducationSection() {
//   return buildInputSection(
//     title: "التعليم",
//     onPressed: () {
//       showDialog(
//         context: context,
//         builder: (context) {
//           //return AddCv(title: "التعليم", name: "نوع الشهادة");
//           return AddCvDialog(
//             title: "التعليم",
//             name: "نوع الشهادة",
//             hintText1: "اسم الشهادة",
//             hintText2: "تاريخ الحصول عليها",
//             hintText3: "مكان الحصول عليها",
//           );
//         },
//       ).then((result) {
//         if (result != null) {
//           educationController.text = result['degree'];
//         }
//       });
//     },
//   );
// }
// Widget buildWorkExperienceSection() {
//   return buildInputSection(
//     title: "الخبرة العملية",
//     onPressed: () {
//       showDialog(
//         context: context,
//         builder: (context) {
//           //return AddCv(title: "الخبرة العملية", name: "نوع العمل");
//           return AddCvDialog(
//             title: "الخبرة العملية",
//             name: "اسم الدورة",
//             hintText1: "اسم الدورة",
//             hintText2: "تاريخ الحصول عليها",
//             hintText3: "مكان الحصول عليها",
//           );
//         },
//       ).then((result) {
//         if (result != null) {
//           workExperienceController.text = result['experience'];
//         }
//       });
//     },
//   );
// }
// Widget buildCoursesSection() {
//   return buildInputSection(
//     title: "الدورات التدريبية",
//     onPressed: () {
//       showDialog(
//         context: context,
//         builder: (context) {
//           //return AddCv(title: "الدورات التدريبية", name: "اسم الدورة");
//           return AddCvDialog(
//             title: "الدورات التدريبية",
//             name: "اسم الدورة",
//             hintText1: "اسم الدورة",
//             hintText2: "تاريخ الحصول عليها",
//             hintText3: "مكان الحصول عليها",
//           );
//         },
//       ).then((result) {
//         if (result != null) {
//           coursesController.text = result['course'];
//           setState(() {
//             currentStep = 2; // الانتقال إلى الخطوة الثالثة
//           });
//         }
//       });
//     },
//   );
// }


// Widget buildPersonalSkillsSection() {
//   return buildInputSection(
//     title: "المهـــارات الشخصية",
//     onPressed: () {
//       showDialog(
//         context: context,
//         builder: (context) {
//          // return const AddCv2(title: "المهارات الشخصية", name: "المهارة");
//           return AddCvDialog(
//             title: "المهارات الشخصية",
//             name: "المهارة",
//             hintText1: "اسم الدورة",
//             hintText2: "تاريخ الحصول عليها",
//             hintText3: "مكان الحصول عليها",
//           );
//         },
//       ).then((result) {
//         if (result != null) {
//           personalSkillsController.text = result['degree'];
//         }
//       });
//     },
//   );
// }
// Widget buildComputerSkillsSection() {
//   return buildInputSection(
//     title: "مهـــارات الحاسوب",
//     onPressed: () {
//       showDialog(
//         context: context,
//         builder: (context) {
//           //return const AddCv2(title: "مهارات الحاسوب", name: "المهارة");
//           return AddCvDialog(
//             title: "امهارات الحاسوب",
//             name: "المهارة",
//             hintText1: "اسم الدورة",
//             hintText2: "تاريخ الحصول عليها",
//             hintText3: "مكان الحصول عليها",
//           );
//         },
//       ).then((result) {
//         if (result != null) {
//           computerSkillsController.text = result['experience'];
//         }
//       });
//     },
//   );
// }
// Widget buildLanguagesSection() {
//   return buildInputSection(
//     title: "اللغات",
//     onPressed: () {
//       showDialog(
//         context: context,
//         builder: (context) {
//          // return const AddCv2(title: "اللغات", name: "اللغة");
//           return AddCvDialog(
//             title: "اللغات",
//             name: "اللغة",
//             hintText1: "اسم الدورة",
//             hintText2: "تاريخ الحصول عليها",
//             hintText3: "مكان الحصول عليها",
//           );
//         },
//       ).then((result) {
//         if (result != null) {
//           languagesController.text = result['course'];
//           setState(() {
//             currentStep = 3; // الانتقال إلى الخطوة الثالثة
//           });
//         }
//       });
//     },
//   );
// }
// Widget buildActivitiesSection() {
  //   return buildInputSection(
  //     title: "النشاطات",
  //     onPressed: () {
  //       showDialog(
  //         context: context,
  //         builder: (context) {
  //          // return const AddCv3(title: "النشاطات", name: "اسم النشاط");
  //           return AddCvDialog(
  //             title: "االنشاطات",
  //             name: "اسم النشاط",
  //             hintText1: "اسم الدورة",
  //             hintText2: "تاريخ الحصول عليها",
  //             hintText3: "مكان الحصول عليها",
  //           );
  //         },
  //       ).then((result) {
  //         if (result != null) {
  //           activitiesController.text = result['degree'];
  //         }
  //       });
  //     },
  //   );
  // }
  // Widget buildVolunteerWorkSection() {
  //   return buildInputSection(
  //     title: "الاعمال التطوعية",
  //     onPressed: () {
  //       showDialog(
  //         context: context,
  //         builder: (context) {
  //           //return const AddCv(title: "الاعمال التطوعية", name: "اسم العمل");
  //           return AddCvDialog(
  //             title: "الاعمال التطوعية",
  //             name: "اسم العمل",
  //             hintText1: "اسم الدورة",
  //             hintText2: "تاريخ الحصول عليها",
  //             hintText3: "مكان الحصول عليها",
  //           );
  //         },
  //       ).then((result) {
  //         if (result != null) {
  //           volunteerWorkController.text = result['experience'];
  //         }
  //       });
  //     },
  //   );
  // }
  // Widget buildProjectsSection() {
  //   return buildInputSection(
  //     title: "المشاريع",
  //     onPressed: () {
  //       showDialog(
  //         context: context,
  //         builder: (context) {
  //           //return const AddCv3(title: "المشاريع", name: "اسم المشروع");
  //           return AddCvDialog(
  //             title: "االمشاريع",
  //             name: "اسم المشروع",
  //             hintText1: "اسم الدورة",
  //             hintText2: "تاريخ الحصول عليها",
  //             hintText3: "مكان الحصول عليها",
  //           );
  //         },
  //       ).then((result) {
  //         if (result != null) {
  //           projectsController.text = result['course'];
  //           setState(() {
  //             Navigator.pushReplacement(
  //               context,
  //               MaterialPageRoute(builder: (context) => AfterCv()), // شاشة AfterCv
  //             );
  //           });
  //         }
  //       });
  //     },
  //   );
  // }}
// يمكنك تطبيق نفس النمط على الخطوات الأخرى (stepThree, stepFour) بنفس الطريقة.
  // Step stepTwo() {
  //   return Step(
  //     isActive: currentStep >= 1,
  //     title: const Text(" "),
  //     content: Column(
  //       children: <Widget>[
  //         Padding(
  //           padding: const EdgeInsets.all(10.0),
  //           child: Row(
  //             mainAxisAlignment: MainAxisAlignment.start,
  //             children: [
  //               buildText(
  //                 "المؤهلات العلمية والخبرات",
  //                 16,
  //                 FontWeight.bold,
  //                 secondaryColor,
  //               ),
  //             ],
  //           ),
  //         ),
  //         const SizedBox(height: 8),
  //         Column(
  //           children: [
  //             // قسم التعليم
  //             Row(
  //               mainAxisAlignment: MainAxisAlignment.start,
  //               children: [
  //                 Padding(
  //                   padding: const EdgeInsets.only(bottom: 8.0, right: 20),
  //                   child: buildTextTitle(
  //                     "التعليم",
  //                     14,
  //                     FontWeight.bold,
  //                   ),
  //                 ),
  //               ],
  //             ),
  //             Container(
  //               width: 320,
  //               height: 50,
  //               decoration: BoxDecoration(
  //                 color: const Color(0xFFFDFDFD),
  //                 borderRadius: BorderRadius.circular(30),
  //                 border: Border.all(color: const Color(0xFFBCBCBC)),
  //               ),
  //               child: Row(
  //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                 children: [
  //                   const Padding(
  //                     padding: EdgeInsets.only(right: 15.0),
  //                     child: Text(
  //                       "اضافة..",
  //                       style: TextStyle(
  //                         color: Color(0xFFBBBBBB),
  //                       ),
  //                     ),
  //                   ),
  //                   IconButton(
  //                     onPressed: () {
  //                       showDialog(
  //                         context: context,
  //                         builder: (context) {
  //                           return AddCv(
  //                             title: "التعليم",
  //                             name: "نوع الشهادة",
  //                           );
  //                         },
  //                       ).then((result) {
  //                         if (result != null) {
  //                           // تخزين الشهادة المدخلة
  //                           educationController.text = result['degree'];
  //                           // if (isStepTwoValid()) {
  //                           //   setState(() {
  //                           //     currentStep = 2; // الانتقال إلى الخطوة الثالثة
  //                           //   });
  //                           // }
  //
  //                         }
  //                       });
  //                     },
  //                     icon: const Icon(Icons.add, color: Color(0xFFBBBBBB)),
  //                   ),
  //                 ],
  //               ),
  //             ),
  //             const SizedBox(height: 16),
  //
  //             // قسم الخبرة العملية
  //             Row(
  //               mainAxisAlignment: MainAxisAlignment.start,
  //               children: [
  //                 Padding(
  //                   padding: const EdgeInsets.only(bottom: 8.0, right: 20),
  //                   child: buildTextTitle(
  //                     "الخبرة العملية",
  //                     14,
  //                     FontWeight.bold,
  //                   ),
  //                 ),
  //               ],
  //             ),
  //             Container(
  //               width: 320,
  //               height: 50,
  //               decoration: BoxDecoration(
  //                 color: const Color(0xFFFDFDFD),
  //                 borderRadius: BorderRadius.circular(30),
  //                 border: Border.all(color: const Color(0xFFBCBCBC)),
  //               ),
  //               child: Row(
  //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                 children: [
  //                   const Padding(
  //                     padding: EdgeInsets.only(right: 15.0),
  //                     child: Text(
  //                       "اضافة..",
  //                       style: TextStyle(
  //                         color: Color(0xFFBBBBBB),
  //                       ),
  //                     ),
  //                   ),
  //                   IconButton(
  //                     onPressed: () {
  //                       showDialog(
  //                         context: context,
  //                         builder: (context) {
  //                           return AddCv(
  //                             title: "الخبرة العملية",
  //                             name: "نوع العمل",
  //                           );
  //                         },
  //                       ).then((result) {
  //                         if (result != null) {
  //                           // تخزين الخبرة المدخلة
  //                           workExperienceController.text = result['experience'];
  //                           // if (isStepTwoValid()) {
  //                           //   setState(() {
  //                           //     currentStep = 2; // الانتقال إلى الخطوة الثالثة
  //                           //   });
  //                           // }
  //                           // يمكنك تخزين المزيد من المعلومات حسب الحاجة
  //                         }
  //                       });
  //                     },
  //                     icon: const Icon(Icons.add, color: Color(0xFFBBBBBB)),
  //                   ),
  //                 ],
  //               ),
  //             ),
  //             const SizedBox(height: 16),
  //
  //             // قسم الدورات التدريبية
  //             Row(
  //               mainAxisAlignment: MainAxisAlignment.start,
  //               children: [
  //                 Padding(
  //                   padding: const EdgeInsets.only(bottom: 8.0, right: 20),
  //                   child: buildTextTitle(
  //                     "الدورات التدريبية",
  //                     14,
  //                     FontWeight.bold,
  //                   ),
  //                 ),
  //               ],
  //             ),
  //             Container(
  //               width: 320,
  //               height: 50,
  //               decoration: BoxDecoration(
  //                 color: const Color(0xFFFDFDFD),
  //                 borderRadius: BorderRadius.circular(30),
  //                 border: Border.all(color: const Color(0xFFBCBCBC)),
  //               ),
  //               child: Row(
  //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                 children: [
  //                   const Padding(
  //                     padding: EdgeInsets.only(right: 15.0),
  //                     child: Text(
  //                       "اضافة..",
  //                       style: TextStyle(
  //                         color: Color(0xFFBBBBBB),
  //                       ),
  //                     ),
  //                   ),
  //                   IconButton(
  //                     onPressed: () {
  //                       showDialog(
  //                         context: context,
  //                         builder: (context) {
  //                           return AddCv(
  //                             title: "الدورات التدريبية",
  //                             name: "اسم الدورة",
  //                           );
  //                         },
  //                       ).then((result) {
  //                         if (result != null) {
  //                           // تخزين الدورة المدخلة
  //                           coursesController.text = result['course'];
  //                           setState(() {
  //                             currentStep = 2; // الانتقال إلى الخطوة الثالثة
  //                           });
  //                           // يمكنك تخزين المزيد من المعلومات حسب الحاجة
  //                         }
  //                       });
  //                     },
  //                     icon: const Icon(Icons.add, color: Color(0xFFBBBBBB)),
  //                   ),
  //                 ],
  //               ),
  //             ),
  //           ],
  //         ),
  //       ],
  //     ),
  //   );
  // }

  // Step stepThree(){
  //  return Step(
  //     isActive: currentStep >= 2,
  //     title: const Text(
  //       " ",
  //     ),
  //     content: Column(
  //       children: <Widget>[
  //         Padding(
  //           padding: const EdgeInsets.all(10.0),
  //           child: Row(
  //             mainAxisAlignment: MainAxisAlignment.start,
  //             children: [
  //               buildText(
  //                 "المهــارات",
  //                 16,
  //                 FontWeight.bold,
  //                 secondaryColor,
  //               ),
  //             ],
  //           ),
  //         ),
  //         const SizedBox(
  //           height: 8,
  //         ),
  //         Column(
  //           children: [
  //             Row(
  //               mainAxisAlignment: MainAxisAlignment.start,
  //               children: [
  //                 Padding(
  //                   padding: const EdgeInsets.only(bottom: 8.0, right: 20),
  //                   child: buildTextTitle(
  //                     "المهــارات الشخصية",
  //                     14,
  //                     FontWeight.bold,
  //                   ),
  //                 ),
  //               ],
  //             ),
  //             Container(
  //               width: 320,
  //               height: 50,
  //               decoration: BoxDecoration(
  //                   color: const Color(0xFFFDFDFD),
  //                   borderRadius: BorderRadius.circular(30),
  //                   border: Border.all(color: const Color(0xFFBCBCBC))),
  //               child: Row(
  //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                 children: [
  //                   const Padding(
  //                     padding: EdgeInsets.only(right: 15.0),
  //                     child: Text(
  //                       "اضافة..",
  //                       style: TextStyle(
  //                         color: Color(0xFFBBBBBB),
  //                       ),
  //                     ),
  //                   ),
  //                   // في الخطوة الثالثة، عند استرجاع البيانات
  //                   IconButton(
  //                     onPressed: () {
  //                       showDialog(
  //                         context: context,
  //                         builder: (context) {
  //                           return const AddCv2(
  //                             title: "المهارات الشخصية",
  //                             name: "المهارة",
  //                           );
  //                         },
  //                       ).then((result) {
  //                         if (result != null) {
  //                           // تأكد من أن المفتاح المستخدم يتطابق مع ما تم إرجاعه
  //                           personalSkillsController.text = result['degree'] ;
  //                           // يمكن إضافة setState هنا إذا كنت ترغب في تحديث الواجهة
  //
  //                         }
  //                       });
  //                     },
  //                     icon: const Icon(Icons.add, color: Color(0xFFBBBBBB)),
  //                   ),
  //                 ],
  //               ),
  //             ),
  //             const SizedBox(height: 16),
  //             Row(
  //               mainAxisAlignment: MainAxisAlignment.start,
  //               children: [
  //                 Padding(
  //                   padding: const EdgeInsets.only(bottom: 8.0, right: 20),
  //                   child: buildTextTitle(
  //                     "مهـــارات الحاسوب",
  //                     14,
  //                     FontWeight.bold,
  //                   ),
  //                 ),
  //               ],
  //             ),
  //             Container(
  //               width: 320,
  //               height: 50,
  //               decoration: BoxDecoration(
  //                   color: const Color(0xFFFDFDFD),
  //                   borderRadius: BorderRadius.circular(30),
  //                   border: Border.all(color: const Color(0xFFBCBCBC))),
  //               child: Row(
  //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                 children: [
  //                   const Padding(
  //                     padding: EdgeInsets.only(right: 15.0),
  //                     child: Text(
  //                       "اضافة..",
  //                       style: TextStyle(
  //                         color: Color(0xFFBBBBBB),
  //                       ),
  //                     ),
  //                   ),
  //                   IconButton(
  //                       onPressed: () {
  //                         showDialog(
  //                             context: context,
  //                             builder: (context) {
  //                               return const AddCv2(
  //                                 title: "مهارات الحاسوب",
  //                                 name: "المهارة",
  //                               );
  //                             }).then((result) {
  //                           if (result != null) {
  //                             // تخزين الدورة المدخلة
  //                             computerSkillsController.text = result[ 'experience' ];
  //
  //                             // يمكنك تخزين المزيد من المعلومات حسب الحاجة
  //                           }
  //                         });
  //                       },
  //                       icon: const Icon(Icons.add,
  //                           color: Color(0xFFBBBBBB))),
  //                 ],
  //               ),
  //             ),
  //             const SizedBox(height: 16),
  //             Row(
  //               mainAxisAlignment: MainAxisAlignment.start,
  //               children: [
  //                 Padding(
  //                   padding: const EdgeInsets.only(bottom: 8.0, right: 20),
  //                   child: buildTextTitle(
  //                     "اللغات",
  //                     14,
  //                     FontWeight.bold,
  //                   ),
  //                 ),
  //               ],
  //             ),
  //             Container(
  //               width: 320,
  //               height: 50,
  //               decoration: BoxDecoration(
  //                   color: const Color(0xFFFDFDFD),
  //                   borderRadius: BorderRadius.circular(30),
  //                   border: Border.all(color: const Color(0xFFBCBCBC))),
  //               child: Row(
  //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                 children: [
  //                   const Padding(
  //                     padding: EdgeInsets.only(right: 15.0),
  //                     child: Text(
  //                       "اضافة..",
  //                       style: TextStyle(
  //                         color: Color(0xFFBBBBBB),
  //                       ),
  //                     ),
  //                   ),
  //                   IconButton(
  //                       onPressed: () {
  //                         showDialog(
  //                             context: context,
  //                             builder: (context) {
  //                               return const AddCv2(
  //                                 title: "اللغات",
  //                                 name: "اللغة",
  //                               );
  //                             }).then((result) {
  //                           if (result != null) {
  //                             // تخزين الدورة المدخلة
  //                             languagesController .text = result['course'];
  //                             setState(() {
  //                               currentStep = 3; // الانتقال إلى الخطوة الثالثة
  //                             });
  //
  //                             // يمكنك تخزين المزيد من المعلومات حسب الحاجة
  //                           }
  //                         });
  //                       },
  //                       icon: const Icon(Icons.add,
  //                           color: Color(0xFFBBBBBB))),
  //                 ],
  //               ),
  //             ),
  //           ],
  //         ),
  //       ],
  //     ),
  //   );
  // }
  // Step stepFour(){
  // return Step(
  //    isActive: currentStep >= 3,
  //    title: const Text(" "),
  //    content: Column(
  //      children: <Widget>[
  //        Padding(
  //          padding: const EdgeInsets.all(10.0),
  //          child: Row(
  //            mainAxisAlignment: MainAxisAlignment.start,
  //            children: [
  //              buildTextTitle(
  //                "النشاطات والاعمال الأخرى",
  //                16,
  //                FontWeight.bold,
  //              ),
  //            ],
  //          ),
  //        ),
  //        const SizedBox(
  //          height: 8,
  //        ),
  //        Column(
  //          children: [
  //            Row(
  //              mainAxisAlignment: MainAxisAlignment.start,
  //              children: [
  //                Padding(
  //                  padding: const EdgeInsets.only(bottom: 8.0, right: 20),
  //                  child: buildTextTitle(
  //                    "النشاطات",
  //                    14,
  //                    FontWeight.bold,
  //                  ),
  //                ),
  //              ],
  //            ),
  //            Container(
  //              width: 320,
  //              height: 50,
  //              decoration: BoxDecoration(
  //                  color: const Color(0xFFFDFDFD),
  //                  borderRadius: BorderRadius.circular(30),
  //                  border: Border.all(color: const Color(0xFFBCBCBC))),
  //              child: Row(
  //                mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                children: [
  //                  const Padding(
  //                    padding: EdgeInsets.only(right: 15.0),
  //                    child: Text(
  //                      "اضافة..",
  //                      style: TextStyle(
  //                        color: Color(0xFFBBBBBB),
  //                      ),
  //                    ),
  //                  ),
  //                  IconButton(
  //                      onPressed: () {
  //                        showDialog(
  //                            context: context,
  //                            builder: (context) {
  //                              return const AddCv3(
  //                                title: "النشاطات",
  //                                name: "اسم النشاط",
  //                              );
  //                            }).then((result) {
  //                          if (result != null) {
  //                            // تأكد من أن المفتاح المستخدم يتطابق مع ما تم إرجاعه
  //                            activitiesController.text = result['degree'] ;
  //                            // يمكن إضافة setState هنا إذا كنت ترغب في تحديث الواجهة
  //
  //                          }
  //                        });;
  //                      },
  //                      icon: const Icon(Icons.add,
  //                          color: Color(0xFFBBBBBB))),
  //                ],
  //              ),
  //            ),
  //            const SizedBox(height: 16),
  //            Row(
  //              mainAxisAlignment: MainAxisAlignment.start,
  //              children: [
  //                Padding(
  //                  padding: const EdgeInsets.only(bottom: 8.0, right: 20),
  //                  child: buildTextTitle(
  //                    "الاعمال التطوعية",
  //                    14,
  //                    FontWeight.bold,
  //                  ),
  //                ),
  //              ],
  //            ),
  //            Container(
  //              width: 320,
  //              height: 50,
  //              decoration: BoxDecoration(
  //                  color: const Color(0xFFFDFDFD),
  //                  borderRadius: BorderRadius.circular(30),
  //                  border: Border.all(color: const Color(0xFFBCBCBC))),
  //              child: Row(
  //                mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                children: [
  //                  const Padding(
  //                    padding: EdgeInsets.only(right: 15.0),
  //                    child: Text(
  //                      "اضافة..",
  //                      style: TextStyle(
  //                        color: Color(0xFFBBBBBB),
  //                      ),
  //                    ),
  //                  ),
  //                  IconButton(
  //                      onPressed: () {
  //                        showDialog(
  //                            context: context,
  //                            builder: (context) {
  //                              return const AddCv(
  //                                title: "الاعمال التطوعية",
  //                                name: "اسم العمل",
  //                              );
  //                            }).then((result) {
  //                          if (result != null) {
  //                            // تخزين الدورة المدخلة
  //                            volunteerWorkController.text = result[ 'experience' ];
  //
  //                            // يمكنك تخزين المزيد من المعلومات حسب الحاجة
  //                          }
  //                        });
  //                      },
  //                      icon: const Icon(Icons.add,
  //                          color: Color(0xFFBBBBBB))),
  //                ],
  //              ),
  //            ),
  //            const SizedBox(height: 16),
  //            Row(
  //              mainAxisAlignment: MainAxisAlignment.start,
  //              children: [
  //                Padding(
  //                  padding: const EdgeInsets.only(bottom: 8.0, right: 20),
  //                  child: buildTextTitle(
  //                    "المشاريع",
  //                    14,
  //                    FontWeight.bold,
  //                  ),
  //                ),
  //              ],
  //            ),
  //            Container(
  //              width: 320,
  //              height: 50,
  //              decoration: BoxDecoration(
  //                  color: const Color(0xFFFDFDFD),
  //                  borderRadius: BorderRadius.circular(30),
  //                  border: Border.all(color: const Color(0xFFBCBCBC))),
  //              child: Row(
  //                mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                children: [
  //                  const Padding(
  //                    padding: EdgeInsets.only(right: 15.0),
  //                    child: Text(
  //                      "اضافة..",
  //                      style: TextStyle(
  //                        color: Color(0xFFBBBBBB),
  //                      ),
  //                    ),
  //                  ),
  //                  IconButton(
  //                      onPressed: () {
  //                        showDialog(
  //                            context: context,
  //                            builder: (context) {
  //                              return const AddCv3(
  //                                title: "المشاريع",
  //                                name: "اسم المشروع",
  //                              );
  //                            }).then((result) {
  //                          if (result != null) {
  //                            // تخزين الدورة المدخلة
  //                            projectsController .text = result['course'];
  //                            setState(() {
  //                              Navigator.pushReplacement(
  //                                context,
  //                                MaterialPageRoute(builder: (context) => AfterCv()), // شاشة AfterCv
  //                              ); // الانتقال إلى الخطوة الثالثة
  //                            });
  //
  //                            // يمكنك تخزين المزيد من المعلومات حسب الحاجة
  //                          }
  //                        });;
  //                      },
  //                      icon: const Icon(Icons.add,
  //                          color: Color(0xFFBBBBBB))),
  //                ],
  //              ),
  //            ),
  //          ],
  //        ),
  //      ],
  //    ),
  //  );}}























// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:chanceapp/Core/App_theme.dart';
// import 'package:chanceapp/TraineeScreens/steps_json_entity.dart';
// import 'package:chanceapp/UI%20Components/CenterAppBar.dart';
// import '../UI Components/BuildText.dart';
// import '../UI Components/textFieldWithoutIcon.dart';
// import 'AddCv.dart';
// import 'AfterCv.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
//
// class Steps extends StatefulWidget {
//   const Steps({super.key});
//
//   @override
//   State<Steps> createState() => _StepsState();
// }
//
// class _StepsState extends State<Steps> {
//   int currentStep = 0;
//
//   // Future<void> submitData(StepsJsonEntity user) async {
//   //   final url = 'https://yourapiendpoint.com/users';
//   //   final response = await http.post(
//   //     Uri.parse(url),
//   //     headers: {
//   //       'Content-Type': 'application/json',
//   //     },
//   //     body: jsonEncode(user.toJson()), // تأكد من وجود دالة toJson في كلاس User
//   //   );
//   //
//   //   if (response.statusCode == 201) {
//   //     print('User data submitted successfully.');
//   //   } else {
//   //     print('Failed to submit data: ${response.statusCode}');
//   //   }
//   // }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: centerAppBar(context, "الملف الشخصي"),
//       body: Container(
//         color: primaryColor,
//         child: Theme(
//           data: ThemeData(
//             colorScheme: ColorScheme.light(
//               primary: secondaryColor,
//             ),
//             canvasColor: primaryColor,
//           ),
//           child: Stepper(
//             type: StepperType.horizontal,
//             steps: getSteps(),
//             currentStep: currentStep,
//             onStepContinue: () {
//               if (currentStep != 3) {
//                 setState(() => currentStep += 1);
//               } else {
//                 Navigator.of(context).push(
//                     MaterialPageRoute(builder: (context) => const AfterCv()));
//               }
//             },
//             onStepCancel: () {
//               if (currentStep != 0) {
//                 setState(() => currentStep -= 1);
//               }
//             },
//             controlsBuilder: (BuildContext context, ControlsDetails details) {
//               return buildControls(details);
//             },
//           ),
//         ),
//       ),
//     );
//   }
//
//   List<Step> getSteps() => [
//     createStep1(),
//     createStep2(),
//     createStep3(),
//     createStep4(),
//   ];
//
//   Step createStep1() {
//     return Step(
//       isActive: currentStep >= 0,
//       title: const Text(" "),
//       content: Column(
//         children: <Widget>[
//           buildProfileHeader(),
//           buildPersonalInfoFields(),
//         ],
//       ),
//     );
//   }
//
//   Step createStep2() {
//     return Step(
//       isActive: currentStep >= 1,
//       title: const Text(" "),
//       content: Column(
//         children: <Widget>[
//           buildQualificationsHeader(),
//           buildQualificationsFields(),
//         ],
//       ),
//     );
//   }
//
//   Step createStep3() {
//     return Step(
//       isActive: currentStep >= 2,
//       title: const Text(" "),
//       content: Column(
//         children: <Widget>[
//           buildSkillsHeader(),
//           buildSkillsFields(),
//         ],
//       ),
//     );
//   }
//
//   Step createStep4() {
//     return Step(
//       isActive: currentStep >= 3,
//       title: const Text(" "),
//       content: Column(
//         children: <Widget>[
//           buildActivitiesHeader(),
//           buildActivitiesFields(),
//         ],
//       ),
//     );
//   }
//
//   Widget buildControls(ControlsDetails details) {
//     return Column(
//       children: [
//         const SizedBox(height: 26),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.end,
//           children: <Widget>[
//             buildControlButton('رجـوع', details.onStepCancel),
//             const SizedBox(width: 10),
//             buildControlButton('', details.onStepContinue, isNext: true),
//           ],
//         ),
//       ],
//     );
//   }
//  // void onStepContinue() {
//   //   if (currentStep == 0 && !isStepOneValid()) {
//   //     showSnackBar('يجب ملء جميع الحقول للانتقال إلى الخطوة التالية');
//   //   } else if (currentStep == 0 && isStepOneValid()) {
//   //     setState(() => currentStep += 1);
//   //   } else if (currentStep == 1 && !isStepTwoValid()) {
//   //     showSnackBar('يجب ملء جميع الحقول في الخطوة الثانية');
//   //   } else if (currentStep == 1 && isStepTwoValid()) {
//   //     setState(() => currentStep += 1);
//   //   } else if (currentStep == 2 && !isStepThreeValid()) {
//   //     showSnackBar('يجب ملء جميع الحقول في الخطوة الثالثة');
//   //   } else if (currentStep == 2 && isStepThreeValid()) {
//   //     setState(() => currentStep += 1);
//   //   } else if (currentStep == 3 && !isStepFourValid()) {
//   //     showSnackBar('يجب ملء جميع الحقول في الخطوة الرابعة');
//   //   } else if (currentStep == 3 && isStepFourValid()) {
//   //     Navigator.of(context).push(
//   //       MaterialPageRoute(builder: (context) => const AfterCv()),
//   //     );
//   //   } else {
//   //     setState(() => currentStep += 1);
//   //   }
//   // }
//   Widget buildControlButton(String text, VoidCallback? onPressed, {bool isNext = false}) {
//     return Container(
//       height: 35,
//       width: isNext ? 45 : 70,
//       decoration: BoxDecoration(
//         color: isNext ? const Color(0xFFF59039) : Colors.transparent,
//         borderRadius: BorderRadius.circular(10),
//         border: isNext ? null : Border.all(color: const Color(0xFFF59039)),
//       ),
//       child: isNext
//           ? IconButton(
//         onPressed: onPressed,
//         icon: const Icon(Icons.arrow_forward, color: Colors.white, size: 20),
//       )
//           : TextButton(
//         onPressed: onPressed,
//         style: TextButton.styleFrom(
//           textStyle: const TextStyle(
//             fontFamily: "Tajawal",
//             fontWeight: FontWeight.bold,
//             fontSize: 16,
//           ),
//         ),
//         child: Text(text),
//       ),
//     );
//   }
//
//   Widget buildProfileHeader() {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Stack(
//           alignment: Alignment.center,
//           children: [
//             Container(
//               height: 125,
//               width: 125,
//               decoration: BoxDecoration(
//                 color: const Color(0xFFE7E7E7),
//                 borderRadius: BorderRadius.circular(80),
//               ),
//             ),
//             Image.asset(
//               "lib/images/ion_camera.png",
//               height: 50,
//               width: 50,
//             ),
//           ],
//         ),
//       ],
//     );
//   }
//
//   Widget buildPersonalInfoFields() {
//     return Column(
//       children: [
//         buildTextField("الاسم كامل", "الاسم كامل"),
//         buildTextField("الايميل", "example@gmail.com"),
//         buildTextField("رقم الهاتف", "0000000 218+"),
//         buildTextField("تاريخ الميلاد", "0000/00/00"),
//         buildTextField("المدينة", "اسم المدينة"),
//         buildTextField("عنوان السكن", "المنطقة - الشارع"),
//       ],
//     );
//   }
//
//   Widget buildQualificationsHeader() {
//     return Padding(
//       padding: const EdgeInsets.all(10.0),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//           buildText("المؤهلات العلمية والخبرات", 16, FontWeight.bold, secondaryColor),
//         ],
//       ),
//     );
//   }
//
//   Widget buildQualificationsFields() {
//     return Column(
//       children: [
//         buildQualificationField("التعليم", "نوع الشهادة"),
//         buildQualificationField("الخبرة العملية", "نوع العمل"),
//         buildQualificationField("الدورات التدريبية", "اسم الدورة"),
//       ],
//     );
//   }
//
//   Widget buildSkillsHeader() {
//     return Padding(
//       padding: const EdgeInsets.all(10.0),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//           buildText("المهــارات", 16, FontWeight.bold, secondaryColor),
//         ],
//       ),
//     );
//   }
//
//   Widget buildSkillsFields() {
//     return Column(
//       children: [
//         buildSkillField("المهـــارات الشخصية", "المهارة"),
//         buildSkillField("مهـــارات الحاسوب", "المهارة"),
//         buildSkillField("اللغات", "اللغة"),
//       ],
//     );
//   }
//
//   Widget buildActivitiesHeader() {
//     return Padding(
//       padding: const EdgeInsets.all(10.0),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//           buildText("النشاطات والاعمال الأخرى", 16, FontWeight.bold, secondaryColor),
//         ],
//       ),
//     );
//   }
//
//   Widget buildActivitiesFields() {
//     return Column(
//       children: [
//         buildActivityField("النشاطات", "اسم النشاط"),
//         buildActivityField("الاعمال التطوعية", "اسم العمل"),
//         buildActivityField("المشاريع", "اسم المشروع"),
//       ],
//     );
//   }
//
//   Widget buildTextField(String title, String hint) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Padding(
//           padding: const EdgeInsets.only(bottom: 8.0, right: 20),
//           child: buildTextTitle(title, 14, FontWeight.bold),
//         ),
//         textFieldWithoutIcon(hint, 50, 320, inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[\u0600-\u06FF ]'))]), // السماح بإدخال الأحرف العربية
//         const SizedBox(height: 16),
//       ],
//     );
//   }
//
//   Widget buildQualificationField(String title, String hint) {
//     return buildFieldWithAddButton(title, hint, "اضافة..", "add");
//   }
//
//   Widget buildSkillField(String title, String hint) {
//     return buildFieldWithAddButton(title, hint, "اضافة..", "add");
//   }
//
//   Widget buildActivityField(String title, String hint) {
//     return buildFieldWithAddButton(title, hint, "اضافة..", "add");
//   }
//
//   Widget buildFieldWithAddButton(String title, String hint, String buttonText, String action) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.start,
//       children: [
//         Expanded(
//           child: Padding(
//             padding: const EdgeInsets.only(bottom: 8.0, right: 20),
//             child: textFieldWithoutIcon(hint, 50, 200, inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[\u0600-\u06FF ]'))]), // السماح بإدخال الأحرف العربية
//           ),
//         ),
//         ElevatedButton(
//           onPressed: () {
//             // معالجة الزر هنا
//           },
//           child: Text(buttonText),
//         ),
//       ],
//     );
//   }
//
//   Widget buildText(String text, double fontSize, FontWeight fontWeight, Color color) {
//     return Text(
//       text,
//       style: TextStyle(
//         fontSize: fontSize,
//         fontWeight: fontWeight,
//         color: color,
//       ),
//     );
//   }
//
//   Widget buildTextTitle(String text, double fontSize, FontWeight fontWeight) {
//     return Text(
//       text,
//       style: TextStyle(
//         fontSize: fontSize,
//         fontWeight: fontWeight,
//         color: Colors.black,
//       ),
//     );
//   }
// }

// Future<void> submitData(StepsJsonEntity data) async {
//   final url = 'https://10.60.5.28:8085/users/data_user'; // Replace with your API endpoint
//
//   try {
//     final response = await http.post(
//       Uri.parse(url),
//       headers: {
//         'Content-Type': 'application/json',
//       },
//       body: json.encode(data.toJson()), // Convert your model to JSON
//     );
//
//     if (response.statusCode == 200) {
//       // Handle successful response
//       print('Data submitted successfully: ${response.body}');
//     } else {
//       // Handle error response
//       print('Failed to submit data: ${response.statusCode}');
//     }
//   } catch (error) {
//     print('Error occurred: $error');
//   }
// }// import 'package:chanceapp/Core/App_theme.dart';
// // import 'package:chanceapp/TraineeScreens/AddCv3.dart';
// // import 'package:chanceapp/TraineeScreens/steps_json_entity.dart';
// // import 'package:chanceapp/UI%20Components/CenterAppBar.dart';
// // import 'package:flutter/material.dart';
// // import 'package:flutter/services.dart';
// // import '../UI Components/BuildText.dart';
// // import '../UI Components/textFieldWithoutIcon.dart';
// // import 'AddCv.dart';
// // import 'AfterCv.dart';
// // import 'AssCv2.dart';
// // import 'dart:convert';
// // import 'package:http/http.dart' as http;
// //
// // class Steps extends StatefulWidget {
// //   const Steps({super.key});
// //
// //   @override
// //   State<Steps> createState() => _StepsState();
// // }
// //
// // class _StepsState extends State<Steps> {
// //   int currentStep = 0;
// //
// //   // متغيرات لتخزين القيم المدخلة
// //   TextEditingController fullNameController = TextEditingController();
// //   TextEditingController emailController = TextEditingController();
// //   TextEditingController phoneNumberController = TextEditingController();
// //   TextEditingController birthDateController = TextEditingController();
// //   TextEditingController cityController = TextEditingController();
// //   TextEditingController addressController = TextEditingController();
// //   // متغيرات لتخزين القيم المدخلة للخطوة الثانية
// //   TextEditingController educationController = TextEditingController();
// //   TextEditingController workExperienceController = TextEditingController();
// //   TextEditingController coursesController = TextEditingController();
// // // متغيرات لتخزين القيم المدخلة للخطوة الثالثة
// //   TextEditingController personalSkillsController = TextEditingController();
// //   TextEditingController computerSkillsController = TextEditingController();
// //   TextEditingController languagesController = TextEditingController();
// //
// // // متغيرات لتخزين القيم المدخلة للخطوة الرابعة
// //   TextEditingController activitiesController = TextEditingController();
// //   TextEditingController volunteerWorkController = TextEditingController();
// //   TextEditingController projectsController = TextEditingController();
// //   // التحقق من الحقول المطلوبة للخطوة الأولى
// //   bool isStepOneValid() {
// //     return fullNameController.text.isNotEmpty &&
// //         emailController.text.isNotEmpty &&
// //         phoneNumberController.text.isNotEmpty &&
// //         birthDateController.text.isNotEmpty &&
// //         cityController.text.isNotEmpty &&
// //         addressController.text.isNotEmpty;
// //   }
// //   bool isStepTwoValid() {
// //     return educationController.text.isNotEmpty ||
// //         workExperienceController.text.isNotEmpty ||
// //         coursesController.text.isNotEmpty;
// //   }
// //   bool isStepThreeValid() {
// //     return personalSkillsController.text.isNotEmpty ||
// //         computerSkillsController.text.isNotEmpty ||
// //         languagesController.text.isNotEmpty;
// //   }
// //   bool isStepFourValid() {
// //     return activitiesController.text.isNotEmpty ||
// //         volunteerWorkController.text.isNotEmpty ||
// //         projectsController.text.isNotEmpty;
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: centerAppBar(context, "الملف الشخصي"),
// //       body: Container(
// //         color: primaryColor,
// //         child: Theme(
// //           data: ThemeData(
// //             colorScheme: ColorScheme.light(
// //               primary: secondaryColor,
// //             ),
// //             canvasColor: primaryColor,
// //           ),
// //           child: Stepper(
// //             type: StepperType.horizontal,
// //             steps: getSteps(),
// //             currentStep: currentStep,
// //             onStepContinue: () {
// //               if (currentStep == 0 && !isStepOneValid()) {
// //                 // عرض رسالة تنبيه للخطوة الأولى
// //                 ScaffoldMessenger.of(context).showSnackBar(
// //                   SnackBar(
// //                     content: const Text('يجب ملء جميع الحقول للانتقال إلى الخطوة التالية'),
// //                     backgroundColor: Colors.red,
// //                   ),
// //                 );
// //               } else if (currentStep == 0 && isStepOneValid()) {
// //                 // الانتقال إلى الخطوة الثانية
// //                 setState(() => currentStep += 1);
// //               } else if (currentStep == 1 && !isStepTwoValid()) {
// //                 // عرض رسالة تنبيه للخطوة الثانية
// //                 ScaffoldMessenger.of(context).showSnackBar(
// //                   SnackBar(
// //                     content: const Text('يجب ملء جميع الحقول في الخطوة الثانية'),
// //                     backgroundColor: Colors.red,
// //                   ),
// //                 );
// //               } else if (currentStep == 1 && isStepTwoValid()) {
// //                 // الانتقال إلى الخطوة الثالثة
// //                 setState(() => currentStep += 1);
// //               } else if (currentStep == 2 && !isStepThreeValid()) {
// //                 // عرض رسالة تنبيه للخطوة الثالثة
// //                 ScaffoldMessenger.of(context).showSnackBar(
// //                   SnackBar(
// //                     content: const Text('يجب ملء جميع الحقول في الخطوة الثالثة'),
// //                     backgroundColor: Colors.red,
// //                   ),
// //                 );
// //               } else if (currentStep == 2 && isStepThreeValid()) {
// //                 // الانتقال إلى الخطوة الرابعة
// //                 setState(() => currentStep += 1);
// //               } else if (currentStep == 3 && !isStepFourValid()) {
// //                 // عرض رسالة تنبيه للخطوة الرابعة
// //                 ScaffoldMessenger.of(context).showSnackBar(
// //                   SnackBar(
// //                     content: const Text('يجب ملء جميع الحقول في الخطوة الرابعة'),
// //                     backgroundColor: Colors.red,
// //                   ),
// //                 );
// //               } else if (currentStep == 3 && isStepFourValid()) {
// //                 // إذا كانت الخطوة الأخيرة، انتقل إلى الصفحة التالية
// //                 Navigator.of(context).push(
// //                   MaterialPageRoute(builder: (context) => const AfterCv()),
// //                 );
// //               } else {
// //                 // للخطوات الأخرى، الانتقال مباشرة
// //                 setState(() => currentStep += 1);
// //               }
// //             },
// //
// //             controlsBuilder: (BuildContext context, ControlsDetails details) {
// //               return Column(
// //                 children: [
// //                   const SizedBox(height: 26),
// //                   Row(
// //                     mainAxisAlignment: MainAxisAlignment.end,
// //                     children: <Widget>[
// //                       Container(
// //                         height: 35,
// //                         width: 70,
// //                         decoration: BoxDecoration(
// //                             borderRadius: BorderRadius.circular(10),
// //                             border: Border.all(color: const Color(0xFFF59039))),
// //                         child: TextButton(
// //                           onPressed: details.onStepCancel,
// //                           style: TextButton.styleFrom(
// //                             textStyle: const TextStyle(
// //                               fontFamily: "Tajawal",
// //                               fontWeight: FontWeight.bold,
// //                               fontSize: 16,
// //                             ),
// //                           ),
// //                           child: const Text('رجـوع'),
// //                         ),
// //                       ),
// //                       const SizedBox(width: 10),
// //                       Container(
// //                         height: 35,
// //                         width: 45,
// //                         decoration: BoxDecoration(
// //                           color: const Color(0xFFF59039),
// //                           borderRadius: BorderRadius.circular(10),
// //                         ),
// //                         child: IconButton(
// //                           onPressed: details.onStepContinue,
// //                           icon: const Icon(
// //                             Icons.arrow_forward,
// //                             color: Colors.white,
// //                             size: 20,
// //                           ),
// //                         ),
// //                       ),
// //                     ],
// //                   ),
// //                 ],
// //               );
// //             },
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// //
// //   List<Step> getSteps() => [
// //     stepOne(),
// //     stepTwo(),
// //     stepThree(),
// //     stepFour(),
// //   ];
// //
// //
// //   Step stepOne() {
// //    return Step(
// //       isActive: currentStep >= 0,
// //       title: const Text(
// //         " ",
// //       ),
// //       content: Column(
// //         children: <Widget>[
// //           Row(
// //             mainAxisAlignment: MainAxisAlignment.center,
// //             children: [
// //               Stack(
// //                 alignment: Alignment.center,
// //                 children: [
// //                   Container(
// //                     height: 125,
// //                     width: 125,
// //                     decoration: BoxDecoration(
// //                       color: const Color(0xFFE7E7E7),
// //                       borderRadius: BorderRadius.circular(80),
// //                     ),
// //                   ),
// //                   Image.asset(
// //                     "lib/images/ion_camera.png",
// //                     height: 50,
// //                     width: 50,
// //                   )
// //                 ],
// //               ),
// //             ],
// //           ),
// //           const SizedBox(
// //             height: 15,
// //           ),
// //           Padding(
// //             padding: const EdgeInsets.all(10.0),
// //             child: Row(
// //               mainAxisAlignment: MainAxisAlignment.start,
// //               children: [
// //                 buildText(
// //                   "المعلومات الشخصية",
// //                   16,
// //                   FontWeight.bold,
// //                   secondaryColor,
// //                 ),
// //               ],
// //             ),
// //           ),
// //           const SizedBox(
// //             height: 8,
// //           ),
// //           Column(
// //             children: [
// //               Row(
// //                 mainAxisAlignment: MainAxisAlignment.start,
// //                 children: [
// //                   Padding(
// //                     padding: EdgeInsets.only(bottom: 8.0, right: 20),
// //                     child: buildTextTitle(
// //                       "الاسم كامل",
// //                       14,
// //                       FontWeight.bold,
// //                     ),
// //                   ),
// //                 ],
// //               ),
// //               //textFieldWithoutIcon("الاسم كامل", 50, 320),
// //               buildTextFieldWithController("الاسم كامل", fullNameController),
// //               const SizedBox(height: 16),
// //               Row(
// //                 mainAxisAlignment: MainAxisAlignment.start,
// //                 children: [
// //                   Padding(
// //                     padding: EdgeInsets.only(bottom: 8.0, right: 20),
// //                     child: buildTextTitle(
// //                       "الايميل",
// //                       14,
// //                       FontWeight.bold,
// //                     ),
// //                   ),
// //                 ],
// //               ),
// //               //textFieldWithoutIcon("example@gmail.com", 50, 320),
// //               buildTextFieldWithController("example@gmail.com", emailController),
// //               const SizedBox(height: 16),
// //               Row(
// //                 mainAxisAlignment: MainAxisAlignment.start,
// //                 children: [
// //                   Padding(
// //                     padding: EdgeInsets.only(bottom: 8.0, right: 20),
// //                     child: buildTextTitle(
// //                       "رقم الهاتف",
// //                       14,
// //                       FontWeight.bold,
// //                     ),
// //                   ),
// //                 ],
// //               ),
// //               //textFieldWithoutIcon("0000000 218+ ", 50, 320),
// //               buildTextFieldWithController("0000000 218+ ", phoneNumberController),
// //               const SizedBox(height: 16),
// //               Row(
// //                 mainAxisAlignment: MainAxisAlignment.start,
// //                 children: [
// //                   Padding(
// //                     padding: const EdgeInsets.only(bottom: 8.0, right: 20),
// //                     child: buildTextTitle(
// //                       "تاريخ الميلاد",
// //                       14,
// //                       FontWeight.bold,
// //                     ),
// //                   ),
// //                 ],
// //               ),
// //               //textFieldWithoutIcon("0000/00/00", 50, 320),
// //               buildTextFieldWithController("0000/00/00", birthDateController),
// //               const SizedBox(height: 16),
// //               Row(
// //                 mainAxisAlignment: MainAxisAlignment.start,
// //                 children: [
// //                   Padding(
// //                     padding: const EdgeInsets.only(bottom: 8.0, right: 20),
// //                     child: buildTextTitle(
// //                       "المدينة",
// //                       14,
// //                       FontWeight.bold,
// //                     ),
// //                   ),
// //                 ],
// //               ),
// //               //textFieldWithoutIcon("اسم المدينة", 50, 320),
// //               buildTextFieldWithController("اسم المدينة", cityController),
// //               const SizedBox(height: 16),
// //               Row(
// //                 mainAxisAlignment: MainAxisAlignment.start,
// //                 children: [
// //                   Padding(
// //                     padding: const EdgeInsets.only(bottom: 8.0, right: 20),
// //                     child: buildTextTitle(
// //                       "عنوان السكن",
// //                       14,
// //                       FontWeight.bold,
// //                     ),
// //                   ),
// //                 ],
// //               ),
// //               //textFieldWithoutIcon("المنطقة - الشارع", 50, 320)
// //               buildTextFieldWithController("المنطقة - الشارع", addressController),
// //             ],
// //           ),
// //         ],
// //       ),
// //     );
// //
// //   }
// //   Widget textFieldWithoutIcon(String text, double h, double w, TextEditingController controller, {List<TextInputFormatter>? inputFormatters}) {
// //     return SizedBox(
// //       width: w,
// //       height: h,
// //       child: TextField(
// //         controller: controller,
// //         keyboardType: TextInputType.text,
// //         inputFormatters: inputFormatters,  // استخدام inputFormatters هنا
// //         decoration: InputDecoration(
// //           hintText: text,
// //           hintStyle: const TextStyle(color: Color(0xFFBBBBBB), fontFamily: "Tajawal"),
// //           filled: true,
// //           fillColor: const Color(0xFFFDFDFD),
// //           border: OutlineInputBorder(
// //             borderSide: BorderSide(color: borderColor),
// //             borderRadius: BorderRadius.circular(30),
// //           ),
// //           enabledBorder: OutlineInputBorder(
// //             borderSide: BorderSide(color: borderColor),
// //             borderRadius: BorderRadius.circular(30),
// //           ),
// //           focusColor: secondaryColor,
// //           focusedBorder: OutlineInputBorder(
// //             borderSide: BorderSide(color: secondaryColor),
// //             borderRadius: BorderRadius.circular(30),
// //           ),
// //         ),
// //       ),
// //     );
// //   }



// Future<void> onStepContinue() async {
//   if (currentStep == 0) {
//     // Check the validity of step one inputs
//     if (!isStepOneValid()) {
//       String message = 'يجب ملء جميع الحقول للانتقال إلى الخطوة التالية';
//       if (!isEmailValid(emailController.text)) {
//         message = 'البريد الإلكتروني غير صالح';
//       } else if (!isPhoneNumberValid(phoneNumberController.text)) {
//         message = 'رقم الهاتف يجب أن يبدأ بـ +218 ويتكون من 9 أرقام';
//       } else if (!isDateValid(birthDateController.text)) {
//         message = 'نسيق التاريخ غير صحيح';
//       }
//       showSnackBar(message);
//     } else {
//       // If all validations pass, move to the next step
//       setState(() => currentStep += 1);
//     }
//   } else if (currentStep == 1) {
//     // Validate step two
//     if (!isStepTwoValid()) {
//       showSnackBar('يجب ملء جميع الحقول في الخطوة الثانية');
//     } else {
//       setState(() => currentStep += 1);
//     }
//   } else if (currentStep == 2) {
//     // Validate step three
//     if (!isStepThreeValid()) {
//       showSnackBar('يجب ملء جميع الحقول في الخطوة الثالثة');
//     } else {
//       setState(() => currentStep += 1);
//     }
//   } else if (currentStep == 3) {
//     // Validate step four
//     if (!isStepFourValid()) {
//       showSnackBar('يجب ملء جميع الحقول في الخطوة الرابعة');
//     } else {
//     //  bool success = await submitData(); // Call the API function
//       //if (success) {
//         Navigator.of(context).push(
//           MaterialPageRoute(builder: (context) => const AfterCv()),
//         );
//      // } else {
//         //showSnackBar('فشل الاتصال بالخادم. حاول مرة أخرى.');
//      // }
//     }
//   }
// }