import 'package:chanceapp/CompanyScreens/AboutTrainee/Data/Education.dart';

import 'WorkExperience.dart';

class User {
  final String email;
  final String name;
  final UserInformation? userInformation;

  User({required this.email, required this.name, this.userInformation});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      email: json['email'],
      name: json['name'],
      userInformation: json['userInformation'] != null
          ? UserInformation.fromJson(json['userInformation'])
          : null,
    );
  }
}

class UserInformation {
  late final String name;
  late final String phoneNumber;
  late final String urlPhoto;
  late final String birthDate;
  late final String city;
  late final String address;
  final List<String> personalSkills;
  final List<Education> workExperience;
  late final List<Education> education;
  final List<String> computerSkills;

  UserInformation({
    required this.name,

    required this.phoneNumber,
    required this.birthDate,
    required this.urlPhoto,
    required this.city,
    required this.address,
    required this.personalSkills,
    required this.workExperience,
    required this.education,
    required this.computerSkills
  });

  factory UserInformation.fromJson(Map<String, dynamic> json) {
    return UserInformation(
      name:json["name"] ?? "Marwa",
      phoneNumber: json['phoneNumber'],
      urlPhoto: json['urlPhoto'],
      birthDate: json['birthDate'],
      city: json['city'],
      address: json['address'],
      personalSkills: List<String>.from(json['personalSkills']),
      computerSkills: List<String>.from(json['computerSkills']),
      workExperience: (json['workExperience'] as List<dynamic>)
          .map((item) => Education.fromJson(item as Map<String, dynamic>))
          .toList(),
      education: (json['education'] as List<dynamic>)
          .map((item) => Education.fromJson(item as Map<String, dynamic>))
          .toList(),

    );
  }
}
