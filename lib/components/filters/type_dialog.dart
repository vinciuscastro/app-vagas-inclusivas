import 'package:app_kimberle/providers/filter_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TypeDialog extends StatelessWidget {
  final VoidCallback _callback;
  const TypeDialog(this._callback, {super.key});

  @override
  Widget build(BuildContext context) {
    final filterProvider = Provider.of<FilterProvider>(context);

    return Dialog(

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      elevation: 16,
      child: Container(
        padding: EdgeInsets.all(20),
        height: 300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Tipo da Vaga',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            DropdownButton<String>(
              items: [
                DropdownMenuItem(child: Text(''), value: ''),
                DropdownMenuItem(child: Text('ClT'), value: 'CLT'),
                DropdownMenuItem(child: Text('PJ'), value: 'PJ'),
                DropdownMenuItem(child: Text('Estágio'), value: 'Estagio'),
              ],
              onChanged: (value) {
                filterProvider.updateJobType(value!);
              },
            ),

            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _callback();
                Navigator.of(context).pop();
              },
              child: Text('Aplicar Filtro'),
            ),
          ],
        ),
      ),
    );
  }
}
