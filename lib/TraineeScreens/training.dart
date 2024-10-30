import 'package:json_annotation/json_annotation.dart';

part 'training.g.dart';

@JsonSerializable()
class Training {
  @JsonKey(name: '_id')
  final int? id;
  final String title;
  final String description;
  final String type;
  final String level;
  final String companyEmail;
  final String startDate;
  final String endDate;
  final String certificate;
  final String trainingPosition;
  final List<String> requiredSkills;
  final int ?numberOfPositions;
  final String city;
  final String companyName;
  final String companyLogo;
  final String role; // Add this field for the role

  @JsonKey(ignore: true)
  bool isSaved;

  @JsonKey(ignore: true)
  bool isCompleted;

  Training({
    this.id,
    required this.title,
    required this.description,
    required this.type,
    required this.level,
    required this.companyEmail,
    required this.startDate,
    required this.endDate,
    required this.certificate,
    required this.trainingPosition,
    this.requiredSkills = const [],
    required this.numberOfPositions,
    required this.city,
    required this.companyName,
    required this.companyLogo,
    required this.role, // Initialize role
    this.isSaved = false,
    this.isCompleted = false,
  });

  factory Training.fromJson(Map<String, dynamic> json) => _$TrainingFromJson(json);
  Map<String, dynamic> toJson() => _$TrainingToJson(this);
}


// @JsonSerializable()
// class Training {
//   @JsonKey(name: '_id')
//   final int? id;
//   final String title;
//   final String description;
//   final String type;
//   final String level;
//   final String companyEmail;
//   final String startDate;
//   final String endDate;
//   final String certificate;
//   //final List<Application1> applications; // تأكد من تعريف هذا الكلاس أيضًا
//   final String trainingPosition;
//   final List<String> requiredSkills;
//   final int numberOfPositions;
//   final String city;
//   final String companyName; // إضافة اسم الشركة
//   final String companyLogo;
//
//   Training({
//     this.id,
//     required this.title,
//     required this.description,
//     required this.type,
//     required this.level,
//     required this.companyEmail,
//     required this.startDate,
//     required this.endDate,
//     required this.certificate,
//    // this.applications = const [],
//     required this.trainingPosition,
//     this.requiredSkills = const [],
//     required this.numberOfPositions,
//     required this.city,
//     required this.companyName,
//     required this.companyLogo,
//   });
//
//
//   // تحويل JSON إلى Training
//   factory Training.fromJson(Map<String, dynamic> json) => _$TrainingFromJson(json);
//
//   // تحويل Training إلى JSON
//   Map<String, dynamic> toJson() => _$TrainingToJson(this);
