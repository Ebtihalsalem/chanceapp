import 'package:chanceapp/TraineeScreens/home.dart';
import 'package:chanceapp/UI%20Components/TextField.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

import '../../UI Components/BottomBar.dart';
import '../Core/App_theme.dart';
import '../UI Components/Button.dart';
import '../UI Components/CardDetails.dart';


class TrianingDetils extends StatefulWidget {
  const TrianingDetils({super.key});

//تمرير له لون والبيانات اللون حسب اذا كان من التوصيات او لاجلك


  @override
  State<TrianingDetils> createState() => _TrianingDetilsState();
}

class _TrianingDetilsState extends State<TrianingDetils> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: _buildAppBar(),
        backgroundColor: const Color(0xffEFEFEF),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 40.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 22),
                 Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: cardDetails(context,secondaryColor,primaryColor,"lib/images/acadimic.jpg",
                            secondaryColor,"مساعد المدير","الاكاديمية الليبية " ),
                      ),
                Padding(
                  padding: const EdgeInsets.only(top:18.0),
                  child: information("شهرين","20","يوجد",borderColor,primaryColor,secondaryColor,borderColor),
                ),
                const SizedBox(height: 15,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Icon(EvaIcons.starOutline,color: Color(0xFFF59039),size: 30),
                    const Icon(EvaIcons.messageCircleOutline,color: Color(0xFFF59039),size: 26),
                    textField("تعليقك..", null,40,270,null,false)
                  ],
                ),
                const SizedBox(height: 130,),
                Center(
                  child: SizedBox(
                    width: 300,
                    height: 50,
                    child:
                    button("طلب التدريب",context,const HomeScreen(),null,null),
                    ),
                  ),
              ],
            ),
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

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: primaryColor,
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

}

