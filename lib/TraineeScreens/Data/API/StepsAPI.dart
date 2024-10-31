

import 'dart:convert';

import 'package:chanceapp/CompanyScreens/AboutTrainee/Data/Education.dart';
import 'package:chanceapp/CompanyScreens/HomeScreenForCompany/Data/UserInformation.dart';
import 'package:chanceapp/Core/App_theme.dart';
import 'package:chanceapp/UI%20Components/CenterAppBar.dart';
import 'package:chanceapp/UI%20Components/Snackbar.dart';
import 'package:flutter/material.dart';

import "package:http/http.dart" as http;
late UserInformation user;
Future<void> sendAllData() async {
  final apiUrl = 'http://192.168.1.4:8085/users/data_user';
  try {
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(user),
    );

    if (response.statusCode == 200) {
      print("تم إرسال جميع البيانات بنجاح");
    } else {
      print("فشل إرسال جميع البيانات: ${response.body}");
    }
  } catch (e) {
    print("خطأ في الإرسال: $e");
  }
}