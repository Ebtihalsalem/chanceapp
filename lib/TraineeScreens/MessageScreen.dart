import 'package:chanceapp/Core/App_theme.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import '../../UI Components/BottomBar.dart';
import '../UI Components/AppBar.dart';
import '../UI Components/BuildText.dart';
import '../UI Components/SearchBar.dart';
import '../UI Components/TitleCards.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: buildAppBar("الرسائل","lib/images/Asset 6.png",context,false),
        backgroundColor: primaryColor,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 18.0),
            child:
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              buildSearchRow(),
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
                        child: titleCard("lib/images/acadimic.jpg","الاكاديمية الليبية","كيف استطيع مساعدتك؟"),
                      );
                    },
                  ),
                ),
              ),
            ]),
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



}
