import 'package:app_kimberle/components/info_vaga_individual.dart';
import 'package:flutter/material.dart';



class InfoCard extends StatelessWidget {
  final Map<String, dynamic> vaga;
  InfoCard({Key? key, required this.vaga}) : super(key: key);

  final List<Map<String, dynamic>> jobInfo = [
    {
      'icone': Icons.monetization_on,
      'titulo': 'Salario',
      'conteudo': "R\$ 2200,00",
    },
    {
      'icone': Icons.calendar_today,
      'titulo': 'Tipo de Vaga',
      'conteudo': "PJ",
    },
    {
      'icone': Icons.access_time,
      'titulo': 'Modalidade',
      'conteudo': "Presencial",
    },
    {
      'icone': Icons.access_time,
      'titulo': 'Horário',
      'conteudo': "08:00 - 18:00",
    },
    {
      'icone': Icons.location_on,
      'titulo': 'Local',
      'conteudo': "São Paulo - SP",
    },
    {
      'icone': Icons.accessibility,
      'titulo': 'Benefícios',
      'conteudo': "Vale Transporte, Vale Refeição",
    }

  ];

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blue[50],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 4,

      child: ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: jobInfo.length,
        itemBuilder: (context, index) {
          return InfoVagaIndividual(
            icone: jobInfo[index]['icone'],
            titulo: jobInfo[index]['titulo'],
            conteudo: jobInfo[index]['conteudo'],
          );
        },
      ),
    );
  }
}
