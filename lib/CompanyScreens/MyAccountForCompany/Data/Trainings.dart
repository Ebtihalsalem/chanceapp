class Training {
  final int id;
  final String title;
  final String description;
  final String companyEmail;
  final String startDate;
  final String endDate;
  final String trainingPosition;
  final List<String> requiredSkills;
  final int numberOfPositions;
  final String city;

  Training({
    required this.id,
    required this.title,
    required this.description,
    required this.companyEmail,
    required this.startDate,
    required this.endDate,
    required this.trainingPosition,
    required this.requiredSkills,
    required this.numberOfPositions,
    required this.city,
  });

  factory Training.fromJson(Map<String, dynamic> json) {
    return Training(
      id: json['_id'],
      title: json['title'],
      description: json['description'],
      companyEmail: json['companyEmail'],
      startDate: json['startDate'],
      endDate: json['endDate'],
      trainingPosition: json['trainingPosition'],
      requiredSkills: List<String>.from(json['requiredSkills'] ?? []),
      numberOfPositions: json['numberOfPositions'],
      city: json['city'],
    );
  }
}
