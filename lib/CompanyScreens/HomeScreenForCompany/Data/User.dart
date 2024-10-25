import 'UserInformation.dart';

class User {
  final String email;
  final String name;
  final UserInformation? userInformation; // يمكن أن يكون null

  User({
    required this.email,
    required this.name,
    this.userInformation,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      email: json['email'] ?? '', // إذا كانت القيمة null سيتم وضع قيمة افتراضية
      name: json['name'] ?? '', // استخدام قيمة افتراضية في حالة null
      userInformation: json['userInformation'] != null
          ? UserInformation.fromJson(json['userInformation'])
          : null, // إذا كانت null، اجعلها null
    );
  }
}
//
// class UserInformation {
//   final String? phoneNumber;
//   final String? city;
//   final String? address;
//   final List<String>? personalSkills; // يمكن أن يكون null
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
//       phoneNumber: json['phoneNumber'] ?? '', // قيمة افتراضية إذا كانت null
//       city: json['city'] ?? '', // قيمة افتراضية إذا كانت null
//       address: json['address'] ?? '', // قيمة افتراضية إذا كانت null
//       personalSkills: json['personalSkills'] != null
//           ? List<String>.from(json['personalSkills'])
//           : [], // قائمة فارغة إذا كانت null
//     );
//   }
// }
