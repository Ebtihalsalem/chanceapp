import 'package:chanceapp/Core/App_theme.dart';
import 'package:flutter/material.dart';
import '../../UI Components/BottomBar.dart';
import '../UI Components/BuildText.dart';
import '../UI Components/CenterAppBar.dart';
import 'Boxes.dart';
import 'HeatMap.dart';

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
        backgroundColor: primaryColor,
        title:centerAppBar("تتبع الخبرة"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Align(
                alignment: Alignment.centerRight,
                child: buildTextTitle(
                    "راجع تقدمك المهني وتطور مهاراتك", 18, FontWeight.bold)),
            const SizedBox(
              height: 40,
            ),
            heatMap(context,activities),
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

  Widget tips(){
    return Row(
      children: [
        boxesSkills(tipsList,"ينصح به لتكملة مسيرتك",false),
      ],
    );
  }

}
