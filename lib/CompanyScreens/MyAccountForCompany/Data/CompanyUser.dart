import 'Trainings.dart';

class CompanyUser {
  final String email;
  final String name;
  final Company company;

  CompanyUser({required this.email, required this.name, required this.company});

  factory CompanyUser.fromJson(Map<String, dynamic> json) {
    return CompanyUser(
      email: json['_id'],
      name: json['name'],
      company: Company.fromJson(json['company']),
    );
  }
}

class Company {
  final String industry;
  final String size;
  final String location;
  final String specializations;
  final String foundedYear;
  final String description;
  final String website;
  final String typeCompany;
  final List<Training> trainings;

  Company({
    required this.industry,
    required this.size,
    required this.location,
    required this.specializations,
    required this.foundedYear,
    required this.description,
    required this.website,
    required this.typeCompany,
    required this.trainings,
  });

  factory Company.fromJson(Map<String, dynamic> json) {
    return Company(
      industry: json['industry'],
      size: json['size'],
      location: json['location'],
      specializations: json['specializations'],
      foundedYear: json['foundedYear'],
      description: json['description'],
      website: json['website'],
      typeCompany: json['typeCompany'],
      trainings: (json['trainings'] as List)
          .map((item) => Training.fromJson(item))
          .toList(),
    );
  }
}
