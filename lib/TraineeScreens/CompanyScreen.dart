import 'dart:ui';
import 'package:chanceapp/CompanyScreens/TrainingDetails.dart';
import 'package:chanceapp/TraineeScreens/AvailableTrainings.dart';
import 'package:chanceapp/UI%20Components/CenterAppBar.dart';
import 'package:flutter/material.dart';

import '../../UI Components/BottomBar.dart';
import '../Core/App_theme.dart';
import '../UI Components/BuildText.dart';
import 'AboutCompany.dart';

class CompanyScreen extends StatefulWidget {
  const CompanyScreen({super.key});

  @override
  State<CompanyScreen> createState() => _CompanyScreenState();
}

class _CompanyScreenState extends State<CompanyScreen> {
  List<String> tabs = ["حــول", "التدريبات المتاحة"];

  List<String> summary = ["تأسست الأكاديمية الليبية للاتصالات والمعلوماتية بموجب قرار مجلس إدراة الشركة الليبية للبريد والاتصالات وتقنية المعلومات القابضة رقم 15 لسنة 2021م، كشركة وطنية تدريبية وتطويرية متخصصة تخدم قطاع الاتصالات وبقية القطاعات الخاصة والحكومية، وتختص بإعداد ورفع كفاءة العناصر البشرية من خلال التدريب المستمر، كما تقدم الدراسات والاستشارات الفنية لتوطين التقنية وتمكين التحول الرقمي في كافة القطاعات ذات العلاقة. نسعى من خلالنا معالجة الفجوات والتحديات في تنفيذ استراتيجية التحول الرقمي في ليبيا، وذلك بإعداد الكوادر البشرية المدربة القادرة على التعامل مع التقنيات الحديثة وتطبيقها ميدانيا، بالإضافة لتطوير أداء العاملين في قطاع الاتصالات على كافة المستويات، لضمان تقديم أداء عالي المستوى يرقى إلى المواصفات العالمية والارتقاء بالجودة المهنية والفنية للكوادر البشرية. كما تساهم الأكاديمية في تدريب حديثي التخرج والباحثين عن العمل لتغطية الحاجة الوظيفية المتغيرة والمتزايدة، والذي سيؤدي دون أدنى شك إلى التطوير المؤسسي ورفع كفاءة وجودة الأنشطة الاقتصادية والبرامج والأعمال"];

  List<Map<String, String>> information = [
    { "الموقع":"https://lati.ly/","المجال": "لخدمات تقنية المعلومات والاستشارات \n في مجال تقنية المعلومات","حجم الشركة":"50-11 موظف",
    "المقر الرئيسي":"المقر الرئيسي","نوع":"الشركة عامة","تأسست":"2021","التخصص":"التدريب، تقنية المعلومات والاتصالات ، التحول الرقمي، الاستشارات"
    }
  ];
  List<String> skills = ["شبكات واتصالات","علوم الحاسوب"];
  int _currentTab = 0;

  Widget screensTabs()
  {
    switch(_currentTab){
      case 0:
        return aboutTab(summary,information);
      case 1:
        return availableTrainings(context,const TrainingDetailsCompany(),skills,"مساعد مدير","مصراتة","20","يوجد","شهرين");
      default:
        return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: centerAppBar(context,""),
      body: Stack(
        children: [
          Image.asset(
            "lib/images/empty-hallway-office-building.jpg",
            fit: BoxFit.cover,
            width: 600,
            height:200,
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0),
            child: Container(
              height: double.infinity,
              width: double.infinity,
              color: Colors.black.withOpacity(0.3),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Expanded(
                flex: 4,
                child: SizedBox(height: 10),
              ),
              Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.topCenter,
                children: [
                  Container(
                    height: 540,
                    width: double.infinity,
                    padding: const EdgeInsets.fromLTRB(18, 80, 18, 50),
                    decoration: BoxDecoration(
                      color: primaryColor,
                    ),
                    child: Align(
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          buildTextTitle(
                              "الاكاديمية الليبية للاتصالات والمعلوماتية",
                              12,
                              FontWeight.bold),
                          Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: buildText(
                                "لخدمات تقنية المعلومات والاستشارات\n في مجال تقنية المعلومات",
                                10,
                                FontWeight.normal,
                                const Color(0xFF848484)),
                          ),
                          const SizedBox(height: 30),
                          SizedBox(
                              height: 70,
                              width: double.infinity,
                              child: _tabs()),
                          Flexible(
                            child: SingleChildScrollView(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: screensTabs(),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: -70,
                    child: CircleAvatar(
                      radius: 60,
                      backgroundColor: Colors.white,
                      child: ClipOval(
                        child: Image.asset(
                          "lib/images/acadimic.jpg",
                          width: 130,
                          height: 130,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: const Padding(
        padding: EdgeInsets.only(bottom: 20.0, left: 20, right: 20),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(30)),
          //child: BottomBar(),
        ),
      ),
    );
  }

  Widget _tabs() {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: tabs.map((tab) {
          int index = tabs.indexOf(tab);
          return GestureDetector(
            onTap: () {
              setState(() {
                _currentTab = index;
              });
            },
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 10,
                    top: 7,
                  ),
                  child: buildTextTitle(tab, 13, FontWeight.normal),
                ),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.only(top: 5),
                  height: 2,
                  width: 100,
                  color: _currentTab == index ? const Color(0xFFF59039) : Colors.transparent,
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

}
