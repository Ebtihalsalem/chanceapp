
class Training {
  String? trainingPosition;
  String? startDate;
  String? endDate;
  String? city;
  int? numberOfPositions;
  List<String> requiredSkills;
  String? description;
  String? type;
  String? level;

  Training({
    this.trainingPosition,
    this.startDate,
    this.endDate,
    this.city,
    this.numberOfPositions,
    required this.requiredSkills,
    this.description,
    this.type,
    this.level,
  });
  factory Training.fromJson(Map<String, dynamic> json) {
    return Training(
      trainingPosition: json['trainingPosition'],
      startDate: json['startDate'],
      endDate: json['endDate'],
      city: json['city'],
      numberOfPositions: json['numberOfPositions'],
      requiredSkills: List<String>.from(json['requiredSkills'] ?? []),
      description: json['description'],
      type: json['type'],
      level: json['level'],
    );
  }

  get title => null;

  get companyLogo => null;

  // تحويل كائن Training إلى JSON
  Map<String, dynamic> toJson() {
    return {
      'trainingPosition': trainingPosition,
      'startDate': startDate,
      'endDate': endDate,
      'city': city,
      'numberOfPositions': numberOfPositions,
      'requiredSkills': requiredSkills,
      'description': description,
      'type': type,
      'level': level,
    };
  }
}

