import 'package:app_kimberle/components/home/home_card.dart';
import 'package:app_kimberle/components/others/job_quantity.dart';
import 'package:app_kimberle/data/db_helper.dart';
import 'package:app_kimberle/providers/job.dart';
import 'package:app_kimberle/providers/jobs.dart';
import 'package:app_kimberle/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});


  @override
  Widget build(BuildContext context) {
    var vagasFavoritas = Provider.of<Jobs>(context).favoriteJobs();

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
            icon: const Icon(Icons.turn_slight_left_outlined, size: 35),
            onPressed: () => {
              Navigator.of(context).pop(),
            },
          ),
        ],
      ),
      body: FutureBuilder<List<Job>>(
        future: vagasFavoritas,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text('Erro ao carregar vagas favoritas'),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Text('Nenhuma vaga favorita encontrada', style: TextStyle(fontSize: 20, color: Colors.grey)),
            );
          } else {
            var vagas = snapshot.data!;

            return SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                      padding: const EdgeInsets.only(left: 30, top: 20, bottom: 10),
                      child: JobQuantity(size: vagas.length, label: 'Vagas Favoritas')),

                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: vagas.length,
                    itemBuilder: (context, index) {
                      final vaga = vagas[index];
                      return Column(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.of(context).pushNamed(
                                AppRoutes.JOB_DETAIL,
                                arguments: vaga,
                              );
                            },
                            child: HomeCard(vaga: vaga),
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
