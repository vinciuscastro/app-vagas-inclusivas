import 'package:flutter/material.dart';

class InfoSingleJob extends StatelessWidget {
  final IconData icone;
  final String titulo;
  final String conteudo;
  const InfoSingleJob({super.key,
    required this.icone,
    required this.titulo,
    required this.conteudo,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icone,
        color: Colors.grey[800],
      ),
      title: Text(
        titulo,
        style: TextStyle(
          fontSize: 18,
          color: Colors.grey[800],
        ),
      ),
      subtitle: Text(
        conteudo,
        style: TextStyle(
          fontSize: 14,
          color: Colors.grey[600],
        ),
      ),
    );
  }
}
