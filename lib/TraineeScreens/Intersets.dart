import 'package:flutter/material.dart';
import 'dart:ui';

import 'Steps.dart';

class IntersetsScreen extends StatefulWidget {
  const IntersetsScreen({super.key});

  @override
  State<IntersetsScreen> createState() => _IntersetsScreenState();
}

class _IntersetsScreenState extends State<IntersetsScreen> {
  Set<int> selectedCards = {}; // مجموعة لتخزين الكروت المختارة

  // قائمة الأيقونات
  // final List<IconData> icons = [
  //   Icons.web,               // تطوير تطبيقات الويب
  //   Icons.code,              // تطوير البرمجيات
  //   Icons.mobile_friendly,   // تطوير التطبيقات
  //   Icons.videogame_asset,   // تطوير الألعاب
  //   Icons.security,          // الأمن السيبراني
  //   Icons.settings,          // إدارة الأنظمة
  //   Icons.add,         // التسويق الرقمي
  //   Icons.analytics,         // تحليل البيانات
  //   Icons.computer,          // تقنية المعلومات
  //   Icons.business_center,   // إدارة المشاريع
  // ];

  final List<String> images = [
    "lib/images/app-development.png", // تطوير تطبيقات الويب
    "lib/images/software-development.png", // تطوير البرمجيات
    "lib/images/app-programming (1).png", // تطوير التطبيقات
    "lib/images/game-development.png", // تطوير الألعاب
    "lib/images/cyber-security (3).png", // الأمن السيبراني
    "lib/images/system.png", // إدارة الأنظمة
    "lib/images/social-media-marketing.png", // التسويق الرقمي
    "lib/images/graphic-design-software.png", // تحليل البيانات
    "lib/images/ui.png", // تقنية المعلومات
    "lib/images/ux-design (1).png", // إدارة المشاريع
  ];

