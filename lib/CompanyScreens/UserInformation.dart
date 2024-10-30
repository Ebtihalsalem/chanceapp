import 'dart:convert';
import 'package:http/http.dart' as http;

// كلاس التعليم
class Education {
  final String degreeName;
  final String obtainedDate;
  final String institution;

  Education({
    required this.degreeName,
    required this.obtainedDate,
    required this.institution,
  });

  factory Education.fromJson(Map<String, dynamic> json) {
    return Education(
      degreeName: json['degreeName'],
      obtainedDate: json['obtainedDate'],
      institution: json['institution'],
    );
  }
}

// كلاس معلومات المستخدم
class UserInformation {
  final String name;
  final String email;
  final String urlPhoto;
  final String? city;
  final String phoneNumber;
  final String birthDate;
  final String address;
  final List<String>? personalSkills;
  final List<String>? language;
  final List<String>? computerSkills;
  final List<Education>? education;
  final List<Education>? workExperience;
  final List<Education>? volunteerActivities;
  final List<Education>? activities;
  final List<Education>? trainingCourses;
  final List<Education>? projects;

  UserInformation({
    required this.name,
    required this.email,
    required this.urlPhoto,
    this.city,
    required this.phoneNumber,
    required this.birthDate,
    required this.address,
    this.personalSkills,
    this.language,
    this.computerSkills,
    this.education,
    this.workExperience,
    this.volunteerActivities,
    this.activities,
    this.trainingCourses,
    this.projects,
  });

  factory UserInformation.fromJson(Map<String, dynamic> json) {
    return UserInformation(
      name: json['name'],
      email: json['email'],
      urlPhoto: json['urlPhoto'],
      city: json['city'] ?? '',
      phoneNumber: json['phoneNumber'],
      birthDate: json['birthDate'],
      address: json['address'],
      personalSkills: json['personalSkills'] != null
          ? List<String>.from(json['personalSkills'])
          : [],
      language: json['language'] != null
          ? List<String>.from(json['language'])
          : [],
      computerSkills: json['computerSkills'] != null
          ? List<String>.from(json['computerSkills'])
          : [],
      education: json['education'] != null
          ? (json['education'] as List<dynamic>)
          .map((item) => Education.fromJson(item as Map<String, dynamic>))
          .toList()
          : [],
      workExperience: json['workExperience'] != null
          ? (json['workExperience'] as List<dynamic>)
          .map((item) => Education.fromJson(item as Map<String, dynamic>))
          .toList()
          : [],
      volunteerActivities: json['volunteerActivities'] != null
          ? (json['volunteerActivities'] as List<dynamic>)
          .map((item) => Education.fromJson(item as Map<String, dynamic>))
          .toList()
          : [],
      activities: json['activities'] != null
          ? (json['activities'] as List<dynamic>)
          .map((item) => Education.fromJson(item as Map<String, dynamic>))
          .toList()
          : [],
      trainingCourses: json['trainingCourses'] != null
          ? (json['trainingCourses'] as List<dynamic>)
          .map((item) => Education.fromJson(item as Map<String, dynamic>))
          .toList()
          : [],
      projects: json['projects'] != null
          ? (json['projects'] as List<dynamic>)
          .map((item) => Education.fromJson(item as Map<String, dynamic>))
          .toList()
          : [],
    );
  }
}
