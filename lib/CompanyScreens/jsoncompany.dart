/// userId : 123
/// name : "Company XYZ"
/// industry : "Tech"
/// size : "Large"
/// location : "New York"
/// description : "A leading tech company."
/// foundedYear : 2001
/// extendedDescription : "Extended description of the company."
/// trainings : []
/// logoUrl : "http://example.com/logo.png"
/// email : "info@companyxyz.com"
/// phoneNumber : "123-456-7890"
/// headquarters : "Headquarters XYZ"
/// headquartersAddress : "123 Main St, New York, NY"
class Jsoncompany {
  Jsoncompany({
    int? userId,
    String? name,
    String? industry,
    String? size,
    String? location,
    String? description,
    int? foundedYear,
    String? extendedDescription,
    List<dynamic>? trainings,
    String? logoUrl,
    String? email,
    String? phoneNumber,
    String? headquarters,
    String? headquartersAddress,
  }) {
    _userId = userId;
    _name = name;
    _industry = industry;
    _size = size;
    _location = location;
    _description = description;
    _foundedYear = foundedYear;
    _extendedDescription = extendedDescription;
    _trainings = trainings;
    _logoUrl = logoUrl;
    _email = email;
    _phoneNumber = phoneNumber;
    _headquarters = headquarters;
    _headquartersAddress = headquartersAddress;
  }

  Jsoncompany.fromJson(dynamic json) {
    _userId = json['userId'];
    _name = json['name'];
    _industry = json['industry'];
    _size = json['size'];
    _location = json['location'];
    _description = json['description'];
    _foundedYear = json['foundedYear'];
    _extendedDescription = json['extendedDescription'];
    if (json['trainings'] != null) {
      _trainings = [];
      json['trainings'].forEach((v) {
        _trainings?.add(v); // Assuming training data can be dynamic
      });
    }
    _logoUrl = json['logoUrl'];
    _email = json['email'];
    _phoneNumber = json['phoneNumber'];
    _headquarters = json['headquarters'];
    _headquartersAddress = json['headquartersAddress'];
  }

  int? _userId;
  String? _name;
  String? _industry;
  String? _size;
  String? _location;
  String? _description;
  int? _foundedYear;
  String? _extendedDescription;
  List<dynamic>? _trainings;
  String? _logoUrl;
  String? _email;
  String? _phoneNumber;
  String? _headquarters;
  String? _headquartersAddress;

  Jsoncompany copyWith({
    int? userId,
    String? name,
    String? industry,
    String? size,
    String? location,
    String? description,
    int? foundedYear,
    String? extendedDescription,
    List<dynamic>? trainings,
    String? logoUrl,
    String? email,
    String? phoneNumber,
    String? headquarters,
    String? headquartersAddress,
  }) =>
      Jsoncompany(
        userId: userId ?? _userId,
        name: name ?? _name,
        industry: industry ?? _industry,
        size: size ?? _size,
        location: location ?? _location,
        description: description ?? _description,
        foundedYear: foundedYear ?? _foundedYear,
        extendedDescription: extendedDescription ?? _extendedDescription,
        trainings: trainings ?? _trainings,
        logoUrl: logoUrl ?? _logoUrl,
        email: email ?? _email,
        phoneNumber: phoneNumber ?? _phoneNumber,
        headquarters: headquarters ?? _headquarters,
        headquartersAddress: headquartersAddress ?? _headquartersAddress,
      );

  int? get userId => _userId;
  String? get name => _name;
  String? get industry => _industry;
  String? get size => _size;
  String? get location => _location;
  String? get description => _description;
  int? get foundedYear => _foundedYear;
  String? get extendedDescription => _extendedDescription;
  List<dynamic>? get trainings => _trainings;
  String? get logoUrl => _logoUrl;
  String? get email => _email;
  String? get phoneNumber => _phoneNumber;
  String? get headquarters => _headquarters;
  String? get headquartersAddress => _headquartersAddress;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['userId'] = _userId;
    map['name'] = _name;
    map['industry'] = _industry;
    map['size'] = _size;
    map['location'] = _location;
    map['description'] = _description;
    map['foundedYear'] = _foundedYear;
    map['extendedDescription'] = _extendedDescription;
    if (_trainings != null) {
      map['trainings'] = _trainings?.map((v) => v).toList(); // Adjust if you have a specific type for trainings
    }
    map['logoUrl'] = _logoUrl;
    map['email'] = _email;
    map['phoneNumber'] = _phoneNumber;
    map['headquarters'] = _headquarters;
    map['headquartersAddress'] = _headquartersAddress;
    return map;
  }
}

