import 'UserInformation.dart';

class User {
  final String email;
  final String name;
  final UserInformation? userInformation;

  User({
    required this.email,
    required this.name,
    this.userInformation,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      email: json['email'] ?? '',
      name: json['name'] ?? '',
      userInformation: json['userInformation'] != null
          ? UserInformation.fromJson(json['userInformation'])
          : null,
    );
  }
}
//
// class UserInformation {
//   final String? phoneNumber;
//   final String? city;
//   final String? address;
//   final List<String>? personalSkills;
//
//   UserInformation({
//     this.phoneNumber,
//     this.city,
//     this.address,
//     this.personalSkills,
//   });
//
//   factory UserInformation.fromJson(Map<String, dynamic> json) {
//     return UserInformation(
//       phoneNumber: json['phoneNumber'] ?? '',
//       city: json['city'] ?? '',
//       address: json['address'] ?? '',
//       personalSkills: json['personalSkills'] != null
//           ? List<String>.from(json['personalSkills'])
//           : [],
//     );
//   }
// }
