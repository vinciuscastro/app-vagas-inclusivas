import 'package:app_kimberle/components/app_bar_component.dart';
import 'package:app_kimberle/components/feedback_dialog.dart';
import 'package:app_kimberle/components/feedback_card.dart';
import 'package:app_kimberle/components/info_card.dart';
import 'package:app_kimberle/models/feedback_model.dart';
import 'package:app_kimberle/providers/job.dart';
import 'package:app_kimberle/providers/feedbacks.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class JobDetail extends StatefulWidget {
  @override
  State<JobDetail> createState() => _JobDetailState();
}

class _JobDetailState extends State<JobDetail> {
  bool expanded = false;

  @override
  Widget build(BuildContext context) {
    final vaga = ModalRoute.of(context)!.settings.arguments as Job;
    List<FeedbackModel> feedbacks = Provider.of<Feedbacks>(context).feedbacks;

    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(left: 15),
          child: Text('Kimberlé'),
        ),
        toolbarHeight: 90,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: Icon(Icons.turn_slight_left_outlined, size: 35),
            onPressed: () => {
              Navigator.of(context).pop(),
            },
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 0, vertical: 20),
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(vaga.name, style: Theme.of(context).textTheme.titleLarge),
                Text(vaga.company,
                    style: Theme.of(context).textTheme.bodySmall),
                SizedBox(height: 30),
                Text("Informações",
                    style: Theme.of(context).textTheme.titleMedium),
                InfoCard(vaga: vaga),
                SizedBox(height: 30),
                Text("Descrição",
                    style: Theme.of(context).textTheme.titleMedium),
                Text(vaga.description,
                    style: Theme.of(context).textTheme.bodySmall),
                SizedBox(height: 30),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Icon(Icons.feedback, color: Colors.white),
                  trailing: Icon(
                      expanded ? Icons.expand_less : Icons.expand_more,
                      color: Colors.white),
                  title: Text('Feedbacks',
                      style: Theme.of(context).textTheme.titleMedium),
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
            ),
          ),
        ),
      ),
    );
  }
}
