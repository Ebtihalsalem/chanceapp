import 'package:json_annotation/json_annotation.dart';

part 'add_training_entity.g.dart';

@JsonSerializable()
class AddTrainingEntity {
  @JsonKey(name: '_id')
  int? id;
  String? title;
  String? description;
  String? type;
  String? level;
  int? companyId;
  String? startDate;
  String? endDate;
  bool? certificate;
  List<dynamic>? applications;
  String? trainingPosition;
  List<String?>? requiredSkills;
  int? numberOfPositions;
  String? city;

  AddTrainingEntity(
      this.id,
      this.title,
      this.description,
      this.type,
      this.level,
      this.companyId,
      this.startDate,
      this.endDate,
      this.certificate,
      this.applications,
      this.trainingPosition,
      this.requiredSkills,
      this.numberOfPositions,
      this.city);

  factory AddTrainingEntity.fromJson(Map<String, dynamic> json) =>
      _$AddTrainingEntityFromJson(json);

  Map<String, dynamic> toJson() => _$AddTrainingEntityToJson(this);
}