  // قائمة العناوين
  final List<String> titles = [
    "تطوير تطبيقات الويب",
    "تطوير البرمجيات",
    "تطوير التطبيقات",
    "تطوير الألعاب",
    "الأمن السيبراني",
    "إدارة الأنظمة",
    "التسويق الرقمي",
    "التصميم الجرافيكي",
    "تصميم واجهة المستخدم",
    "تصميم تجربة المستخدم",
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            _buildBackgroundImage(),
            _buildBlurOverlay(),
            // إضافة السهم فوق الخلفية
            Positioned(
              top: 20, // تحديد المكان في الأعلى
              left: 350, // تحديد الموقع من اليسار
              child: IconButton(
                icon: const Icon(Icons.arrow_back_ios_new,
                    color: Colors.white, size: 30),
                // أيقونة السهم
                onPressed: () {
                  Navigator.pop(context); // العودة للصفحة السابقة
                },
              ),
            ),
            Center(
              child: Column(
                children: [
                  _buildTopLine(),
                  const SizedBox(height: 90),
                  Expanded(
                    child: _buildFormContainer(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBackgroundImage() {
    return Image.asset(
      "lib/images/backgroundFill3.jpg",
      fit: BoxFit.cover,
      width: double.infinity,
      height: double.infinity,
    );
  }

  Widget _buildBlurOverlay() {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0),
      child: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.black.withOpacity(0.2),
      ),
    );
  }

  Widget _buildTopLine() {
    return Container(
      height: 3,
      width: 200,
      color: Colors.grey,
    );
  }

  Widget _buildFormContainer() {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(40.0),
        topRight: Radius.circular(40.0),
      ),
      child: Container(
        padding: const EdgeInsets.fromLTRB(50, 20, 50, 20),
        decoration: const BoxDecoration(
          color: Color(0xFFEFEFEF),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40.0),
            topRight: Radius.circular(40.0),
          ),
        ),
        child: _buildForm(),
      ),
    );
  }

  Widget _buildForm() {
    return Column(
      children: [
        Expanded(
          flex: 7,
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _buildTopLine(),
                  const SizedBox(height: 40),
                  _buildHeaderTextTitle(
                      "اختر مجالات اهتماماتك", 27, FontWeight.bold),
                  const SizedBox(height: 16),
                  _buildHeaderTextTitle("أختر من 3-5 مجالات مهتم للتدريب فيها",
                      18, FontWeight.normal),
                  const SizedBox(height: 16),
                  Expanded(
                    child:
                        _buildInterestsGrid(), // استخدام Grid بدلاً من ListView
                  ),
                ],
              ),
              // Button positioned below the interests list
              Positioned(
                bottom: 16,
                left: 0,
                right: 0,
                child: Center(
                  // Center the button
                  child: Visibility(
                    visible: selectedCards.length >= 3,
                    // Show button if at least 3 cards selected
                    child: ElevatedButton(
                      onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => const Steps()),
                      ),
                      style: ButtonStyle(
                        backgroundColor:
                            WidgetStateProperty.all(const Color(0xFFF59039)),
                        padding: WidgetStateProperty.all(
                            const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 10)),
                      ),
                      child: const Row(
                        children: [
                          // أيقونة السهم
                          SizedBox(width: 10), // مسافة بين الأيقونة والنص
                          Expanded(
                            // يسمح للنص بأن يأخذ المساحة المتبقية
                            child: Text(
                              "الــتـــالـي",
                              textAlign: TextAlign.center,
                              // محاذاة النص في المنتصف
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                fontFamily: "Tajawal",
                                color:
                                    Colors.white, // تعيين لون النص إلى الأبيض
                              ),
                            ),
                          ),
                          Icon(Icons.navigate_next, color: Colors.white),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildHeaderTextTitle(
      String text, double fontSize, FontWeight fontWeight) {
    return Text(
      text,
      style: TextStyle(
        color: const Color(0xff4A4C4D),
        fontSize: fontSize,
        fontWeight: fontWeight,
        fontFamily: "Tajawal",
      ),
      textAlign: TextAlign.right,
      textDirection: TextDirection.rtl,
    );
  }

  Widget _buildHeaderText(String text, double fontSize, FontWeight fontWeight, Color fontColor) {
    return Text(
      text,
      style: TextStyle(
        color: fontColor,
        fontSize: fontSize,
        fontWeight: fontWeight,
        fontFamily: "Tajawal",
      ),
      textAlign: TextAlign.center,
      textDirection: TextDirection.rtl,
    );
  }

  Widget _buildInterestsGrid() {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // عدد الأعمدة
        mainAxisSpacing: 0.3, // المسافة العمودية بين الكروت
        crossAxisSpacing: 0.2, // المسافة الأفقية بين الكروت
        childAspectRatio: 555 / 530, // نسبة العرض إلى الارتفاع لكل كرت
      ),
      itemCount: titles.length,
      itemBuilder: (context, index) {
        // return _buildInterestCard(index, icons[index], titles[index]);
        return _buildInterestCard(index, images[index], titles[index]);
      },
    );
  }

  // Widget _buildInterestCard(int index, IconData iconData, String title) {
  Widget _buildInterestCard(int index, String imagePath, String title) {
    bool isSelected =
        selectedCards.contains(index); // التحقق من إذا تم اختيار البطاقة
    return GestureDetector(
      onTap: () {
        setState(() {
          if (isSelected) {
            selectedCards
                .remove(index); // إزالة من المختارة إذا تم النقر مرة أخرى
          } else if (selectedCards.length < 5) {
            selectedCards.add(index); // إضافة إلى المختارة
          } else {
            _showLimitExceededDialog(); // إظهار الرسالة إذا تم اختيار أكثر من 5
          }
        });
      },
      child: Container(
        margin: const EdgeInsets.all(8),
        child: Card(
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: isSelected ? Colors.orange : Colors.transparent,
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Container(
            color: const Color(0xffE9E9E9),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(alignment: Alignment.center, children: [
                  Container(
                    height: 45,
                    width: 45,
                    decoration: BoxDecoration(
                      color: const Color(0xFFE2E2E2),
                      borderRadius: BorderRadius.circular(80),
                    ),
                  ),
                  Image.asset(
                    imagePath,
                    width: 25,
                    height: 25,
                    color: isSelected ? Colors.orange : Colors.grey,
                  ),
                ]),
                const SizedBox(height: 16),
                _buildHeaderText(title, 15, FontWeight.normal,isSelected ? Colors.orange : Colors.grey,),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showLimitExceededDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: _buildHeaderTextTitle('حد الاهتمامات',20,FontWeight.bold),
          content: _buildHeaderTextTitle('لا يمكنك اختيار أكثر من 5 مجالات.',15,FontWeight.normal),
          actions: [
            TextButton(
              child: _buildHeaderText('حسنًا',15,FontWeight.bold,const Color(0xFFF59039)),
              onPressed: () {
                Navigator.of(context).pop(); // إغلاق الـ Dialog
              },
            ),
          ],
        );
      },
    );
  }
}
