import 'package:json_annotation/json_annotation.dart';

part 'userInformationStep1Entity.g.dart';

@JsonSerializable()
class UserInformationStep1Entity {
  String? email;
  String? name;
  String? phoneNumber;
  String? birthDate;
  String? city;
  String? address;

  // استخدم بارامترات مسماة
  UserInformationStep1Entity({
    this.email,
    this.name,
    this.phoneNumber,
    this.birthDate,
    this.city,
    this.address,
  });

  factory UserInformationStep1Entity.fromJson(Map<String, dynamic> json) =>
      _$UserInformationStep1EntityFromJson(json);

  Map<String, dynamic> toJson() => _$UserInformationStep1EntityToJson(this);
}