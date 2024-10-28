// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_information_step2_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserInformationStep2Entity _$UserInformationStep2EntityFromJson(
        Map<String, dynamic> json) =>
    UserInformationStep2Entity(
      email: json['email'] as String?,
      education: (json['education'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : UserInformationStep2EducationEntity.fromJson(
                  e as Map<String, dynamic>))
          .toList(),
      workExperience: json['workExperience'] as String?,
      trainingCourses: (json['trainingCourses'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : UserInformationStep2TrainingCoursesEntity.fromJson(
                  e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UserInformationStep2EntityToJson(
        UserInformationStep2Entity instance) =>
    <String, dynamic>{
      'email': instance.email,
      'education': instance.education,
      'workExperience': instance.workExperience,
      'trainingCourses': instance.trainingCourses,
    };

UserInformationStep2EducationEntity
    _$UserInformationStep2EducationEntityFromJson(Map<String, dynamic> json) =>
        UserInformationStep2EducationEntity(
          degreeName: json['degreeName'] as String?,
          obtainedDate: json['obtainedDate'] as String?,
          institution: json['institution'] as String?,
        );

Map<String, dynamic> _$UserInformationStep2EducationEntityToJson(
        UserInformationStep2EducationEntity instance) =>
    <String, dynamic>{
      'degreeName': instance.degreeName,
      'obtainedDate': instance.obtainedDate,
      'institution': instance.institution,
    };

UserInformationStep2TrainingCoursesEntity
    _$UserInformationStep2TrainingCoursesEntityFromJson(
            Map<String, dynamic> json) =>
        UserInformationStep2TrainingCoursesEntity(
          courseName: json['courseName'] as String?,
          completionDate: json['completionDate'] as String?,
        );

Map<String, dynamic> _$UserInformationStep2TrainingCoursesEntityToJson(
        UserInformationStep2TrainingCoursesEntity instance) =>
    <String, dynamic>{
      'courseName': instance.courseName,
      'completionDate': instance.completionDate,
    };
