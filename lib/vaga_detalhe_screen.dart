import 'package:app_kimberle/components/app_bar_component.dart';
import 'package:app_kimberle/components/info_card.dart';
import 'package:flutter/material.dart';

class VagaDetalheScreen extends StatelessWidget {
  final Map<String, dynamic> vaga;

  VagaDetalheScreen({required this.vaga});

  @override
  Widget build(BuildContext context) {
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
                Text(vaga['titulo'], style: Theme.of(context).textTheme.titleLarge),
                Text(vaga['empresa'], style: Theme.of(context).textTheme.bodySmall),
                SizedBox(height: 30),
                Text("Informações", style: Theme.of(context).textTheme.titleMedium),
                InfoCard(vaga: vaga),
                SizedBox(height: 30),
                Text("Descrição", style: Theme.of(context).textTheme.titleMedium),
                Text(vaga['descricao'], style: Theme.of(context).textTheme.bodySmall),
                ListTile(
                  leading: Icon(Icons.feedback),
                  trailing: Icon(Icons.expand_more),
                  title: Text('Feedbacks', style: Theme.of(context).textTheme.titleMedium),
                  onTap: () {

                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}