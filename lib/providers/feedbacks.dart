import 'package:flutter/cupertino.dart';
import '../data/dummy_feedback.dart';
import '../models/feedback_model.dart';

class Feedbacks with ChangeNotifier {
  final List<FeedbackModel> _feedbacks = DUMMY_FEEDBACKS;

  List<FeedbackModel> get feedbacks {
    return [..._feedbacks];
  }

  void addFeedback(FeedbackModel feedback) {
    _feedbacks.add(feedback);
    notifyListeners();
  }

  void removeFeedback(FeedbackModel feedback) {
    _feedbacks.remove(feedback);
    notifyListeners();
  }

  List<FeedbackModel> getSpecificFeedbacks(String company) {
    return _feedbacks.where((feedback) => feedback.company == company).toList();
  }

}
