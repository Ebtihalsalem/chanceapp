// /// _id : 14
// /// title : "تدريب برمجة"
// /// description : "دورة تدريبية في برمجة التطبيقات"
// /// type : "تقني"
// /// level : "متوسط"
// /// companyId : 1001
// /// startDate : "2024-01-01"
// /// endDate : "2024-01-30"
// /// certificate : true
// /// applications : [{"id":1,"userId":1001,"trainingId":1,"status":"مقدم","createdAt":"2024-01-01","payments":[{"id":1,"applicationId":1,"amount":200.0,"paymentMethod":"بطاقة ائتمان","createdAt":"2024-01-02"}]},{"id":2,"userId":1002,"trainingId":1,"status":"مقبول","createdAt":"2024-01-02","payments":[]}]
// /// trainingPosition : "مطور تطبيقات"
// /// requiredSkills : ["برمجة كوتلن","Java","قواعد البيانات"]
// /// numberOfPositions : 5
// /// Citiy : "musrits"
//
// class Jsontraining {
//   Jsontraining({
//       int? id,
//       String? title,
//       String? description,
//       String? type,
//       String? level,
//       int? companyId,
//       String? startDate,
//       String? endDate,
//       bool? certificate,
//       List<Applications>? applications,
//       String? trainingPosition,
//       List<String>? requiredSkills,
//       int? numberOfPositions,
//       String? citiy,}){
//     _id = id;
//     _title = title;
//     _description = description;
//     _type = type;
//     _level = level;
//     _companyId = companyId;
//     _startDate = startDate;
//     _endDate = endDate;
//     _certificate = certificate;
//     _applications = applications;
//     _trainingPosition = trainingPosition;
//     _requiredSkills = requiredSkills;
//     _numberOfPositions = numberOfPositions;
//     _citiy = citiy;
// }
//
//   Jsontraining.fromJson(dynamic json) {
//     _id = json['_id'];
//     _title = json['title'];
//     _description = json['description'];
//     _type = json['type'];
//     _level = json['level'];
//     _companyId = json['companyId'];
//     _startDate = json['startDate'];
//     _endDate = json['endDate'];
//     _certificate = json['certificate'];
//     if (json['applications'] != null) {
//       _applications = [];
//       json['applications'].forEach((v) {
//         _applications?.add(Applications.fromJson(v));
//       });
//     }
//     _trainingPosition = json['trainingPosition'];
//     _requiredSkills = json['requiredSkills'] != null ? json['requiredSkills'].cast<String>() : [];
//     _numberOfPositions = json['numberOfPositions'];
//     _citiy = json['Citiy'];
//   }
//   int? _id;
//   String? _title;
//   String? _description;
//   String? _type;
//   String? _level;
//   int? _companyId;
//   String? _startDate;
//   String? _endDate;
//   bool? _certificate;
//   List<Applications>? _applications;
//   String? _trainingPosition;
//   List<String>? _requiredSkills;
//   int? _numberOfPositions;
//   String? _citiy;
// Jsontraining copyWith({  int? id,
//   String? title,
//   String? description,
//   String? type,
//   String? level,
//   int? companyId,
//   String? startDate,
//   String? endDate,
//   bool? certificate,
//   List<Applications>? applications,
//   String? trainingPosition,
//   List<String>? requiredSkills,
//   int? numberOfPositions,
//   String? citiy,
// }) => Jsontraining(  id: id ?? _id,
//   title: title ?? _title,
//   description: description ?? _description,
//   type: type ?? _type,
//   level: level ?? _level,
//   companyId: companyId ?? _companyId,
//   startDate: startDate ?? _startDate,
//   endDate: endDate ?? _endDate,
//   certificate: certificate ?? _certificate,
//   applications: applications ?? _applications,
//   trainingPosition: trainingPosition ?? _trainingPosition,
//   requiredSkills: requiredSkills ?? _requiredSkills,
//   numberOfPositions: numberOfPositions ?? _numberOfPositions,
//   citiy: citiy ?? _citiy,
// );
//   int? get id => _id;
//   String? get title => _title;
//   String? get description => _description;
//   String? get type => _type;
//   String? get level => _level;
//   int? get companyId => _companyId;
//   String? get startDate => _startDate;
//   String? get endDate => _endDate;
//   bool? get certificate => _certificate;
//   List<Applications>? get applications => _applications;
//   String? get trainingPosition => _trainingPosition;
//   List<String>? get requiredSkills => _requiredSkills;
//   int? get numberOfPositions => _numberOfPositions;
//   String? get citiy => _citiy;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['_id'] = _id;
//     map['title'] = _title;
//     map['description'] = _description;
//     map['type'] = _type;
//     map['level'] = _level;
//     map['companyId'] = _companyId;
//     map['startDate'] = _startDate;
//     map['endDate'] = _endDate;
//     map['certificate'] = _certificate;
//     if (_applications != null) {
//       map['applications'] = _applications?.map((v) => v.toJson()).toList();
//     }
//     map['trainingPosition'] = _trainingPosition;
//     map['requiredSkills'] = _requiredSkills;
//     map['numberOfPositions'] = _numberOfPositions;
//     map['Citiy'] = _citiy;
//     return map;
//   }
//
// }
//
// /// id : 1
// /// userId : 1001
// /// trainingId : 1
// /// status : "مقدم"
// /// createdAt : "2024-01-01"
// /// payments : [{"id":1,"applicationId":1,"amount":200.0,"paymentMethod":"بطاقة ائتمان","createdAt":"2024-01-02"}]
//
// class Applications {
//   Applications({
//       int? id,
//       int? userId,
//       int? trainingId,
//       String? status,
//       String? createdAt,
//       List<Payments>? payments,}){
//     _id = id;
//     _userId = userId;
//     _trainingId = trainingId;
//     _status = status;
//     _createdAt = createdAt;
//     _payments = payments;
// }
//
//   Applications.fromJson(dynamic json) {
//     _id = json['id'];
//     _userId = json['userId'];
//     _trainingId = json['trainingId'];
//     _status = json['status'];
//     _createdAt = json['createdAt'];
//     if (json['payments'] != null) {
//       _payments = [];
//       json['payments'].forEach((v) {
//         _payments?.add(Payments.fromJson(v));
//       });
//     }
//   }
//   int? _id;
//   int? _userId;
//   int? _trainingId;
//   String? _status;
//   String? _createdAt;
//   List<Payments>? _payments;
// Applications copyWith({  int? id,
//   int? userId,
//   int? trainingId,
//   String? status,
//   String? createdAt,
//   List<Payments>? payments,
// }) => Applications(  id: id ?? _id,
//   userId: userId ?? _userId,
//   trainingId: trainingId ?? _trainingId,
//   status: status ?? _status,
//   createdAt: createdAt ?? _createdAt,
//   payments: payments ?? _payments,
// );
//   int? get id => _id;
//   int? get userId => _userId;
//   int? get trainingId => _trainingId;
//   String? get status => _status;
//   String? get createdAt => _createdAt;
//   List<Payments>? get payments => _payments;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['id'] = _id;
//     map['userId'] = _userId;
//     map['trainingId'] = _trainingId;
//     map['status'] = _status;
//     map['createdAt'] = _createdAt;
//     if (_payments != null) {
//       map['payments'] = _payments?.map((v) => v.toJson()).toList();
//     }
//     return map;
//   }
//
// }
//
// /// id : 1
// /// applicationId : 1
// /// amount : 200.0
// /// paymentMethod : "بطاقة ائتمان"
// /// createdAt : "2024-01-02"
//
// class Payments {
//   Payments({
//       int? id,
//       int? applicationId,
//       double? amount,
//       String? paymentMethod,
//       String? createdAt,}){
//     _id = id;
//     _applicationId = applicationId;
//     _amount = amount;
//     _paymentMethod = paymentMethod;
//     _createdAt = createdAt;
// }
//
//   Payments.fromJson(dynamic json) {
//     _id = json['id'];
//     _applicationId = json['applicationId'];
//     _amount = json['amount'];
//     _paymentMethod = json['paymentMethod'];
//     _createdAt = json['createdAt'];
//   }
//   int? _id;
//   int? _applicationId;
//   double? _amount;
//   String? _paymentMethod;
//   String? _createdAt;
// Payments copyWith({  int? id,
//   int? applicationId,
//   double? amount,
//   String? paymentMethod,
//   String? createdAt,
// }) => Payments(  id: id ?? _id,
//   applicationId: applicationId ?? _applicationId,
//   amount: amount ?? _amount,
//   paymentMethod: paymentMethod ?? _paymentMethod,
//   createdAt: createdAt ?? _createdAt,
// );
//   int? get id => _id;
//   int? get applicationId => _applicationId;
//   double? get amount => _amount;
//   String? get paymentMethod => _paymentMethod;
//   String? get createdAt => _createdAt;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['id'] = _id;
//     map['applicationId'] = _applicationId;
//     map['amount'] = _amount;
//     map['paymentMethod'] = _paymentMethod;
//     map['createdAt'] = _createdAt;
//     return map;
//   }
//
// }
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

  // تحويل البيانات من JSON إلى كائن Training
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

