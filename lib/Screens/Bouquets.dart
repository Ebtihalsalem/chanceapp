import 'package:chanceapp/Screens/PayScreen.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import '../Core/App_theme.dart';
import '../TraineeScreens/home.dart';
import '../UI Components/BCards.dart';
import '../UI Components/BuildText.dart';
import '../UI Components/Button.dart';

class Bouquets extends StatefulWidget {
  const Bouquets({super.key});

  @override
  State<Bouquets> createState() => _BouquetsState();
}

class _BouquetsState extends State<Bouquets> {

  final List<String> cardData = [
    "الباقة البرونزية",
    "الباقة الفضية",
    "الباقة الذهبية",
    "الباقة الالماسية",
  ];

  final List<List<String>> featuresData = [
    ["ميزة 1", "ميزة 2", "ميزة 3"],
    ["ميزة 1", "ميزة 2", "ميزة 4", "ميزة 5"],
    ["ميزة 1", "ميزة 3", "ميزة 6"],
    ["ميزة 2", "ميزة 4", "ميزة 7", "ميزة 8"],
    ["ميزة 1", "ميزة 5", "ميزة 9"],
  ];
  List<String> prices = ["0 دل","75 دل","150 دل","225 دل"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColor,
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
              buildTextTitle("فرصتك في يدك", 20, FontWeight.bold),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 18.0,horizontal: 18),
          child: Align(
            alignment: Alignment.center,
            child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              SizedBox(
                height: 500,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: cardData.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 18.0),
                        child: cards(content: cardData[index], features: featuresData[index],price:prices[index]),

                      );
                    }),
              ),
              const SizedBox(
                height: 20,
              ),
              button(
                  "الاستمرار",
                  context,
                  PayScreen(),
                  Icon(
                    EvaIcons.arrowIosBack,
                    color: primaryColor,
                  ),null),
            ]),
          ),
        ));
  }
}
