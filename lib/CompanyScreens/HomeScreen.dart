import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

import '../../UI Components/BottomBar.dart';
import '../UI Components/BuildText.dart';

class CHomeScreen extends StatefulWidget {
  const CHomeScreen({super.key});

  @override
  State<CHomeScreen> createState() => _CHomeScreenState();
}

class _CHomeScreenState extends State<CHomeScreen> {
  List<String> personalSkillsList = [
    "حس المسؤولية",
    "التواصل مع الأخرين",
    "العمل مع فريق",
    "قدرات إبداعية",
  ];

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
              _buildSearchRow(),
              // ),
              const SizedBox(height: 26),
              _buildHeaderTextTitle('لأجلك', 20, FontWeight.bold),
              const SizedBox(height: 22),
              SizedBox(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: _buildForYouSection(),
                    );
                  },
                ),
              ),
              const SizedBox(height: 26),
              _buildHeaderTextTitle('المتدربين لديك', 20, FontWeight.bold),
              const SizedBox(height: 22),
              SizedBox(
                height: 210,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
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
          floatingActionButton: Padding(
            padding: const EdgeInsets.only(left: 18,bottom:10),
            child: FloatingActionButton(
                backgroundColor: const Color(0xFFF59039),
                onPressed: (){
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        backgroundColor: const Color(0xFFEFEFEF),
                        title:  Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "lib/images/logo.png",
                              height: 15,
                              width: 15,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Text("إضافة تدريب",
                                style: TextStyle(
                                    fontFamily: "Tajawal",
                                    fontSize: 15,
                                    color: Color(0xFF4A4C4D),
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                        content:
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                children: [
                                  const Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(bottom: 5, right: 20),
                                        child: Text(
                                          "المنصب",
                                          style: TextStyle(
                                              fontFamily: "Tajawal",
                                              color: Color(0xFF4A4C4D),
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 320,
                                    height: 50,
                                    child: TextField(
                                      textDirection: TextDirection.rtl,
                                      textAlign: TextAlign.right,
                                      decoration: InputDecoration(
                                        hintText: "منصب التدريب",
                                        hintStyle: const TextStyle(
                                            fontFamily: "Tajawal", color: Color(0xFFBBBBBB)),
                                        filled: true,
                                        fillColor: Colors.white,
                                        border: OutlineInputBorder(
                                          borderSide:
                                          const BorderSide(color: Color(0xFFBCBCBC)),
                                          borderRadius: BorderRadius.circular(30),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide:
                                          const BorderSide(color: Color(0xFFBCBCBC)),
                                          borderRadius: BorderRadius.circular(30),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 15,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                       Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          const Padding(
                                            padding: EdgeInsets.only(bottom: 5,  right: 10),
                                            child: Text(
                                              "تاريخ البدأ",
                                              style: TextStyle(
                                                  fontFamily: "Tajawal",
                                                  color: Color(0xFF4A4C4D),
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 120,
                                            height: 50,
                                            child: TextField(
                                              textDirection: TextDirection.rtl,
                                              textAlign: TextAlign.right,
                                              decoration: InputDecoration(
                                                filled: true,
                                                fillColor: Colors.white,
                                                prefixIcon: const Icon(EvaIcons.calendarOutline,
                                                    color: Color(0xFFBBBBBB)),
                                                border: OutlineInputBorder(
                                                  borderSide:
                                                  const BorderSide(color: Color(0xFFBCBCBC)),
                                                  borderRadius: BorderRadius.circular(30),
                                                ),
                                                enabledBorder: OutlineInputBorder(
                                                  borderSide:
                                                  const BorderSide(color: Color(0xFFBCBCBC)),
                                                  borderRadius: BorderRadius.circular(30),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),

                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          const Padding(
                                            padding: EdgeInsets.only(bottom: 5,  right: 10),
                                            child: Text(
                                              "تاريخ الانتهاء",
                                              style: TextStyle(
                                                  fontFamily: "Tajawal",
                                                  color: Color(0xFF4A4C4D),
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 120,
                                            height: 50,
                                            child: TextField(
                                              textDirection: TextDirection.rtl,
                                              textAlign: TextAlign.right,
                                              decoration: InputDecoration(
                                                filled: true,
                                                fillColor: Colors.white,
                                                prefixIcon: const Icon(EvaIcons.calendarOutline,
                                                    color: Color(0xFFBBBBBB)),
                                                border: OutlineInputBorder(
                                                  borderSide:
                                                  const BorderSide(color: Color(0xFFBCBCBC)),
                                                  borderRadius: BorderRadius.circular(30),
                                                ),
                                                enabledBorder: OutlineInputBorder(
                                                  borderSide:
                                                  const BorderSide(color: Color(0xFFBCBCBC)),
                                                  borderRadius: BorderRadius.circular(30),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),

                                    ],
                                  ),

                                  const SizedBox(height: 15,),
                                  const Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(bottom: 5,  right: 20),
                                        child: Text(
                                          "المدينة",
                                          style: TextStyle(
                                              fontFamily: "Tajawal",
                                              color: Color(0xFF4A4C4D),
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 320,
                                    height: 50,
                                    child: TextField(
                                      textDirection: TextDirection.rtl,
                                      textAlign: TextAlign.right,
                                      decoration: InputDecoration(
                                        hintText: "اسم المدينة",
                                        hintStyle: const TextStyle(
                                            fontFamily: "Tajawal", color: Color(0xFFBBBBBB)),
                                        filled: true,
                                        fillColor: Colors.white,
                                        border: OutlineInputBorder(
                                          borderSide:
                                          const BorderSide(color: Color(0xFFBCBCBC)),
                                          borderRadius: BorderRadius.circular(30),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide:
                                          const BorderSide(color: Color(0xFFBCBCBC)),
                                          borderRadius: BorderRadius.circular(30),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 15,),
                                  const Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(bottom: 5,  right: 20),
                                        child: Text(
                                          "العدد المطلوب",
                                          style: TextStyle(
                                              fontFamily: "Tajawal",
                                              color: Color(0xFF4A4C4D),
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 320,
                                    height: 50,
                                    child: TextField(
                                      textDirection: TextDirection.rtl,
                                      textAlign: TextAlign.right,
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: Colors.white,
                                        border: OutlineInputBorder(
                                          borderSide:
                                          const BorderSide(color: Color(0xFFBCBCBC)),
                                          borderRadius: BorderRadius.circular(30),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide:
                                          const BorderSide(color: Color(0xFFBCBCBC)),
                                          borderRadius: BorderRadius.circular(30),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 15,),
                                  const Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(bottom: 5,  right: 20),
                                        child: Text(
                                          "المهارات",
                                          style: TextStyle(
                                              fontFamily: "Tajawal",
                                              color: Color(0xFF4A4C4D),
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 320,
                                    height: 50,
                                    child: TextField(
                                      textDirection: TextDirection.rtl,
                                      textAlign: TextAlign.right,
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: Colors.white,
                                        border: OutlineInputBorder(
                                          borderSide:
                                          const BorderSide(color: Color(0xFFBCBCBC)),
                                          borderRadius: BorderRadius.circular(30),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide:
                                          const BorderSide(color: Color(0xFFBCBCBC)),
                                          borderRadius: BorderRadius.circular(30),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 20,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: buildText("الغاء",17,FontWeight.bold,const Color(0xFFF59039)),
                                      ),
                                      Container(
                                        height: 40,
                                        width: 80,
                                        decoration: BoxDecoration(
                                            color: const Color(0xFFF59039),
                                            borderRadius: BorderRadius.circular(10)
                                        ),
                                        child: TextButton(
                                          onPressed: () {},
                                          child:  buildText("اضافة",15,FontWeight.bold,Colors.white),
                                        ),
                                      ),
                                    ],
                                  ),

                                ],
                              ),
                            ),
                          ],
                        ),

                      );

                    },);
                },
                child: const Icon(EvaIcons.edit2,color: Color(0xFFF1F1F1),)
            ),
          )
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
        _buildActionButton(EvaIcons.messageCircle, () {}),
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
    return InkWell(
      onTap: () {},
      child: Container(
        width: 340,
        height: 200,
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
                      image:
                          AssetImage('lib/images/portrait-smiling-woman.jpg'),
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
                        buildText('ساره أحمد', 12, FontWeight.bold,
                            const Color(0xffEFEFEF)),
                        buildText('مهتمة بمجال شركتك', 12,
                            FontWeight.normal, const Color(0xffEFEFEF)),
                      ],
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child:
                      Icon(EvaIcons.bookmarkOutline, color: Color(0xffEFEFEF)),
                ),
              ],
            ),
            const SizedBox(height: 26),
            Padding(
              padding: const EdgeInsets.only(right: 60.0, bottom: 8),
              child: Row(
                children: [
                  Image.asset(
                    "lib/images/tdesign_location.png",
                    height: 15,
                    width: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 4.0),
                    child: buildText('مصراتة', 12, FontWeight.normal,
                        const Color(0xffEFEFEF)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const SizedBox(width: 60),
                _boxesSkills(personalSkillsList),
              ],
            ),
          ],
        ),
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
      child: buildText(text, 10, FontWeight.bold, fontColor),
    );
  }

  List<List<String>> chunkedList(List<String> list, int chunkSize) {
    List<List<String>> chunks = [];
    for (var i = 0; i < list.length; i += chunkSize) {
      chunks.add(list.sublist(
          i, i + chunkSize > list.length ? list.length : i + chunkSize));
    }
    return chunks;
  }

  Widget _boxesSkills(List<String> dataList) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: chunkedList(dataList, 2).map((chunk) {
        return Wrap(
          spacing: 1.0,
          runSpacing: 1.0,
          children: chunk.map((data) {
            return Padding(
              padding: const EdgeInsets.all(2.0),
              child: _buildOvalContainer(
                data,
                const Color(0xFFF3F3F3),
                const Color(0xFFBBBBBB),
                const Color(0xFFF59039),
              ),
            );
          }).toList(),
        );
      }).toList(),
    );
  }

  Widget _buildRecommendationsSection() {
    return Container(
      height: 90,
      width: 344,
      decoration: BoxDecoration(
          color: const Color(0xFFF3F3F3),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: const Color(0xFFBBBBBB))),
      padding: const EdgeInsets.all(8),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          children: [
            Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage('lib/images/portrait-smiling-woman.jpg'),
                ),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildText('ســارة أحمد', 10, FontWeight.bold,
                        const Color(0xFFF59039)),
                    buildText('من تدريب التصميم الجرافيكي', 10,
                        FontWeight.normal, const Color(0xFFF59039)),

                    const Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 1.0),
                            child: Icon( EvaIcons.star,
                              size: 13,
                              color: Color(0xFfFFD233),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 1.0),
                            child: Icon( EvaIcons.star,
                              size: 13,
                              color: Color(0xFfFFD233),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 1.0),
                            child: Icon( EvaIcons.star,
                              size: 13,
                              color: Color(0xFfFFD233),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 1.0),
                            child: Icon( EvaIcons.star,
                              size: 13,
                              color: Color(0xFFE6E6E6),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 1.0),
                            child: Icon( EvaIcons.star,
                              size: 13,
                              color: Color(0xFFE6E6E6),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),

      ]),
    );
  }
}
