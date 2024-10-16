import 'dart:ui';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

import '../../UI Components/BottomBar.dart';

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
  int _currentTab = 0;

  Widget screensTabs()
  {
    switch(_currentTab){
      case 0:
        return aboutTab(summary);
      case 1:
        return avaibleTrianing();
      default:
        return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                    height: 650,
                    width: double.infinity,
                    padding: const EdgeInsets.fromLTRB(18, 90, 18, 50),
                    decoration: const BoxDecoration(
                      color: Color(0xFFEFEFEF),
                    ),
                    child: Align(
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          _buildHeaderTextTitle(
                              "الاكاديمية الليبية للاتصالات والمعلوماتية",
                              12,
                              FontWeight.bold),
                          Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: _buildHeaderText(
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
          child: BottomBar(),
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
                  child: _buildHeaderTextTitle(tab, 13, FontWeight.normal),
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

  Widget aboutTab(List<String> summary) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeaderTextTitle("ملخص", 14, FontWeight.bold),
          const SizedBox(height: 10),
          ...summary.map((data) {
            return _buildHeaderTextTitle(data, 12, FontWeight.normal);
          }),
          const SizedBox(height: 20,),
          _buildHeaderTextTitle("الموقع", 14, FontWeight.bold),
          const SizedBox(height: 10),
          ...information.map((data){
            return _buildHeaderTextTitle(data["الموقع"]!, 12, FontWeight.normal);
          }),
          const SizedBox(height: 20,),
          _buildHeaderTextTitle("المجال", 14, FontWeight.bold),
          const SizedBox(height: 10),
          ...information.map((data){
            return _buildHeaderTextTitle(data["المجال"]!, 12, FontWeight.normal);
          }),
          const SizedBox(height: 20,),
          _buildHeaderTextTitle("حجم الشركة", 14, FontWeight.bold),
          const SizedBox(height: 10),
          ...information.map((data){
            return _buildHeaderTextTitle(data["حجم الشركة"]!, 12, FontWeight.normal);
          }),
          const SizedBox(height: 20,),
          _buildHeaderTextTitle("المقر الرئيسي", 14, FontWeight.bold),
          const SizedBox(height: 10),
          ...information.map((data){
            return _buildHeaderTextTitle(data["المقر الرئيسي"]!, 12, FontWeight.normal);
          }),
          const SizedBox(height: 20,),
          _buildHeaderTextTitle("النوع", 14, FontWeight.bold),
          const SizedBox(height: 10),
          ...information.map((data){
            return _buildHeaderTextTitle(data["نوع"]!, 12, FontWeight.normal);
          }),
          const SizedBox(height: 20,),
          _buildHeaderTextTitle("تاسست", 14, FontWeight.bold),
          const SizedBox(height: 10),
          ...information.map((data){
            return _buildHeaderTextTitle(data["تأسست"]!, 12, FontWeight.normal);
          }),
          const SizedBox(height: 20,),
          _buildHeaderTextTitle("التخصص", 14, FontWeight.bold),
          const SizedBox(height: 10),
          ...information.map((data){
            return _buildHeaderTextTitle(data["التخصص"]!, 12, FontWeight.normal);
          }),

        ],
      ),
    );
  }

  Widget _buildOvalContainer(
      String text, Color color, Color borderColor, Color fontColor) {
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

  Widget avaibleTrianing() {
    return Container(
      height: 130,
      width: 344,
      decoration: BoxDecoration(
        color: const Color(0xFFF59039),
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 18,vertical: 18),
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
                      _buildHeaderText('مساعدة مدير', 14, FontWeight.bold,
                          const Color(0xffEFEFEF)),
                    ],
                  ),
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Image.asset(
                        "lib/images/tdesign_location.png",
                        height: 16,
                        width: 16,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: _buildHeaderText(
                            'مصراتة', 10, FontWeight.bold, const Color(0xffEFEFEF)),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      const Icon(EvaIcons.clockOutline,color: Color(0xFFEFEFEF),size: 16,),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: _buildHeaderText("شهرين", 10, FontWeight.bold,const Color(0xFFEFEFEF)),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      const Icon(EvaIcons.peopleOutline,color: Color(0xFFEFEFEF),size: 16,),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: _buildHeaderText("20", 10, FontWeight.bold,const Color(0xFFEFEFEF)),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      const Icon(Icons.monetization_on_outlined,color: Color(0xFFEFEFEF),size: 16,),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: _buildHeaderText("يوجد", 10, FontWeight.bold,const Color(0xFFEFEFEF)),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 10),
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
}
