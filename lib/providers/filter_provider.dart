import 'package:flutter/material.dart';

class FilterProvider with ChangeNotifier {
  double salary = 0.0;
  double distance = 0.0;
  String type = '';
  String modality = '';

  void updateSalary(double newSalary) {
    salary = newSalary;
    notifyListeners();
  }

  void updateDistance(double newDistance) {
    distance = newDistance;
    notifyListeners();
  }

  void updateJobType(String newJobType) {
    type = newJobType;
    notifyListeners();
  }

  void updateWorkMode(String newWorkMode) {
    modality = newWorkMode;
    notifyListeners();
  }

  void resetFilters() {
    salary = 0.0;
    distance = 0.0;
    type = '';
    modality = '';
    notifyListeners();
  }

  void resetSalary() {
    salary = 0.0;
    notifyListeners();
  }

  void resetDistance() {
    distance = 0.0;
    notifyListeners();
  }

  void resetJobType() {
    type = '';
    notifyListeners();
  }

  void resetWorkMode() {
    modality = '';
    notifyListeners();
  }
}
