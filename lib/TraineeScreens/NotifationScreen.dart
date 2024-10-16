import 'package:flutter/material.dart';

import '../../UI Components/BottomBar.dart';

class NotifationScreen extends StatefulWidget {
  const NotifationScreen({super.key});

  @override
  State<NotifationScreen> createState() => _NotifationScreenState();
}

class _NotifationScreenState extends State<NotifationScreen> {


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: _buildAppBar(),
        backgroundColor: const Color(0xffEFEFEF),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 40.0),
          child:
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const SizedBox(height: 22),
            Expanded(
              child: SizedBox(
                height: 500,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: _buildForYouSection(),
                    );
                  },
                ),
              ),
            ),
          ]),
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
      automaticallyImplyLeading: false,
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
            const Text("الاشعارات",
                style: TextStyle(
                    fontFamily: "Tajawal",
                    fontSize: 16,
                    color: Color(0xFF4A4C4D),
                    fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderText(
      String text, double fontSize, FontWeight fontWeight, Color fontColor) {
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

  Widget _buildForYouSection() {
    return Container(
      height: 60,
      width: 344,
      decoration: BoxDecoration(
        color: const Color(0xFFF3F3F3),
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
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
                          10,
                          FontWeight.normal,
                          const Color(0xff4A4C4D)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

}
