import 'package:app_kimberle/components/feedback/feedback_component.dart';
import 'package:app_kimberle/components/job_detail/info_card.dart';
import 'package:app_kimberle/providers/job.dart';
import 'package:flutter/material.dart';
import '../components/others/footer_component.dart';

class JobDetail extends StatelessWidget {
  const JobDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final vaga = ModalRoute.of(context)!.settings.arguments as Job;

    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(left: 15),
          child: Text('Kimberlé'),
        ),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.turn_slight_left_outlined, size: 35),
            onPressed: () => {
              Navigator.of(context).pop(),
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
        },
        child: const Icon(Icons.send_rounded),

      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 20),
        color: Colors.black,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(vaga.name, style: Theme.of(context).textTheme.titleLarge),
                    Text(vaga.company,
                        style: Theme.of(context).textTheme.bodySmall),
                    const SizedBox(height: 30),
                    Text("Informações",
                        style: Theme.of(context).textTheme.titleMedium),
                    InfoCard(vaga: vaga),
                    const SizedBox(height: 30),
                    Text("Descrição",
                        style: Theme.of(context).textTheme.titleMedium),
                    Text(vaga.description,
                        style: Theme.of(context).textTheme.bodySmall),
                    const SizedBox(height: 30),
                    FeedbackComponent(company: vaga.company),
                  ],
                ),
              ),
                    const FooterComponent(),
            ],
          ),
        ),
      ),
    );
  }
}
