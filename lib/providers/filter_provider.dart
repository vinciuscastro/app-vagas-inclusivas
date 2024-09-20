import 'package:flutter/material.dart';

class FilterProvider with ChangeNotifier {
  double salary = 0.0;
  String location = '';
  String type = '';
  String modality = '';
  String company = '';
  String minority = '';

  void updateSalary(String newSalary) {
    salary = double.parse(newSalary);
    notifyListeners();
  }

  void updateLocation(String newLocation) {
    location = newLocation;
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

  void updateCompany(String newCompany) {
    company = newCompany;
    notifyListeners();
  }

  void updateMinority(String newMinority) {
    minority = newMinority;
    notifyListeners();
  }

  void resetFilters() {
    salary = 0.0;
    location = '';
    type = '';
    modality = '';
    company = '';
    minority = '';
    notifyListeners();
  }

  bool isFilterActive() {
    return salary > 0.0 || location.isNotEmpty || type.isNotEmpty || modality.isNotEmpty || company.isNotEmpty || minority.isNotEmpty;
  }

  void resetSalary() {
    salary = 0.0;
    notifyListeners();
  }

  void resetLocation() {
    location = '';
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

  void resetCompany() {
    company = '';
    notifyListeners();
  }

  void resetMinority() {
    minority = '';
    notifyListeners();
  }
}
