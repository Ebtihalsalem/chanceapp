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

}

//   import 'package:chanceapp/CompanyScreens/TrainingDetails.dart';
// import 'package:chanceapp/Core/App_theme.dart';
// import 'package:chanceapp/TraineeScreens/NotifationScreen.dart';
// import 'package:flutter/material.dart';
// import 'package:eva_icons_flutter/eva_icons_flutter.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';
// import '../../UI Components/BottomBar.dart';
// import '../UI Components/BuildText.dart';
// import '../UI Components/Cards.dart';
// import '../UI Components/SearchBar.dart';
// import 'MessageScreen.dart';
// import 'TrianingDetils.dart';
//
// final supabase = Supabase.instance.client;
//
// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});
//
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//   final List<String> skills = ["شبكات واتصالات", "علوم الحاسوب"];
//   String? userName;
//   String? profileImageUrl;
//
//   @override
//   void initState() {
//     super.initState();
//     _loadUserData();
//   }
//
//   Future<void> _loadUserData() async {
//     final user = supabase.auth.currentUser;
//     setState(() {
//       userName = user?.userMetadata?['full_name'];
//       profileImageUrl = user?.userMetadata?['avatar_url'];
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       appBar: _buildAppBar(),
//       backgroundColor: const Color(0xffEFEFEF),
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 40.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               buildSearchRow(),
//               const SizedBox(height: 26),
//               buildTextTitle('لأجلك', 20, FontWeight.bold),
//               const SizedBox(height: 22),
//               _buildHorizontalList(10, "lib/images/acadimic.jpg", "مساعد المدير", "مصراتة", "الاكاديمية الليبية "),
//               const SizedBox(height: 26),
//               buildTextTitle('توصيات', 20, FontWeight.bold),
//               const SizedBox(height: 22),
//               _buildHorizontalList(10, "lib/images/almadar.png", "مهندس شبكات", "مصراتة", "المــدار "),
//             ],
//           ),
//         ),
//       ),
//       bottomNavigationBar: const Padding(
//         padding: EdgeInsets.only(bottom: 20.0, left: 20, right: 20),
//         child: ClipRRect(
//           borderRadius: BorderRadius.all(Radius.circular(30)),
//           child: BottomBar(),
//         ),
//       ),
//     );
//   }
//
//   AppBar _buildAppBar() {
//     return AppBar(
//       backgroundColor: primaryColor,
//       automaticallyImplyLeading: false,
//       title: Padding(
//         padding: const EdgeInsets.only(top: 18, right: 18.0),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             if (profileImageUrl != null)
//               CircleAvatar(
//                 backgroundImage: NetworkImage(profileImageUrl!),
//                 radius: 20,
//               ),
//             const SizedBox(width: 10),
//             Text(
//               userName != null ? "مرحبًا، $userName !" : "مرحبًا!",
//               style: const TextStyle(
//                 fontFamily: "Tajawal",
//                 fontSize: 16,
//                 color: Color(0xFF4A4C4D),
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ],
//         ),
//       ),
//       actions: [
//         _buildActionButton(EvaIcons.messageCircle, () {
//           Navigator.of(context).pushReplacement(
//             MaterialPageRoute(builder: (context) => const MessageScreen()),
//           );
//         }),
//         const SizedBox(width: 10),
//         Padding(
//           padding: const EdgeInsets.only(left: 18.0),
//           child: _buildActionButton(EvaIcons.bell, () {
//             Navigator.of(context).pushReplacement(
//               MaterialPageRoute(builder: (context) => const NotifationScreen()),
//             );
//           }),
//         ),
//       ],
//     );
//   }
//
//   Widget _buildHorizontalList(int itemCount, String imageUrl, String title, String location, String companyName) {
//     return SizedBox(
//       height: 200,
//       child: ListView.builder(
//         scrollDirection: Axis.horizontal,
//         itemCount: itemCount,
//         itemBuilder: (context, index) {
//           return Padding(
//             padding: const EdgeInsets.only(left: 8.0),
//             child: buildCard(
//               context,
//               const TrianingDetils(),
//               secondaryColor,
//               primaryColor,
//               imageUrl,
//               secondaryColor,
//               primaryColor,
//               skills,
//               title,
//               location,
//               companyName,
//             ),
//           );
//         },
//       ),
//     );
//   }
//
//   Widget _buildActionButton(IconData icon, VoidCallback onTap) {
//     return Container(
//       margin: const EdgeInsets.only(top: 18.0, left: 18),
//       child: GestureDetector(
//         onTap: onTap,
//         child: Container(
//           height: 40,
//           width: 40,
//           decoration: const BoxDecoration(
//             shape: BoxShape.circle,
//             color: Color(0xffE7E7E7),
//           ),
//           child: Icon(
//             icon,
//             color: const Color(0xFFF59039),
//             size: 25,
//           ),
//         ),
//       ),
//     );
//   }
// }
