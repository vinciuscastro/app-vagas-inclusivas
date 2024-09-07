import 'dart:math';

class FeedbackModel {
  final String id;
  final String name;
  final String company;
  final int rate;
  final String date;
  final String message;
  bool reported;

  FeedbackModel({
    required this.id,
    required this.name,
    required this.company,
    required this.rate,
    required this.date,
    required this.message,
    this.reported = false,
  });

  factory FeedbackModel.fromJson(Map<String, dynamic> json) {
    return FeedbackModel(
      id: Random().nextDouble().toString(),
      name: json['name'],
      company: json['company'],
      rate: json['rate'],
      date: json['date'],
      message: json['message'],
    );
  }

}
