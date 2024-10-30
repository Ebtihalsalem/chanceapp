import 'package:chanceapp/Core/App_theme.dart';
import 'package:flutter/material.dart';
import 'package:chanceapp/TraineeScreens/chats.dart';

import '../UI Components/AppBar.dart';
import '../UI Components/BottomBar.dart';
import '../UI Components/SearchBar.dart';
import '../UI Components/TitleCards.dart';
import 'ChatsScreen.dart';

class UserChat {
  final String userId;
  final String userName;
  final String userImage;

  UserChat({required this.userId, required this.userName, required this.userImage});
}

class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  // قائمة المستخدمين للدردشة
  final List<UserChat> users = [
    UserChat(userId: "user456", userName: "الاكاديمية الليبية", userImage: "lib/images/acadimic.jpg"),
    UserChat(userId: "user789", userName: "شخص آخر", userImage: "lib/images/user2.jpg"),
    // أضف المزيد من المستخدمين حسب الحاجة
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: buildAppBar("الرسائل", "lib/images/logo.png", context, false),
      backgroundColor: primaryColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildSearchRow(),
              const SizedBox(height: 22),
              Expanded(
                child: ListView.builder(
                  itemCount: users.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: GestureDetector(
                        onTap: () {
                          // عند النقر على البطاقة، انتقل إلى شاشة الدردشة مع معرف المستخدم المحدد
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => ChatsScreen(
                                senderId: "user123", // معرف المرسل
                                receiverId: users[index].userId, // معرف المستقبل
                              ),
                            ),
                          );
                        },
                        child: titleCard(
                          users[index].userImage,
                          users[index].userName,
                          "كيف استطيع مساعدتك؟", // نص افتراضي
                        ),
                      ),
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
}