import 'package:chanceapp/Core/App_theme.dart';
import 'package:chanceapp/TraineeScreens/CvScreen.dart';
import 'package:chanceapp/TraineeScreens/TrackingScreen.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import '../../UI Components/BottomBar.dart';
import '../Screens/LoginScreen.dart';
import '../UI Components/AppBar.dart';
import '../UI Components/BuildText.dart';
import '../UI Components/CircleImg.dart';
import 'BuildSetting.dart';


class MyAccount extends StatefulWidget {
  const MyAccount({super.key});

  @override
  State<MyAccount> createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
  String? fullName;
  String? avatarUrl;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: buildAppBar("الحساب","lib/images/logo.png",context,false),
        backgroundColor:primaryColor,

        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 35.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: CircleAvatar(
                  radius: 51.5,
                  backgroundColor: Colors.white,
                  child: ClipOval(
                    child: avatarUrl != null
                        ? Image.network(
                      avatarUrl!, // عرض الصورة من الرابط
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    )
                        : Container(), // إذا لم يكن هناك صورة
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                 // child: _buildHeaderTextTitle('ســارة أحمد', 18, FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Center(
                  child: TextButton(
                    onPressed: () {},
                    child: Container(
                      height: 34,
                      width: 200,
                      decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xFFF59039)),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 18.0, right: 40),
                            child: Icon(
                              EvaIcons.edit2Outline,
                              color: secondaryColor,
                              size: 16,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 4.0),
                            child: buildText(
                              'تعديل الحساب',
                              11,
                              FontWeight.bold,
                              const Color(0xFFF59039),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 30.0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 18.0, right: 80),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: secondaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 20,
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (context)=> const TrackingScreen())
                          );
                        },
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset(
                              "lib/images/hugeicons_analysis-text-link.png",
                              height: 20,
                              width: 20,
                            ),
                            const SizedBox(height: 4),
                            buildText(
                              "تتبع الخبرة",
                              11,
                              FontWeight.bold,
                              Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: secondaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 18,
                          vertical: 20,
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (context)=> const CvScreen())
                        );
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            "lib/images/profile.png",
                            height: 20,
                            width: 20,
                          ),
                          const SizedBox(height: 4),
                          buildText(
                            "ملفك المهني",
                            11,
                            FontWeight.bold,
                            Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              Flexible(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: buildSettings(context),
                  ),
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
      ),
    );
  }
}
// import 'package:eva_icons_flutter/eva_icons_flutter.dart';
// import 'package:flutter/material.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';
// import '../../UI Components/BottomBar.dart';
// import 'package:chanceapp/Screens/LoginScreen.dart';
//
//
// final supabase = Supabase.instance.client;
//
// class MyAccount extends StatefulWidget {
//   const MyAccount({super.key});
//
//   @override
//   State<MyAccount> createState() => _MyAccountState();
// }
//
// class _MyAccountState extends State<MyAccount> {
//   String? profileImageUrl;
//   String? fullName;
//
//   @override
//   void initState() {
//     super.initState();
//     _fetchUserData(); // جلب البيانات عند تحميل الشاشة
//   }
//
//   void _fetchUserData() {
//     final user = supabase.auth.currentUser;
//     if (user != null) {
//       setState(() {
//         profileImageUrl = user.userMetadata?['avatar_url'];
//         fullName = user.userMetadata?['full_name'];
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // Fetch the current user from Supabase
//     final user = supabase.auth.currentUser;
//     final profileImageUrl = user?.userMetadata?['avatar_url'];
//     final fullName = user?.userMetadata?['full_name'];
//
//     return SafeArea(
//       child: Scaffold(
//         resizeToAvoidBottomInset: false,
//         appBar: _buildAppBar(),
//         backgroundColor: const Color(0xffEFEFEF),
//         body: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 35.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Center(
//                 child: CircleAvatar(
//                   radius: 51.5,
//                   backgroundColor: Colors.white,
//                   child: ClipOval(
//                     child: profileImageUrl != null
//                         ? Image.network(
//                       profileImageUrl!,
//                       width: 100,
//                       height: 100,
//                       fit: BoxFit.cover,
//                     )
//                         : Image.asset(
//                       "lib/images/portrait-smiling-woman.jpg",
//                       width: 100,
//                       height: 100,
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 ),
//
//               ),
//               Center(
//                 child: Padding(
//                   padding: const EdgeInsets.all(20.0),
//                   child: _buildHeaderTextTitle(
//                     fullName ?? 'ســارة أحمد', // Default name if no full name is provided
//                     18,
//                     FontWeight.bold,
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(bottom: 20.0),
//                 child: Center(
//                   child: TextButton(
//                     onPressed: () {
//                       _showEditProfileDialog();
//                     },
//                     child: Container(
//                       height: 34,
//                       width: 200,
//                       decoration: BoxDecoration(
//                         border: Border.all(color: const Color(0xFFF59039)),
//                         borderRadius: BorderRadius.circular(30),
//                       ),
//                       child: Row(
//                         children: [
//                           const Padding(
//                             padding: EdgeInsets.only(left: 18.0, right: 40),
//                             child: Icon(
//                               EvaIcons.edit2Outline,
//                               color: Color(0xFFF59039),
//                               size: 16,
//                             ),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.only(top: 4.0),
//                             child: _buildHeaderText(
//                               'تعديل الحساب',
//                               11,
//                               FontWeight.bold,
//                               const Color(0xFFF59039),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(bottom: 30.0),
//                 child: Row(
//                   children: [
//                     // Other buttons
//                   ],
//                 ),
//               ),
//               Flexible(
//                 child: SingleChildScrollView(
//                   child: Padding(
//                     padding: const EdgeInsets.only(left: 8.0),
//                     child: _buildSettings(),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//         bottomNavigationBar: const Padding(
//           padding: EdgeInsets.only(bottom: 20.0, left: 20, right: 20),
//           child: ClipRRect(
//             borderRadius: BorderRadius.all(Radius.circular(30)),
//             child: BottomBar(),
//           ),
//         ),
//       ),
//     );
//   }
//
//   AppBar _buildAppBar() {
//     return AppBar(
//       backgroundColor: Colors.grey[200],
//       title: Padding(
//         padding: const EdgeInsets.only(top: 18, right: 18.0),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             Image.asset(
//               "lib/images/logo.png",
//               height: 25,
//               width: 25,
//             ),
//             const SizedBox(width: 10),
//             const Text(
//               "حسابي",
//               style: TextStyle(
//                 fontFamily: "Tajawal",
//                 fontSize: 16,
//                 color: Color(0xFF4A4C4D),
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildHeaderText(
//       String text,
//       double fontSize,
//       FontWeight fontWeight,
//       Color fontColor,
//       ) {
//     return Text(
//       text,
//       style: TextStyle(
//         color: fontColor,
//         fontSize: fontSize,
//         fontWeight: fontWeight,
//         fontFamily: "Tajawal",
//       ),
//       textAlign: TextAlign.center,
//       textDirection: TextDirection.rtl,
//     );
//   }
//
//   Widget _buildHeaderTextTitle(
//       String text,
//       double fontSize,
//       FontWeight fontWeight,
//       ) {
//     return Text(
//       text,
//       style: TextStyle(
//         color: const Color(0xff4A4C4D),
//         fontSize: fontSize,
//         fontWeight: fontWeight,
//         fontFamily: "Tajawal",
//       ),
//       textAlign: TextAlign.right,
//       textDirection: TextDirection.rtl,
//     );
//   }
//
//   Widget _buildSettings() {
//     return Container(
//       padding: const EdgeInsets.all(8),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           _buildHeaderTextTitle("الحسـاب", 16, FontWeight.bold),
//           Padding(
//             padding: const EdgeInsets.only(top: 18.0),
//             child: _buildCategory("معلومات شخصية", EvaIcons.personOutline),
//           ),
//           _buildCategory("الحسابات المرتبطة", EvaIcons.link2Outline),
//           const SizedBox(height: 20),
//           _buildHeaderTextTitle("عــام", 16, FontWeight.bold),
//           _buildCategory("الاشعارات", EvaIcons.bellOutline),
//           _buildCategory("الحماية", EvaIcons.shieldOutline),
//           _buildCategory("اللغة", EvaIcons.globe),
//           _buildCategory("مركز المساعدة", EvaIcons.questionMarkCircleOutline),
//           const SizedBox(height: 15),
//           Padding(
//             padding: const EdgeInsets.only(bottom: 20.0),
//             child: Center(
//               child: TextButton(
//                 onPressed: () async {
//                   await supabase.auth.signOut();
//                   if (context.mounted) {
//                     Navigator.of(context).pushReplacement(
//                       MaterialPageRoute(
//                         builder: (context) => const Loginscreen(),
//                       ),
//                     );
//                   }
//                 },
//                 child: Container(
//                   height: 34,
//                   width: 200,
//                   decoration: BoxDecoration(
//                     border: Border.all(color: const Color(0xFFF59039)),
//                     borderRadius: BorderRadius.circular(30),
//                   ),
//                   child: Row(
//                     children: [
//                       const Padding(
//                         padding: EdgeInsets.only(left: 18.0, right: 40),
//                         child: Icon(
//                           Icons.exit_to_app_outlined,
//                           color: Color(0xFFF59039),
//                           size: 16,
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.only(top: 4.0),
//                         child: _buildHeaderText(
//                           'تسجيل الخروج',
//                           11,
//                           FontWeight.bold,
//                           const Color(0xFFF59039),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildCategory(String title, IconData icon) {
//     return Padding(
//       padding: const EdgeInsets.only(top: 16.0),
//       child: Row(
//         children: [
//           Padding(
//             padding: const EdgeInsets.only(left: 12),
//             child: Icon(
//               icon,
//               size: 20,
//               color: const Color(0xFFBBBBBB),
//             ),
//           ),
//           _buildHeaderTextTitle(title, 13, FontWeight.normal),
//         ],
//       ),
//     );
//   }
//   void _showEditProfileDialog() {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         TextEditingController nameController = TextEditingController(text: fullName);
//         TextEditingController imageUrlController = TextEditingController(text: profileImageUrl);
//
//         return AlertDialog(
//           title: const Text('تعديل الحساب'),
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               TextField(
//                 controller: nameController,
//                 decoration: const InputDecoration(labelText: 'الاسم الكامل'),
//               ),
//               TextField(
//                 controller: imageUrlController,
//                 decoration: const InputDecoration(labelText: 'رابط الصورة الشخصية'),
//               ),
//             ],
//           ),
//           actions: <Widget>[
//             TextButton(
//               child: const Text('إلغاء'),
//               onPressed: () {
//                 Navigator.of(context).pop(); // إغلاق الحوار بدون تعديل
//               },
//             ),
//             TextButton(
//               child: const Text('حفظ'),
//               onPressed: () {
//                 // تحديث البيانات
//                 setState(() {
//                   fullName = nameController.text;
//                   profileImageUrl = imageUrlController.text;
//                 });
//
//                 // هنا يمكنك حفظ البيانات في قاعدة البيانات أيضًا باستخدام Supabase
//                 supabase.auth.updateUser(
//                   UserAttributes(data: {
//                     'full_name': fullName,
//                     'avatar_url': profileImageUrl,
//                   }),
//                 );
//
//                 Navigator.of(context).pop(); // إغلاق الحوار بعد حفظ البيانات
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }
//
// }
