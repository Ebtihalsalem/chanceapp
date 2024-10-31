class Education {
  final String degreeName;
  final String obtainedDate;
  final String institution;

  Education({
    required this.degreeName,
    required this.obtainedDate,
    required this.institution,
  });

  factory Education.fromJson(Map<String, dynamic> json) {
    return Education(
      degreeName: json['degreeName'],
      obtainedDate: json['obtainedDate'],
      institution: json['institution'],
    );
  }
}
