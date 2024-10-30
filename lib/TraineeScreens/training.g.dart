// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'training.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Training _$TrainingFromJson(Map<String, dynamic> json) => Training(
      id: (json['_id'] as num?)?.toInt(),
      title: json['title'] as String,
      description: json['description'] as String,
      type: json['type'] as String,
      level: json['level'] as String,
      companyEmail: json['companyEmail'] as String,
      startDate: json['startDate'] as String,
      endDate: json['endDate'] as String,
      certificate: json['certificate'] as String,
      trainingPosition: json['trainingPosition'] as String,
      requiredSkills: (json['requiredSkills'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      numberOfPositions: (json['numberOfPositions'] as num).toInt(),
      city: json['city'] as String,
      companyName: json['companyName'] as String,
      companyLogo: json['companyLogo'] as String, role: '',
    );

Map<String, dynamic> _$TrainingToJson(Training instance) => <String, dynamic>{
      '_id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'type': instance.type,
      'level': instance.level,
      'companyEmail': instance.companyEmail,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
      'certificate': instance.certificate,
      'trainingPosition': instance.trainingPosition,
      'requiredSkills': instance.requiredSkills,
      'numberOfPositions': instance.numberOfPositions,
      'city': instance.city,
      'companyName': instance.companyName,
      'companyLogo': instance.companyLogo,
    };
