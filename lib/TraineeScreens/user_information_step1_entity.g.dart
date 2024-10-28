// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_information_step1_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserInformationStep1Entity _$UserInformationStep1EntityFromJson(
        Map<String, dynamic> json) =>
    UserInformationStep1Entity(
      email: json['email'] as String?,
      name: json['name'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      birthDate: json['birthDate'] as String?,
      city: json['city'] as String?,
      address: json['address'] as String?,
    );

Map<String, dynamic> _$UserInformationStep1EntityToJson(
        UserInformationStep1Entity instance) =>
    <String, dynamic>{
      'email': instance.email,
      'name': instance.name,
      'phoneNumber': instance.phoneNumber,
      'birthDate': instance.birthDate,
      'city': instance.city,
      'address': instance.address,
    };
