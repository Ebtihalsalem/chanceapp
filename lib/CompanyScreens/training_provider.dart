import 'package:flutter/material.dart';
import 'package:chanceapp/TraineeScreens/training.dart'; // تأكد من أن الملف يحتوي على نموذج Training

class TrainingProvider with ChangeNotifier {
  Training? _selectedTraining;

  Training? get selectedTraining => _selectedTraining;

  void selectTraining(Training training) {
    _selectedTraining = training;
    notifyListeners();
  }
}
