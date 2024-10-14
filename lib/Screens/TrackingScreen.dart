import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';

import '../UI Components/BottomBar.dart';

class TrackingScreen extends StatefulWidget {
  const TrackingScreen({super.key});

  @override
  State<TrackingScreen> createState() => _TrackingScreenState();
}

class _TrackingScreenState extends State<TrackingScreen> {

  final Map<DateTime, String> activities = {
    DateTime(2024, 1, 1): "بداية النشاط",
    DateTime(2024, 2, 10): "تدريب مكثف",
    DateTime(2024, 2, 15): "مشاركة في ورشة عمل",
    DateTime(2024, 3, 20): "تقديم مشروع",
    DateTime(2024, 3, 25): "حضور مؤتمر",
  };

  List<String> tipsList = ["CX","UX","EUX"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "lib/images/logo.png",
              height: 20,
              width: 20,
            ),
            const SizedBox(
              width: 10,
            ),
            const Text("تتبع الخبرة",
                style: TextStyle(
                    fontFamily: "Tajawal",
                    fontSize: 20,
                    color: Color(0xFF4A4C4D),
                    fontWeight: FontWeight.bold)),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Align(
                alignment: Alignment.centerRight,
                child: _buildHeaderTextTitle(
                    "راجع تقدمك المهني وتطور مهاراتك", 18, FontWeight.bold)),
            const SizedBox(
              height: 40,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  HeatMap(
                    startDate: DateTime(DateTime.now().year, 1, 1),
                    endDate: DateTime(DateTime.now().year, 12, 30),
                    datasets: {
                      DateTime(2024, 1, 1): 1,
                      DateTime(2024, 2, 10): 5,
                      DateTime(2024, 2, 15): 3,
                      DateTime(2024, 3, 20): 4,
                      DateTime(2024, 3, 25): 5,
                    },
                    scrollable: true,
                    colorMode: ColorMode.opacity,
                    defaultColor: const Color(0xfff1f1f1),
                    textColor: Colors.black87,
                    showColorTip: true,
                    onClick: (value) {
                      if (activities.containsKey(value)) {

                        _showActivityDialog(value, activities[value]!);
                      } else {
                        _showActivityDialog(value, "لا توجد نشاطات مسجلة.");
                      }
                    },
                    colorsets: const {
                      1: Color(0xFFFDC89A),
                      2: Color(0xFFFFBC82),
                      3: Color(0xFFFCAF6C),
                      4: Color(0xFFF5A057),
                      5: Color(0xFFF7923A),
                    },
                    margin: const EdgeInsets.all(1),
                    borderRadius: 4,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 26,),
            tips(),
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
    );
  }

  void _showActivityDialog(DateTime date, String activity) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("النشاط في ${date.day}/${date.month}"),
          content: Text(activity),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: _buildHeaderText("حسنًا", 16, FontWeight.normal,const Color(0xFFF59039))
            ),
          ],
        );
      },
    );
  }
  
  Widget tips(){
    return Row(
      children: [
        _boxesSkills(tipsList,"ينصح به لتكملة مسيرتك"),
      ],
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

  Widget _boxesSkills(List<String> dataList, String maintitle) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildHeaderTextTitle(maintitle, 18, FontWeight.bold),
        const SizedBox(height: 18.0),
        Wrap(
          spacing: 4.0,
          runSpacing: 4.0,
          children: dataList.map((data) {
            return Padding(
              padding: const EdgeInsets.all(4.0),
              child: _buildOvalContainer(
                data,
                const Color(0xFFF59039),
                const Color(0xFFF59039),
                const Color(0xFFEAEAEA),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }


  Widget _buildHeaderText(
    String text,
    double fontSize,
    FontWeight fontWeight,
    Color fontColor,
  ) {
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
    String text,
    double fontSize,
    FontWeight fontWeight,
  ) {
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
}
