import 'package:app_kimberle/components/app_bar_component.dart';
import 'package:app_kimberle/components/feedback_dialog.dart';
import 'package:app_kimberle/components/feedback_card.dart';
import 'package:app_kimberle/components/info_card.dart';
import 'package:app_kimberle/models/feedback_model.dart';
import 'package:app_kimberle/providers/job.dart';
import 'package:app_kimberle/providers/feedbacks.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class VagaDetalheScreen extends StatefulWidget {
  final Job vaga;
  VagaDetalheScreen({required this.vaga});

  @override
  State<VagaDetalheScreen> createState() => _VagaDetalheScreenState();
}

class _VagaDetalheScreenState extends State<VagaDetalheScreen> {
  late Job vaga;
  bool expanded = false;

  @override
  void initState() {
    super.initState();
    vaga = widget.vaga;
  }

  void toggleIcon() {
    setState(() {
      expanded = !expanded;
    });
  }



  @override
  Widget build(BuildContext context) {
    List<FeedbackModel> feedbacks = Provider.of<Feedbacks>(context).feedbacks;

    return Scaffold(
      appBar: AppBarComponent(),
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
                Text(vaga.company, style: Theme.of(context).textTheme.bodySmall),
                SizedBox(height: 30),
                Text("Informações", style: Theme.of(context).textTheme.titleMedium),
                InfoCard(vaga: vaga),
                SizedBox(height: 30),
                Text("Descrição", style: Theme.of(context).textTheme.titleMedium),
                Text(vaga.description, style: Theme.of(context).textTheme.bodySmall),
                SizedBox(height: 30),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Icon(Icons.feedback, color: Colors.white),
                  trailing: Icon(expanded ? Icons.expand_less : Icons.expand_more, color: Colors.white),
                  title: Text('Feedbacks', style: Theme.of(context).textTheme.titleMedium),
                  onTap: () {
                    toggleIcon();
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
