import 'package:chanceapp/CompanyScreens/TrainingDetails.dart';
import 'package:chanceapp/Core/App_theme.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:chanceapp/UI Components/Cards.dart' as cards;
import '../CompanyScreens/MyAccountForCompany/Data/Trainings.dart';
import 'BuildText.dart';
import 'Cards.dart';
import 'PersonCard.dart';
import 'package:chanceapp/UI Components/Cards.dart' as cards;
import 'package:chanceapp/UI Components/PersonCard.dart' as person;
Widget availableTrainings(BuildContext context, Widget targetScreen,
    Future<List<Training>> trainings) {
  return InkWell(
    onTap: () {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => targetScreen));
    },
    child: FutureBuilder<List<Training>>(
      future: trainings,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('خطأ: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('لا توجد تدريبات متاحة'));
        } else {
          final trainingList = snapshot.data!;
          return SizedBox(
            height: 200,
            child: ListView.builder(
              itemCount: trainingList.length,
              itemBuilder: (context, index) {
                final training = trainingList[index];
                return Wrap(
                  children: [
                    Container(
                    width: 344,
                    decoration: BoxDecoration(
                      color: whiteApp,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(right: 10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    buildText(training.trainingPosition, 14,
                                        FontWeight.bold, fontColorBlack),
                                  ],
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    const Icon(
                                      Icons.location_on_outlined,
                                      color: Color(0xFF848484),
                                      size: 15,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: buildText(training.city, 10,
                                          FontWeight.bold, Color(0xFF848484)),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    const Icon(
                                      EvaIcons.clockOutline,
                                      color: Color(0xFF848484),
                                      size: 16,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: buildText(training.startDate, 10,
                                          FontWeight.bold, const Color(0xFF848484)),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    const Icon(
                                      EvaIcons.peopleOutline,
                                      color: Color(0xFF848484),
                                      size: 16,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: buildText(
                                          "${training.numberOfPositions}",
                                          10,
                                          FontWeight.bold,
                                          const Color(0xFF848484)),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: person.chunkedList(training.requiredSkills, 2)
                              .map((chunk) {
                            return Wrap(
                              spacing: 1.0,
                              runSpacing: 1.0,
                              children: chunk.map((data) {
                                return Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: buildOvalContainer(data, false),
                                );
                              }).toList(),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ),
                ]
                );
              },
            ),
          );
        }
      },
    ),
  );
}
