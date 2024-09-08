import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        height: 35,

        decoration:
        BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(5),
        ),
        child: TextButton(
          onPressed: () {
          },
          child: Text('INSCREVA-SE', style: TextStyle(color: Theme.of(context).primaryColorLight
              , fontSize: 16)),
        )
    );
  }
}
