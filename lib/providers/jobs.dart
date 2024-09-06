import 'dart:convert';
import 'package:flutter/material.dart';
import 'job.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:provider/provider.dart';

class Jobs with ChangeNotifier {

  List<Job> _jobs = [];

  List<Job> get jobs => [..._jobs];

  void addJob(Job job) {
    _jobs.add(job);
    notifyListeners();
  }

  void removeJob(Job job) {
    _jobs.remove(job);
    notifyListeners();
  }

  void addJobFromJson(Map<String, dynamic> json) {
    _jobs.add(Job.fromJson(json));
    notifyListeners();
  }

  Future loadJobs() async {
    final String response = await rootBundle.loadString('assets/vagas.json');
    final data = await json.decode(response);
    for (var job in data) {
      addJobFromJson(job);
    }
  }

  List <Job> favoriteJobs() {
    return _jobs.where((job) => job.isFavorite).toList();
  }

}
