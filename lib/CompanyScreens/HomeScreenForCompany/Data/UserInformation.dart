class UserInformation {
  final String name;
  final String? city;
  final List<String>? personalSkills;

  UserInformation({required this.name, required this.city, required this.personalSkills});

  factory UserInformation.fromJson(Map<String, dynamic> json) {
    return UserInformation(
      name: json['name'],
      city: json['city']?? '',
        personalSkills: json['personalSkills'] != null
      ? List<String>.from(json['personalSkills']):[]
    );
  }
}
