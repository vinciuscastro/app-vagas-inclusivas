import 'package:flutter/material.dart';

class Filter extends StatelessWidget {
  final text;
  final Function filtrarVagas;
  Filter(this.text, this.filtrarVagas);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 1, right: 5),
      height: 35,
      color: Theme.of(context).primaryColorLight,
      child: TextButton(
          onPressed: () {
            filtrarVagas(text);
          },
          child:
        Text(text, style: TextStyle(color: Colors.black, fontSize: 14))
      ),
    );
  }
}
