class Experience {
  final int userId;
  final int trainingId;
  final String startDate;
  final String endDate;
  final String status;
  final int hoursCompleted;
  final List<String> skillsAcquired;

  Experience({
    required this.userId,
    required this.trainingId,
    required this.startDate,
    required this.endDate,
    required this.status,
    required this.hoursCompleted,
    required this.skillsAcquired,
  });

  factory Experience.fromJson(Map<String, dynamic> json) {
    return Experience(
      userId: json['userId'],
      trainingId: json['trainingId'],
      startDate: json['startDate'],
      endDate: json['endDate'],
      status: json['status'],
      hoursCompleted: json['hoursCompleted'],
      skillsAcquired: List<String>.from(json['skillsAcquired']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'trainingId': trainingId,
      'startDate': startDate,
      'endDate': endDate,
      'status': status,
      'hoursCompleted': hoursCompleted,
      'skillsAcquired': skillsAcquired,
    };
  }
}
