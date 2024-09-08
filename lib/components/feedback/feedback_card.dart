import 'package:app_kimberle/models/feedback_model.dart';
import 'package:flutter/material.dart';

class FeedbackCard extends StatelessWidget {
  final FeedbackModel feedback;

  const FeedbackCard({Key? key, required this.feedback}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blue[50],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [
              Text(
                feedback.name,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  if (feedback.reported) {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text("Feedback denunciado", style: TextStyle(color: Colors.red, fontSize: 18)),
                        content: const Text("Esse feedback já foi denunciado."),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text("Ok"),
                          ),
                        ],
                      ),
                    );
                  }
                  else {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text("Denunciar feedback"),
                      content: const Text("Deseja denunciar esse feedback?"),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text("Cancelar"),
                        ),
                        TextButton(
                          onPressed: () {
                            feedback.reported = true;
                            Navigator.of(context).pop();
                          },
                          child: const Text("Denunciar"),
                        ),
                      ],
                    ),
                  );
                }},
                child: Icon(feedback.reported ? Icons.flag : Icons.flag_outlined, color: Colors.red),
              ),
            ]),
            const SizedBox(height: 2),
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
            const SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  feedback.date,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[800],
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const Row(
                  children: [
                    Text("Ler mais", style: TextStyle(fontSize: 12)),
                    SizedBox(width: 4),
                    Icon(Icons.more, color: Colors.black, size: 16),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
