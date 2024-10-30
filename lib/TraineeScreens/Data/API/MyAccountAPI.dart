import 'dart:convert';
import 'package:chanceapp/Core/App_theme.dart';
import 'package:chanceapp/TraineeScreens/CvScreen.dart';
import 'package:chanceapp/TraineeScreens/TrackingScreen.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../CompanyScreens/AboutTrainee/Data/User.dart';

Future<User?> fetchUserData(String email) async {
  final url = Uri.parse('http://192.168.1.4:8085/users/$email');
  final response = await http.get(url);

  if (response.statusCode == 200) {
    final Map<String, dynamic> data = json.decode(response.body);
    return User.fromJson(data);
  } else {
    throw Exception('Failed to load user data');
  }
}

