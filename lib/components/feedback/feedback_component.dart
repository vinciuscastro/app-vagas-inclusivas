import 'package:app_kimberle/components/feedback/feedback_card.dart';
import 'package:app_kimberle/components/feedback/feedback_dialog.dart';
import 'package:app_kimberle/models/feedback_model.dart';
import 'package:app_kimberle/providers/feedbacks.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FeedbackComponent extends StatefulWidget {
  final String company;
  const FeedbackComponent({super.key, required this.company});

  @override
  State<FeedbackComponent> createState() => _FeedbackComponentState();
}

class _FeedbackComponentState extends State<FeedbackComponent> {
  bool expanded = false;


  @override
  Widget build(BuildContext context) {
    List<FeedbackModel> feedbacks = Provider.of<Feedbacks>(context).feedbacks;

    return Column(
      children: [
        ListTile(
          contentPadding: EdgeInsets.zero,
          leading: Icon(
            Icons.feedback,
            color: Theme.of(context).primaryColorDark,
            size: 30,
          ),
          trailing: Icon(
              expanded ? Icons.expand_less : Icons.expand_more,
              color: Theme.of(context).primaryColorDark,
              size: 34,
          ),
          title: Text('Feedbacks inclusão',
              style: Theme.of(context).textTheme.titleSmall),
          onTap: () {
            setState(() {
              expanded = !expanded;
            });
          },
        ),
        if (expanded)
          Column(
            children: feedbacks.map((feedback) {
              return InkWell(
                onTap: () {
                  FeedBackDialog(context, feedback);
                },
                child: FeedbackCard(feedback: feedback),
              );
            }).toList(),
          ),
      ],
    );
  }
}
