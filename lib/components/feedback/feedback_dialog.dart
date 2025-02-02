import 'package:app_kimberle/models/feedback_model.dart';
import 'package:flutter/material.dart';

void FeedBackDialog(BuildContext context, FeedbackModel feedback) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15), // Bordas arredondadas
        ),
        titlePadding: EdgeInsets.zero,
        content: Container(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                feedback.name,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 2),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: List.generate(
                      5, // Total de estrelas possíveis
                      (index) => Icon(
                        index < feedback.rate ? Icons.star : Icons.star_border,
                        color: Colors.black,
                        size: 16,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    feedback.date,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[800],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Text(
                feedback.message,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
