import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../data/db_helper.dart';
import 'job.dart';

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
    final snapshot = await FirebaseFirestore.instance.collection('jobs').get();
    _jobs = snapshot.docs.map((doc) {
      return Job(
        id: doc.id,
        name: doc['name'],
        description: doc['description'],
        salary: doc['salary'] * 1.0,
        location: doc['location'],
        company: doc['company'],
        type: doc['type'],
        modality: doc['modality'],
        isFavorite: doc['isFavorite'],
        minority: doc['minority'],
        schedule: doc['schedule'],
        benefits: (doc['benefits']).toString().split(',').map((item) => item.toString()).toList(),
      );
    }).toList();
    notifyListeners();

  }

  Future<List<Job>> favoriteJobs() async {
    List<Job> vagas = await DatabaseHelper.getData('favorite_jobs');
    return vagas;
  }

}
