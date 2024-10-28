class WorkExperience {
  final String jobTitle;
  final String company;
  final String startDate;
  final String endDate;

  WorkExperience({
    required this.jobTitle,
    required this.company,
    required this.startDate,
    required this.endDate
  });

  factory WorkExperience.fromJson(Map<String, dynamic> json) {
    return WorkExperience(
      jobTitle: json['jobTitle'],
      company: json['company'],
      startDate: json['startDate'],
        endDate:json["endDate"]
    );
  }
}
