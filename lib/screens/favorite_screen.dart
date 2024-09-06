import 'package:app_kimberle/components/home_card.dart';
import 'package:app_kimberle/providers/job.dart';
import 'package:app_kimberle/providers/jobs.dart';
import 'package:app_kimberle/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List <Job> vagas = Provider.of<Jobs>(context).favoriteJobs();
    print(vagas.length);
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
            icon: Icon(Icons.arrow_back, size: 35),
            onPressed: () => {
              Navigator.of(context).pop(),
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              alignment: Alignment.bottomLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Vagas Favoritas',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  Text('Total: ${vagas.length}',
                      style: TextStyle(color: Color(0xFFD9E7FF))),
                ],
              ),
            ),
            ListView.builder(
              shrinkWrap:
              true, // Garante que o ListView não tente expandir indefinidamente
              physics:
              NeverScrollableScrollPhysics(), // Remove a rolagem do ListView, deixando apenas a rolagem principal
              itemCount: vagas.length,
              itemBuilder: (context, index) {
                final vaga = vagas[index];
                return InkWell(
                  onTap: () {
                    Navigator.of(context)
                        .pushNamed(AppRoutes.JOB_DETAIL, arguments: vaga);
                  },
                  child: HomeCard(vaga: vaga),
                );
              },
            ),
          ],
        )
      )


    );
  }
}
