import 'package:flutter/material.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import '../UI Components/BottomBar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: _buildAppBar(),
        backgroundColor: const Color(0xffEFEFEF),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Theme(
                data: ThemeData(
                  colorScheme: const ColorScheme.light(
                    primary: Color(0xFFF59039),
                  ),
                ),
                child: _buildSearchRow(),
              ),
              const SizedBox(height: 26),
              _buildHeaderTextTitle('لأجلك', 20, FontWeight.bold),
              const SizedBox(height: 22),
              SizedBox(
                height: 154,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: _buildForYouSection(),
                    );
                  },
                ),
              ),
              const SizedBox(height: 26),
              _buildHeaderTextTitle('توصيات', 20, FontWeight.bold),
              const SizedBox(height: 22),
              SizedBox(
                height: 154,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: _buildRecommendationsSection(),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: const Padding(
          padding: EdgeInsets.only(bottom: 20.0, left: 20, right: 20),
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            child: BottomBar(),
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.grey[200],
      title: Padding(
        padding: const EdgeInsets.only(top: 18, right: 18.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              "lib/images/logo.png",
              height: 25,
              width: 25,
            ),
            const SizedBox(
              width: 10,
            ),
            const Text("مرحبًا، سارة أحمد !",
                style: TextStyle(
                    fontFamily: "Tajawal",
                    fontSize: 16,
                    color: Color(0xFF4A4C4D),
                    fontWeight: FontWeight.bold)),
          ],
        ),
      ),
      actions: [
        _buildActionButton(EvaIcons.messageCircle, () {
          // التعامل مع الدردشة
        }),
        const SizedBox(width: 10),
        Padding(
          padding: const EdgeInsets.only(left: 18.0),
          child: _buildActionButton(EvaIcons.bell, () {
            // التعامل مع الفلترة
          }),
        ),
      ],
    );
  }

  Widget _buildActionButton(IconData icon, VoidCallback onTap) {
    return Container(
      margin: const EdgeInsets.only(top: 18.0, left: 18),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 40,
          width: 40,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xffE7E7E7),
          ),
          child: Icon(
            icon,
            color: const Color(0xFFF59039),
            size: 25,
          ),
        ),
      ),
    );
  }

  Widget _buildSearchRow() {
    return Row(
      children: [
        SizedBox(
          width: 294,
          height: 43,
          child: TextField(
            textDirection: TextDirection.rtl,
            textAlign: TextAlign.right,
            decoration: InputDecoration(
              hintText: "بحث..",
              hintStyle: const TextStyle(
                  fontFamily: "Tajawal", color: Color(0xFFBBBBBB)),
              filled: true,
              fillColor: const Color(0xFFF3F3F3),
              suffixIcon:
              const Icon(EvaIcons.searchOutline, color: Color(0xFFBBBBBB)),
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
        const SizedBox(width: 10),
        _buildFilterIcon(),
      ],
    );
  }

  Widget _buildFilterIcon() {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF59039),
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Icon(
          EvaIcons.options2,
          color: Color(0xffE7E7E7),
          size: 30,
        ),
      ),
    );
  }

  Widget _buildHeaderText(String text, double fontSize, FontWeight fontWeight,
      Color fontColor) {
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

  Widget _buildHeaderTextTitle(String text, double fontSize,
      FontWeight fontWeight) {
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

  Widget _buildForYouSection() {
    return Container(
      height: 154,
      width: 344,
      decoration: BoxDecoration(
        color: const Color(0xFFF59039),
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: AssetImage('lib/images/acadimic.jpg'),
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildHeaderText(
                          'الأكاديمية البيئية لتكنولوجيا المعلومات',
                          12,
                          FontWeight.bold,
                          const Color(0xffEFEFEF)),
                      _buildHeaderText('مساعدة مدير', 12, FontWeight.normal,
                          const Color(0xffEFEFEF)),
                    ],
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Icon(EvaIcons.bookmarkOutline,color: Color(0xffEFEFEF)),
              ),
            ],
          ),
          const SizedBox(height: 26),
          Padding(
            padding: const EdgeInsets.only(right: 60.0),
            child: Row(
              children: [
                Image.asset(
                  "lib/images/tdesign_location.png",
                  height: 15,
                  width: 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 4.0),
                  child: _buildHeaderText(
                      'مصراتة', 12, FontWeight.normal, const Color(0xffEFEFEF)),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const SizedBox(width: 60),
              _buildOvalContainer('شبكات واتصالات', const Color(0xFFF3F3F3),
                  const Color(0xFFBBBBBB), const Color(0xFFF59039)),
              const SizedBox(width: 8),
              _buildOvalContainer('علوم حاسوب', const Color(0xFFF3F3F3),
                  const Color(0xFFBBBBBB), const Color(0xFFF59039)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildOvalContainer(String text, Color color, Color borderColor,
      Color fontColor) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: borderColor),
      ),
      child: _buildHeaderText(text, 10, FontWeight.bold, fontColor),
    );
  }

  Widget _buildRecommendationsSection() {
    return Container(
      height: 154,
      width: 344,
      decoration: BoxDecoration(
          color: const Color(0xFFF3F3F3),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: const Color(0xFFBBBBBB))),
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: AssetImage('lib/images/almadar.png'),
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildHeaderText('المــدار الجديــد', 12, FontWeight.bold,
                          const Color(0xFFF59039)),
                      _buildHeaderText('مهندس شبكات', 12, FontWeight.normal,
                          const Color(0xFFF59039)),
                    ],
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Icon(EvaIcons.bookmarkOutline,color: Color(0xFFF59039)),
              ),
            ],
          ),
          const SizedBox(height: 26),
          Padding(
            padding: const EdgeInsets.only(right: 60.0),
            child: Row(
              children: [
                Image.asset(
                  "lib/images/Vector.png",
                  height: 15,
                  width: 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 4.0),
                  child: _buildHeaderText(
                      'مصراتة', 12, FontWeight.normal, const Color(0xFFF59039)),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const SizedBox(width: 60),
              _buildOvalContainer('شبكات واتصالات', const Color(0xFFF59039),
                  const Color(0xFFF59039), const Color(0xFFF3F3F3)),
              const SizedBox(width: 8),
              _buildOvalContainer('علوم حاسوب', const Color(0xFFF59039),
                  const Color(0xFFF59039), const Color(0xFFF3F3F3)),
            ],
          ),
        ],
      ),
    );
  }

}