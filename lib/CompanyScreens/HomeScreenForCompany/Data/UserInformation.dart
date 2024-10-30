import 'package:chanceapp/CompanyScreens/AboutTrainee/Data/Education.dart';

class UserInformation {
  late final String name;
  late final String email;
  late final String? urlPhoto;
  late final String? city;
  late final String? phoneNumber;
  late final String? birthDate;
  late final String? address;
  late final List<String>? personalSkills;
  late final List<String>? language;
  late final List<String>? computerSkills;
  late final List<Education>? education;
  late final List<Education>? workExperience;
  late final List<Education>? volunteerActivities;
  late final List<Education>? activities;
  late final List<Education>? trainingCourses;
  late final List<Education>? projects;


  UserInformation({required this.name,required this.email,required this.urlPhoto, required this.city, required this.personalSkills,required this.language,required this.computerSkills,
  required this.workExperience,required this.activities,required this.trainingCourses,required this.education,
  required this.volunteerActivities,required this.projects});

  factory UserInformation.fromJson(Map<String, dynamic> json) {
    return UserInformation(
      name: json['name'],
      email: json['email'],
      urlPhoto: json['urlPhoto'],
      city: json['city']?? '',
        personalSkills: json['personalSkills'] != null
      ? List<String>.from(json['personalSkills']):[],
        language: json['language'] != null
            ? List<String>.from(json['language']):[],
      computerSkills: json['computerSkills'] != null
          ? List<String>.from(json['computerSkills']):[],
      workExperience: json['workExperience'] != null
          ? (json['workExperience'] as List)
          .map((item) => Education.fromJson(item))
          .toList()
          : [],
      education: json['volunteerActivities'] != null
          ? (json['education'] as List<dynamic>)
          .map((item) => Education.fromJson(item as Map<String, dynamic>))
          .toList():[],
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
