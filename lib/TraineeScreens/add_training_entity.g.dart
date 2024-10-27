// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_training_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddTrainingEntity _$AddTrainingEntityFromJson(Map<String, dynamic> json) =>
    AddTrainingEntity(
      (json['_id'] as num?)?.toInt(),
      json['title'] as String?,
      json['description'] as String?,
      json['type'] as String?,
      json['level'] as String?,
      (json['companyId'] as num?)?.toInt(),
      json['startDate'] as String?,
      json['endDate'] as String?,
      json['certificate'] as bool?,
      json['applications'] as List<dynamic>?,
      json['trainingPosition'] as String?,
      (json['requiredSkills'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      (json['numberOfPositions'] as num?)?.toInt(),
      json['city'] as String?,
    );

Map<String, dynamic> _$AddTrainingEntityToJson(AddTrainingEntity instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'type': instance.type,
      'level': instance.level,
      'companyId': instance.companyId,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
      'certificate': instance.certificate,
      'applications': instance.applications,
      'trainingPosition': instance.trainingPosition,
      'requiredSkills': instance.requiredSkills,
      'numberOfPositions': instance.numberOfPositions,
      'city': instance.city,
    };
