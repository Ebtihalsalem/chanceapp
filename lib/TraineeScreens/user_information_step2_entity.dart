import 'package:json_annotation/json_annotation.dart';

part 'user_information_step2_entity.g.dart';

@JsonSerializable()
class UserInformationStep2Entity {
  String? email;
  List<UserInformationStep2EducationEntity?>? education;
  String? workExperience;
  List<UserInformationStep2TrainingCoursesEntity?>? trainingCourses;

  UserInformationStep2Entity({
    this.email,
    this.education,
    this.workExperience,
    this.trainingCourses,
  });

  factory UserInformationStep2Entity.fromJson(Map<String, dynamic> json) =>
      _$UserInformationStep2EntityFromJson(json);

  Map<String, dynamic> toJson() => _$UserInformationStep2EntityToJson(this);
}


@JsonSerializable()
class UserInformationStep2EducationEntity {
  String? degreeName;
  String? obtainedDate;
  String? institution;

  UserInformationStep2EducationEntity({
    this.degreeName,
    this.obtainedDate,
    this.institution,
  });

  factory UserInformationStep2EducationEntity.fromJson(Map<String, dynamic> json) =>
      _$UserInformationStep2EducationEntityFromJson(json);

  Map<String, dynamic> toJson() =>
      _$UserInformationStep2EducationEntityToJson(this);
}

@JsonSerializable()
class UserInformationStep2TrainingCoursesEntity {
  String? courseName;
  String? completionDate;

  UserInformationStep2TrainingCoursesEntity({
    this.courseName,
    this.completionDate,
  });

  factory UserInformationStep2TrainingCoursesEntity.fromJson(Map<String, dynamic> json) =>
      _$UserInformationStep2TrainingCoursesEntityFromJson(json);

  Map<String, dynamic> toJson() =>
      _$UserInformationStep2TrainingCoursesEntityToJson(this);
}
