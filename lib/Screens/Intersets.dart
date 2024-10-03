import 'package:chanceapp/Screens/home.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

class IntersetsScreen extends StatefulWidget {
  const IntersetsScreen({super.key});

  @override
  State<IntersetsScreen> createState() => _IntersetsScreenState();
}

class _IntersetsScreenState extends State<IntersetsScreen> {
  Set<int> selectedCards = {}; // مجموعة لتخزين الكروت المختارة

  // قائمة الأيقونات
  final List<IconData> icons = [
    Icons.web,               // تطوير تطبيقات الويب
    Icons.code,              // تطوير البرمجيات
    Icons.mobile_friendly,   // تطوير التطبيقات
    Icons.videogame_asset,   // تطوير الألعاب
    Icons.security,          // الأمن السيبراني
    Icons.settings,          // إدارة الأنظمة
    Icons.add,         // التسويق الرقمي
    Icons.analytics,         // تحليل البيانات
    Icons.computer,          // تقنية المعلومات
    Icons.business_center,   // إدارة المشاريع
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
    "تحليل البيانات",
    "تقنية المعلومات",
    "إدارة المشاريع",
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
                icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white, size: 30), // أيقونة السهم
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
                  _buildHeaderText("اختر مجالات اهتماماتك", 27, FontWeight.bold),
                  const SizedBox(height: 16),
                  _buildHeaderText(
                      "أختر من 3-5 مجالات مهتم للتدريب فيها", 18, FontWeight.normal),
                  const SizedBox(height: 16),
                  Expanded(
                    child: _buildInterestsGrid(), // استخدام Grid بدلاً من ListView
                  ),
                ],
              ),
              // Button positioned below the interests list
              Positioned(
                bottom: 16,
                left: 0,
                right: 0,
                child: Center( // Center the button
                  child: Visibility(
                    visible: selectedCards.length >= 3, // Show button if at least 3 cards selected
                    child: ElevatedButton(
                      onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                      ),
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(const Color(0xFFF59039)),
                        padding: WidgetStateProperty.all(const EdgeInsets.symmetric(horizontal: 30, vertical: 10)),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.navigate_next, color: Colors.white), // أيقونة السهم
                          const SizedBox(width: 10), // مسافة بين الأيقونة والنص
                          Expanded( // يسمح للنص بأن يأخذ المساحة المتبقية
                            child: Text(
                              "الــــتــــالـــــي",
                              textAlign: TextAlign.center, // محاذاة النص في المنتصف
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white, // تعيين لون النص إلى الأبيض
                              ),
                            ),
                          ),
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

  Widget _buildHeaderText(String text, double fontSize, FontWeight fontWeight) {
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

  Widget _buildInterestsGrid() {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // عدد الأعمدة
        mainAxisSpacing: 8.0, // المسافة العمودية بين الكروت
        crossAxisSpacing: 8.0, // المسافة الأفقية بين الكروت
        childAspectRatio: 1.5, // نسبة العرض إلى الارتفاع لكل كرت
      ),
      itemCount: titles.length,
      itemBuilder: (context, index) {
        return _buildInterestCard(index, icons[index], titles[index]);
      },
    );
  }

  Widget _buildInterestCard(int index, IconData iconData, String title) {
    bool isSelected = selectedCards.contains(index); // التحقق من إذا تم اختيار البطاقة
    return GestureDetector(
      onTap: () {
        setState(() {
          if (isSelected) {
            selectedCards.remove(index); // إزالة من المختارة إذا تم النقر مرة أخرى
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                iconData,
                size: 40,
                color: isSelected ? Colors.orange : Colors.grey,
              ),
              const SizedBox(height: 16),
              _buildHeaderText(title, 12, FontWeight.bold),
            ],
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
          title: const Text('حد الاهتمامات'),
          content: const Text('لا يمكنك اختيار أكثر من 5 مجالات.'),
          actions: [
            TextButton(
              child: const Text('حسنًا'),
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
