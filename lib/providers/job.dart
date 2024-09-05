import 'dart:math';

import 'package:flutter/material.dart';

class Job with ChangeNotifier {
  final String id;
  final String name;
  final String description;
  final String salary;
  final String location;
  final String company;
  final String type;
  final String modality;
  final String schedule;
  final List<String> benefits;
  bool isFavorite;

  Job({
    required this.id,
    required this.name,
    required this.description,
    required this.salary,
    required this.location,
    required this.company,
    required this.type,
    required this.modality,
    required this.schedule,
    required this.benefits,
    this.isFavorite = false,
  });


  void toggleFavoriteStatus() {
    isFavorite = !isFavorite;
    notifyListeners();
  }

  factory Job.fromJson(Map<String, dynamic> json) {
    return Job(
      id: Random().nextDouble().toString(),
      name: json['name'],
      description: json['description'],
      salary: json['salary'],
      location: json['location'],
      company: json['company'],
      type: json['type'],
      modality: json['modality'],
      schedule: json['schedule'],
      benefits: (json['benefits'] as List<dynamic>).map((item) => item.toString()).toList(),
    );
  }

  String toStr() {
    return 'Job{id: $id, name: $name, description: $description, salary: $salary, location: $location, company: $company, type: $type, modality: $modality, schedule: $schedule, benefits: $benefits, isFavorite: $isFavorite}';
  }
}