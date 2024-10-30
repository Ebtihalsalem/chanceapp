import 'dart:convert';

import 'package:chanceapp/UI%20Components/textFieldWithoutIcon.dart';
import 'package:chat_bubbles/bubbles/bubble_special_three.dart';
import 'package:flutter/material.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import '../../UI Components/BottomBar.dart';
import '../Core/App_theme.dart';
import '../UI Components/AppBar.dart';
import '../UI Components/BuildText.dart';
import 'package:http/http.dart' as http;

import 'Data/chats.dart';

class ChatsScreen extends StatefulWidget {
  const ChatsScreen({super.key});

  @override
  State<ChatsScreen> createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  late TextEditingController value = TextEditingController();
  List<Chats> chats = [];
  final String senderId = "user123"; // معرف المرسل
  final String receiverId = "user456"; // معرف المستقبل

  @override
  void initState() {
    super.initState();
    fetchChats(); // جلب الرسائل عند تحميل الشاشة
  }

  // دالة لجلب الرسائل من الـ API
  Future<void> fetchChats() async {
    final response = await http.get(Uri.parse('http://192.168.88.247:8085/chats/chat/$senderId/$receiverId'));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      setState(() {
        chats = jsonResponse.map((chat) => Chats.fromJson(chat)).toList();
      });
    } else {
      throw Exception('فشل في جلب الرسائل من الـ API');
    }
  }

  // دالة لإرسال الرسائل إلى الـ API وتخزينها في قاعدة البيانات
  Future<void> sendMessage(String message) async {
    final chatMessage = Chats(
      messageId: DateTime.now().millisecondsSinceEpoch.toString(), // توليد ID فريد
      senderId: senderId,
      receiverId: receiverId,
      message: message,
      timestamp: DateTime.now().toIso8601String(),
    );

    final response = await http.post(
      Uri.parse('http://192.168.88.247:8085/chats/chat'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(chatMessage.toJson()),
    );

    if (response.statusCode == 201) {
      setState(() {
        chats.add(chatMessage); // إضافة الرسالة إلى القائمة
        value.clear(); // مسح حقل الإدخال
      });
    } else {
      throw Exception('فشل في إرسال الرسالة');
    }
  }

  // دالة لحذف الرسالة
  Future<void> deleteMessage(String messageId) async {
    final response = await http.delete(
      Uri.parse('http://192.168.88.247:8085/chats/chat/$messageId'),
    );

    if (response.statusCode == 200) {
      setState(() {
        chats.removeWhere((chat) => chat.messageId == messageId);
      });
    } else {
      throw Exception('فشل في حذف الرسالة');
    }
  }

  // دالة لتعديل الرسالة
  Future<void> editMessage(String messageId, String newMessage) async {
    final response = await http.put(
      Uri.parse('http://192.168.88.247:8085/chats/chat/$messageId'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({'message': newMessage}),
    );

    if (response.statusCode == 200) {
      setState(() {
        final index = chats.indexWhere((chat) => chat.messageId == messageId);
        if (index != -1) {
          chats[index].message = newMessage; // تعديل الرسالة
        }
      });
    } else {
      throw Exception('فشل في تعديل الرسالة');
    }
  }

  // دالة لتظهر الوقت
  String getTime(String timestamp) {
    DateTime dateTime = DateTime.parse(timestamp);
    return "${dateTime.hour}:${dateTime.minute}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: buildAppBar("الاكاديمية الليبية","lib/images/Asset 6.png",context,false),
      backgroundColor: const Color(0xffEFEFEF),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 18.0),
          child:
          Column(crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 25,
                width: 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 4.0),
                    child: buildTextTitle("Today", 8, FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(height: 22),
              Expanded(
                child: ListView.builder(
                  itemCount: chats.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onLongPress: () {
                        // إظهار قائمة خيارات عند الضغط المطول
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('خيارات الرسالة'),
                              content: Text('ماذا تريد أن تفعل بالرسالة؟'),
                              actions: [
                                TextButton(
                                  child: Text('تعديل'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                    _showEditDialog(chats[index]); // عرض حوار التعديل
                                  },
                                ),
                                TextButton(
                                  child: Text('حذف'),
                                  onPressed: () {
                                    deleteMessage(chats[index].messageId); // حذف الرسالة
                                    Navigator.of(context).pop();
                                  },
                                ),
                                TextButton(
                                  child: Text('إلغاء'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            BubbleSpecialThree(
                              text: chats[index].message ?? '',
                              color: const Color(0xFFF59039),
                              tail: true,
                              textStyle: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              getTime(chats[index].timestamp),
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              Container(
                height: 90,
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Theme(
                      data: ThemeData(
                        colorScheme: const ColorScheme.light(
                          primary: Color(0xFFF59039),
                        ),
                      ),
                      child: SizedBox(
                        width: 280,
                        height: 45,
                        child: TextField(
                          controller: value,
                          textDirection: TextDirection.rtl, // الاتجاه من اليمين إلى اليسار
                          textAlign: TextAlign.right, // محاذاة النص إلى اليمين
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: const Color(0xFFF3F3F3),
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(color: Color(0xFFBCBCBC)),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Color(0xFFBCBCBC)),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            hintText: "أدخل رسالتك هنا", // نص تلميحي بالعربية
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 40,
                      width: 60,
                      decoration: BoxDecoration(
                        color: secondaryColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: IconButton(
                        onPressed: () {
                          if (value.text.isNotEmpty) {
                            sendMessage(value.text); // إرسال الرسالة
                          }
                        },
                        icon: const Icon(
                          EvaIcons.paperPlane,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
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

  // دالة لإظهار حوار التعديل
  void _showEditDialog(Chats chat) {
    TextEditingController editController = TextEditingController(text: chat.message);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('تعديل الرسالة'),
          content: TextField(
            controller: editController,
            textDirection: TextDirection.rtl,
            textAlign: TextAlign.right,
            decoration: InputDecoration(
              hintText: 'أدخل الرسالة المعدلة',
            ),
          ),
          actions: [
            TextButton(
              child: Text('تعديل'),
              onPressed: () {
                editMessage(chat.messageId, editController.text); // تعديل الرسالة
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('إلغاء'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
