// /// id : 166
// /// name : "أحمد محمد"
// /// email : "ahmed@example.com"
// /// phoneNumber : "0501234567"
// /// birthDate : "1990-05-01"
// /// city : "الرياض"
// /// address : "شارع الملك فهد"
// /// skills : "برمجة، تصميم قواعد البيانات"
// /// experience : "10 سنوات في تطوير البرمجيات"
// /// education : [{"degreeName":"بكالوريوس في علوم الحاسوب","obtainedDate":"2012-06-15","institution":"جامعة الملك سعود"},{"degreeName":"ماجستير في تقنية المعلومات","obtainedDate":"2015-12-20","institution":"جامعة الملك فهد للبترول والمعادن"}]
// /// workExperience : "عملت كمهندس برمجيات في شركة XYZ لمدة 5 سنوات"
// /// volunteerActivities : [{"activityName":"تدريس البرمجة للأطفال","organization":"جمعية خيرية","date":"2018-07-01"}]
// /// projects : "تطوير تطبيق جوال لإدارة المهام"
// /// googleId : "some-google-id"
// /// applications : []
// /// cvUrl : "https://example.com/cv/ahmed"
// /// trainingCourses : [{"courseName":"دورة متقدمة في تطوير تطبيقات الويب","completionDate":"2020-05-30"}]
// /// personalSkills : "العمل الجماعي، التواصل الفعال"
// /// computerSkills : "مهارات متقدمة في Java, Kotlin, Python"
//
// class JsonSteps {
//   JsonSteps({
//       int? id,
//       String? name,
//       String? email,
//       String? phoneNumber,
//       String? birthDate,
//       String? city,
//       String? address,
//       String? skills,
//       String? experience,
//       List<Education>? education,
//       String? workExperience,
//       List<VolunteerActivities>? volunteerActivities,
//       String? projects,
//       String? googleId,
//       List<dynamic>? applications,
//       String? cvUrl,
//       List<TrainingCourses>? trainingCourses,
//       String? personalSkills,
//       String? computerSkills,}){
//     _id = id;
//     _name = name;
//     _email = email;
//     _phoneNumber = phoneNumber;
//     _birthDate = birthDate;
//     _city = city;
//     _address = address;
//     _skills = skills;
//     _experience = experience;
//     _education = education;
//     _workExperience = workExperience;
//     _volunteerActivities = volunteerActivities;
//     _projects = projects;
//     _googleId = googleId;
//     _applications = applications;
//     _cvUrl = cvUrl;
//     _trainingCourses = trainingCourses;
//     _personalSkills = personalSkills;
//     _computerSkills = computerSkills;
// }
//
//   JsonSteps.fromJson(dynamic json) {
//     _id = json['id'];
//     _name = json['name'];
//     _email = json['email'];
//     _phoneNumber = json['phoneNumber'];
//     _birthDate = json['birthDate'];
//     _city = json['city'];
//     _address = json['address'];
//     _skills = json['skills'];
//     _experience = json['experience'];
//     if (json['education'] != null) {
//       _education = [];
//       json['education'].forEach((v) {
//         _education?.add(Education.fromJson(v));
//       });
//     }
//     _workExperience = json['workExperience'];
//     if (json['volunteerActivities'] != null) {
//       _volunteerActivities = [];
//       json['volunteerActivities'].forEach((v) {
//         _volunteerActivities?.add(VolunteerActivities.fromJson(v));
//       });
//     }
//     _projects = json['projects'];
//     _googleId = json['googleId'];
//     if (json['applications'] != null) {
//       _applications = [];
//       json['applications'].forEach((v) {
//         _applications?.add(Dynamic.fromJson(v));
//       });
//     }
//     _cvUrl = json['cvUrl'];
//     if (json['trainingCourses'] != null) {
//       _trainingCourses = [];
//       json['trainingCourses'].forEach((v) {
//         _trainingCourses?.add(TrainingCourses.fromJson(v));
//       });
//     }
//     _personalSkills = json['personalSkills'];
//     _computerSkills = json['computerSkills'];
//   }
//   int? _id;
//   String? _name;
//   String? _email;
//   String? _phoneNumber;
//   String? _birthDate;
//   String? _city;
//   String? _address;
//   String? _skills;
//   String? _experience;
//   List<Education>? _education;
//   String? _workExperience;
//   List<VolunteerActivities>? _volunteerActivities;
//   String? _projects;
//   String? _googleId;
//   List<dynamic>? _applications;
//   String? _cvUrl;
//   List<TrainingCourses>? _trainingCourses;
//   String? _personalSkills;
//   String? _computerSkills;
// JsonSteps copyWith({  int? id,
//   String? name,
//   String? email,
//   String? phoneNumber,
//   String? birthDate,
//   String? city,
//   String? address,
//   String? skills,
//   String? experience,
//   List<Education>? education,
//   String? workExperience,
//   List<VolunteerActivities>? volunteerActivities,
//   String? projects,
//   String? googleId,
//   List<dynamic>? applications,
//   String? cvUrl,
//   List<TrainingCourses>? trainingCourses,
//   String? personalSkills,
//   String? computerSkills,
// }) => JsonSteps(  id: id ?? _id,
//   name: name ?? _name,
//   email: email ?? _email,
//   phoneNumber: phoneNumber ?? _phoneNumber,
//   birthDate: birthDate ?? _birthDate,
//   city: city ?? _city,
//   address: address ?? _address,
//   skills: skills ?? _skills,
//   experience: experience ?? _experience,
//   education: education ?? _education,
//   workExperience: workExperience ?? _workExperience,
//   volunteerActivities: volunteerActivities ?? _volunteerActivities,
//   projects: projects ?? _projects,
//   googleId: googleId ?? _googleId,
//   applications: applications ?? _applications,
//   cvUrl: cvUrl ?? _cvUrl,
//   trainingCourses: trainingCourses ?? _trainingCourses,
//   personalSkills: personalSkills ?? _personalSkills,
//   computerSkills: computerSkills ?? _computerSkills,
// );
//   int? get id => _id;
//   String? get name => _name;
//   String? get email => _email;
//   String? get phoneNumber => _phoneNumber;
//   String? get birthDate => _birthDate;
//   String? get city => _city;
//   String? get address => _address;
//   String? get skills => _skills;
//   String? get experience => _experience;
//   List<Education>? get education => _education;
//   String? get workExperience => _workExperience;
//   List<VolunteerActivities>? get volunteerActivities => _volunteerActivities;
//   String? get projects => _projects;
//   String? get googleId => _googleId;
//   List<dynamic>? get applications => _applications;
//   String? get cvUrl => _cvUrl;
//   List<TrainingCourses>? get trainingCourses => _trainingCourses;
//   String? get personalSkills => _personalSkills;
//   String? get computerSkills => _computerSkills;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['id'] = _id;
//     map['name'] = _name;
//     map['email'] = _email;
//     map['phoneNumber'] = _phoneNumber;
//     map['birthDate'] = _birthDate;
//     map['city'] = _city;
//     map['address'] = _address;
//     map['skills'] = _skills;
//     map['experience'] = _experience;
//     if (_education != null) {
//       map['education'] = _education?.map((v) => v.toJson()).toList();
//     }
//     map['workExperience'] = _workExperience;
//     if (_volunteerActivities != null) {
//       map['volunteerActivities'] = _volunteerActivities?.map((v) => v.toJson()).toList();
//     }
//     map['projects'] = _projects;
//     map['googleId'] = _googleId;
//     if (_applications != null) {
//       map['applications'] = _applications?.map((v) => v.toJson()).toList();
//     }
//     map['cvUrl'] = _cvUrl;
//     if (_trainingCourses != null) {
//       map['trainingCourses'] = _trainingCourses?.map((v) => v.toJson()).toList();
//     }
//     map['personalSkills'] = _personalSkills;
//     map['computerSkills'] = _computerSkills;
//     return map;
//   }
//
// }
//
// /// courseName : "دورة متقدمة في تطوير تطبيقات الويب"
// /// completionDate : "2020-05-30"
//
// class TrainingCourses {
//   TrainingCourses({
//       String? courseName,
//       String? completionDate,}){
//     _courseName = courseName;
//     _completionDate = completionDate;
// }
//
//   TrainingCourses.fromJson(dynamic json) {
//     _courseName = json['courseName'];
//     _completionDate = json['completionDate'];
//   }
//   String? _courseName;
//   String? _completionDate;
// TrainingCourses copyWith({  String? courseName,
//   String? completionDate,
// }) => TrainingCourses(  courseName: courseName ?? _courseName,
//   completionDate: completionDate ?? _completionDate,
// );
//   String? get courseName => _courseName;
//   String? get completionDate => _completionDate;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['courseName'] = _courseName;
//     map['completionDate'] = _completionDate;
//     return map;
//   }
//
// }
//
// /// activityName : "تدريس البرمجة للأطفال"
// /// organization : "جمعية خيرية"
// /// date : "2018-07-01"
//
// class VolunteerActivities {
//   VolunteerActivities({
//       String? activityName,
//       String? organization,
//       String? date,}){
//     _activityName = activityName;
//     _organization = organization;
//     _date = date;
// }
//
//   VolunteerActivities.fromJson(dynamic json) {
//     _activityName = json['activityName'];
//     _organization = json['organization'];
//     _date = json['date'];
//   }
//   String? _activityName;
//   String? _organization;
//   String? _date;
// VolunteerActivities copyWith({  String? activityName,
//   String? organization,
//   String? date,
// }) => VolunteerActivities(  activityName: activityName ?? _activityName,
//   organization: organization ?? _organization,
//   date: date ?? _date,
// );
//   String? get activityName => _activityName;
//   String? get organization => _organization;
//   String? get date => _date;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['activityName'] = _activityName;
//     map['organization'] = _organization;
//     map['date'] = _date;
//     return map;
//   }
//
// }
//
// /// degreeName : "بكالوريوس في علوم الحاسوب"
// /// obtainedDate : "2012-06-15"
// /// institution : "جامعة الملك سعود"
//
// class Education {
//   Education({
//       String? degreeName,
//       String? obtainedDate,
//       String? institution,}){
//     _degreeName = degreeName;
//     _obtainedDate = obtainedDate;
//     _institution = institution;
// }
//
//   Education.fromJson(dynamic json) {
//     _degreeName = json['degreeName'];
//     _obtainedDate = json['obtainedDate'];
//     _institution = json['institution'];
//   }
//   String? _degreeName;
//   String? _obtainedDate;
//   String? _institution;
// Education copyWith({  String? degreeName,
//   String? obtainedDate,
//   String? institution,
// }) => Education(  degreeName: degreeName ?? _degreeName,
//   obtainedDate: obtainedDate ?? _obtainedDate,
//   institution: institution ?? _institution,
// );
//   String? get degreeName => _degreeName;
//   String? get obtainedDate => _obtainedDate;
//   String? get institution => _institution;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['degreeName'] = _degreeName;
//     map['obtainedDate'] = _obtainedDate;
//     map['institution'] = _institution;
//     return map;
//   }
//
// }