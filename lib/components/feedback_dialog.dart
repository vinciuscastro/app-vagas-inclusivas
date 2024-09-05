import 'package:flutter/material.dart';

void FeedBackDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: true, // Permite fechar o pop-up clicando fora dele
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15), // Bordas arredondadas
        ),
        titlePadding: EdgeInsets.zero,
        content: Container(
          padding: EdgeInsets.all(8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                title: const Text(
                  'Engenheiro de Software',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ), textAlign: TextAlign.center                 ,
                ),
                contentPadding: EdgeInsets.zero,
                trailing: IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Trabalhar na TechWave Solutions tem sido uma experiência muito positiva para mim como pessoa negra. A empresa se destaca não apenas por implementar políticas afirmativas, mas por vivenciar uma verdadeira cultura de inclusão. ',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
