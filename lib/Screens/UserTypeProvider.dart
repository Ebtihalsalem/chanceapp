import 'package:flutter/material.dart';

enum UserType { company, trainee }

class UserTypeProvider extends ChangeNotifier {
  UserType? _userType;

  UserType? get userType => _userType;

  void setUserType(UserType type) {
    _userType = type;
    notifyListeners();
  }
}
