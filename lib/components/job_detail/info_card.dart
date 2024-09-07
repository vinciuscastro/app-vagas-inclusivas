import 'package:app_kimberle/providers/job.dart';
import 'package:flutter/material.dart';
import 'package:app_kimberle/components/job_detail/info_single_job.dart';

class InfoCard extends StatelessWidget {
  final Job vaga;

  const InfoCard({super.key, required this.vaga});

  @override
  Widget build(BuildContext context) {
    final beneficios = (vaga.benefits as List<dynamic>?)?.map((item) => item.toString()).toList();

    final List<Map<String, dynamic>> jobInfo = [
      {
        'icone': Icons.monetization_on,
        'titulo': 'Salário',
        'conteudo': 'R\$ ${vaga.salary.toStringAsFixed(2)}',
      },
      {
        'icone': Icons.business,
        'titulo': 'Tipo de Vaga',
        'conteudo': vaga.type,
      },
      {
        'icone': Icons.home_work,
        'titulo': 'Modalidade',
        'conteudo': vaga.modality,
      },
      {
        'icone': Icons.access_time,
        'titulo': 'Horário',
        'conteudo': vaga.schedule,
      },
      {
        'icone': Icons.location_on,
        'titulo': 'Local',
        'conteudo': vaga.location,
      },
      {
        'icone': Icons.accessibility,
        'titulo': 'Benefícios',
        'conteudo': beneficios?.join(', ') ?? 'Não informado',
      },
    ];

    return Card(
      color: Colors.blue[50],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 4,
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: jobInfo.length,
        itemBuilder: (context, index) {
          return InfoSingleJob(
            icone: jobInfo[index]['icone'],
            titulo: jobInfo[index]['titulo'],
            conteudo: jobInfo[index]['conteudo'],
          );
        },
      ),
    );
  }
}
