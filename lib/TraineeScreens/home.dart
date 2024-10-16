import 'package:chanceapp/CompanyScreens/TrainingDetails.dart';
import 'package:chanceapp/Core/App_theme.dart';
import 'package:chanceapp/TraineeScreens/NotifationScreen.dart';
import 'package:flutter/material.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import '../../UI Components/BottomBar.dart';
import '../UI Components/BuildText.dart';
import '../UI Components/Cards.dart';
import '../UI Components/SearchBar.dart';
import 'MessageScreen.dart';
import 'TrianingDetils.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

List<String> skills = ["شبكات واتصالات","علوم الحاسوب"];
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
                 buildSearchRow(),
                const SizedBox(height: 26),
                buildTextTitle('لأجلك', 20, FontWeight.bold),
                const SizedBox(height: 22),
                SizedBox(
                  height: 200,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: buildCard(context,const TrianingDetils(),secondaryColor,primaryColor,"lib/images/acadimic.jpg",
                            secondaryColor,primaryColor,skills,"مساعد المدير","مصراتة","الاكاديمية الليبية " ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 26),
                buildTextTitle('توصيات', 20, FontWeight.bold),
                const SizedBox(height: 22),
                SizedBox(
                  height: 200,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: buildCard(context,const TrianingDetils(),primaryColor,secondaryColor,"lib/images/almadar.png",
                            borderColor,secondaryColor,skills,"مهندس شبكات","مصراتة","المــدار " ),
                      );
                    },
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
         Navigator.of(context).pushReplacement(
                 MaterialPageRoute(builder: (context)=> const MessageScreen()));
        }),
        const SizedBox(width: 10),
        Padding(
          padding: const EdgeInsets.only(left: 18.0),
          child: _buildActionButton(EvaIcons.bell, () {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context)=> const NotifationScreen()));
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

  // Widget _buildForYouSection() {
  //   return InkWell(
  //     onTap:(){
  //       Navigator.of(context).pushReplacement(
  //         MaterialPageRoute(builder: (context) => const TrianingDetils())
  //       );
  //     },
  //     child: Container(
  //       height: 154,
  //       width: 344,
  //       decoration: BoxDecoration(
  //         color: const Color(0xFFF59039),
  //         borderRadius: BorderRadius.circular(20),
  //       ),
  //       padding: const EdgeInsets.all(8),
  //       child: Column(
  //         children: [
  //           Row(
  //             children: [
  //               Container(
  //                 width: 50,
  //                 height: 50,
  //                 decoration: BoxDecoration(
  //                   image: const DecorationImage(
  //                     image: AssetImage('lib/images/acadimic.jpg'),
  //                   ),
  //                   borderRadius: BorderRadius.circular(10),
  //                 ),
  //               ),
  //               Expanded(
  //                 child: Padding(
  //                   padding: const EdgeInsets.only(right: 10.0),
  //                   child: Column(
  //                     crossAxisAlignment: CrossAxisAlignment.start,
  //                     children: [
  //                       buildText(
  //                           'الأكاديمية البيئية لتكنولوجيا المعلومات',
  //                           12,
  //                           FontWeight.bold,
  //                           const Color(0xffEFEFEF)),
  //                       buildText('مساعدة مدير', 12, FontWeight.normal,
  //                           const Color(0xffEFEFEF)),
  //                     ],
  //                   ),
  //                 ),
  //               ),
  //               const Padding(
  //                 padding: EdgeInsets.only(left: 8.0),
  //                 child: Icon(EvaIcons.bookmarkOutline,color: Color(0xffEFEFEF)),
  //               ),
  //             ],
  //           ),
  //           const SizedBox(height: 26),
  //           Padding(
  //             padding: const EdgeInsets.only(right: 60.0),
  //             child: Row(
  //               children: [
  //                 Image.asset(
  //                   "lib/images/tdesign_location.png",
  //                   height: 15,
  //                   width: 15,
  //                 ),
  //                 Padding(
  //                   padding: const EdgeInsets.only(right: 4.0),
  //                   child: buildText(
  //                       'مصراتة', 12, FontWeight.normal, const Color(0xffEFEFEF)),
  //                 ),
  //               ],
  //             ),
  //           ),
  //           const SizedBox(height: 8),
  //           Row(
  //             children: [
  //               const SizedBox(width: 60),
  //               _buildOvalContainer('شبكات واتصالات', const Color(0xFFF3F3F3),
  //                   const Color(0xFFBBBBBB), const Color(0xFFF59039)),
  //               const SizedBox(width: 8),
  //               _buildOvalContainer('علوم حاسوب', const Color(0xFFF3F3F3),
  //                   const Color(0xFFBBBBBB), const Color(0xFFF59039)),
  //             ],
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  Widget _buildOvalContainer(String text, Color color, Color borderColor,
      Color fontColor) {
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

  Widget _buildRecommendationsSection() {
    return Container(
      height: 154,
      width: 344,
      decoration: BoxDecoration(
          color: const Color(0xFFF3F3F3),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: const Color(0xFFBBBBBB))),
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: AssetImage('lib/images/almadar.png'),
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
                      buildText('المــدار الجديــد', 12, FontWeight.bold,
                          const Color(0xFFF59039)),
                      buildText('مهندس شبكات', 12, FontWeight.normal,
                          const Color(0xFFF59039)),
                    ],
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Icon(EvaIcons.bookmarkOutline,color: Color(0xFFF59039)),
              ),
            ],
          ),
          const SizedBox(height: 26),
          Padding(
            padding: const EdgeInsets.only(right: 60.0),
            child: Row(
              children: [
                Image.asset(
                  "lib/images/Vector.png",
                  height: 15,
                  width: 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 4.0),
                  child: buildText(
                      'مصراتة', 12, FontWeight.normal, const Color(0xFFF59039)),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const SizedBox(width: 60),
              _buildOvalContainer('شبكات واتصالات', const Color(0xFFF59039),
                  const Color(0xFFF59039), const Color(0xFFF3F3F3)),
              const SizedBox(width: 8),
              _buildOvalContainer('علوم حاسوب', const Color(0xFFF59039),
                  const Color(0xFFF59039), const Color(0xFFF3F3F3)),
            ],
          ),
        ],
      ),
    );
  }




}