import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SavedTrainingProvider with ChangeNotifier {
  List<String> savedTrainings = [];

  SavedTrainingProvider() {
    loadSavedTrainings();
  }

  Future<void> loadSavedTrainings() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    savedTrainings = prefs.getStringList('savedTrainings') ?? [];
    notifyListeners();
  }

  Future<void> saveTraining(String role) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (!savedTrainings.contains(role)) {
      savedTrainings.add(role);
      await prefs.setStringList('savedTrainings', savedTrainings);
      notifyListeners();
    }
  }

  Future<void> removeTraining(String role) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    savedTrainings.remove(role);
    await prefs.setStringList('savedTrainings', savedTrainings);
    notifyListeners();
  }

  bool isTrainingSaved(String role) {
    return savedTrainings.contains(role);
  }
}
