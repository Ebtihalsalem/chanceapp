import '../Experience.dart';


import 'package:chanceapp/Core/App_theme.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';



Future<void> addExperience(Experience experience) async {
  final url = Uri.parse('https://192.168.1.14:8085/experiences');
  final response = await http.post(
    url,
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode(experience.toJson()),
  );

  if (response.statusCode == 201) {
    print('Experience added successfully');
  } else {
    print('Failed to add experience: ${response.body}');
  }
}

Future<List<Experience>> getExperiencesByUserId(int userId) async {
  final url = Uri.parse('http://192.168.1.14:8085/experiences/$userId');
  final response = await http.get(url);

  if (response.statusCode == 200) {
    final List<dynamic> data = jsonDecode(response.body);
    return data.map((e) => Experience.fromJson(e)).toList();
  } else {
    throw Exception('Failed to load experiences');
  }
}