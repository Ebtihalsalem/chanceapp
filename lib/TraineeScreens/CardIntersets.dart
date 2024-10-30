import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Core/App_theme.dart';
import '../Screens/Auth.dart';
import '../Screens/LoginScreen.dart';
import '../UI Components/BuildText.dart';
import 'Steps.dart';

class CardIntersets extends StatefulWidget {
  const CardIntersets(String urlPhoto, {super.key, required email});

  @override
  State<CardIntersets> createState() => _CardIntersetsState();
}

class _CardIntersetsState extends State<CardIntersets> {

  Set<int> selectedCards = {};

  final List<String> images = [
    "lib/images/app-development.png",
    "lib/images/software-development.png",
    "lib/images/app-programming (1).png",
    "lib/images/game-development.png",
    "lib/images/cyber-security (3).png",
    "lib/images/system.png",
    "lib/images/social-media-marketing.png",
    "lib/images/graphic-design-software.png",
    "lib/images/ui.png",
    "lib/images/ux-design (1).png",
  ];


  final List<String> titlesCard = [
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
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 20,horizontal:40),
      child: buildForm(),
    );
  }
  Widget buildForm() {
    return Stack(
      children: [
        Center(child: Container(height: 3,width: 100,color: borderColor,)),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 60),
            buildTextTitle("اختر مجالات اهتماماتك", 27, FontWeight.bold),
            const SizedBox(height: 8),
            buildTextTitle("أختر من 3-5 مجالات مهتم للتدريب فيها", 18, FontWeight.normal),
            const SizedBox(height: 8),
            SizedBox(
              height: 640,
              child: _buildInterestsGrid(),
            ),
          ],
        ),
        Positioned(
          bottom: 36,
          right: 0,
          left: 0,
          child: Center(
            // Center the button
            child: Visibility(
              visible: selectedCards.length >= 3,
              child: ElevatedButton(
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => Steps()),
                ),
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(primaryColor),
                  padding: WidgetStateProperty.all(
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 10)),
                ),
                child: Row(
                  children: [
                    SizedBox(width: 10),
                    Expanded(
                      child: buildText("الــتـــالـي", 20, FontWeight.bold,backgroundColor)

                    ),

                    Icon(Icons.navigate_next, color: Colors.white),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
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
      itemCount: titlesCard.length,
      itemBuilder: (context, index) {

        return _buildInterestCard(index, images[index], titlesCard[index]);
      },
    );
  }


  Widget _buildInterestCard(int index, String imagePath, String title) {
    bool isSelected =
    selectedCards.contains(index);
    return GestureDetector(
      onTap: () {
        setState(() {
          if (isSelected) {
            selectedCards
                .remove(index);
          } else if (selectedCards.length < 5) {
            selectedCards.add(index);
          } else {
            _showLimitExceededDialog();
          }
        });
      },
      child: Container(
        margin: const EdgeInsets.all(8),
        child: Card(
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: isSelected ? primaryColor : Colors.transparent,
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
                      color: const Color(0xFFE7E7E7),
                      borderRadius: BorderRadius.circular(80),
                    ),
                  ),
                  Image.asset(
                    imagePath,
                    width: 25,
                    height: 25,
                    color: isSelected ? primaryColor : Colors.grey,
                  ),
                ]),
                const SizedBox(height: 16),
                buildText(title, 15, FontWeight.normal,isSelected ? primaryColor : Colors.grey,),
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
          title: buildTextTitle('حد الاهتمامات',20,FontWeight.bold),
          content: buildTextTitle('لا يمكنك اختيار أكثر من 5 مجالات.',15,FontWeight.normal),
          actions: [
            TextButton(
              child: buildText('حسنًا',16,FontWeight.bold,primaryColor),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
