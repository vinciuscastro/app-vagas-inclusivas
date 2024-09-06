import 'package:app_kimberle/providers/filter_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ModalityDialog extends StatelessWidget {
  final VoidCallback _callback;
  const ModalityDialog(this._callback, {super.key});

  @override
  Widget build(BuildContext context) {
    final filterProvider = Provider.of<FilterProvider>(context);

    return Dialog(

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      elevation: 16,
      child: Container(
        padding: const EdgeInsets.all(20),
        height: 300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            const Text(
              'Tipo da Vaga',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            DropdownButton<String>(
              items: const [
                DropdownMenuItem(value: '', child: Text('')),
                DropdownMenuItem(child: Text('Presencial'), value: 'Presencial'),
                DropdownMenuItem(child: Text('Hibrido'), value: 'Hibrido'),
                DropdownMenuItem(child: Text('Remoto'), value: 'Remoto'),
              ],
              onChanged: (value) {
                filterProvider.updateWorkMode(value!);
              },
            ),

            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _callback();
                Navigator.of(context).pop();
              },
              child: const Text('Aplicar Filtro'),
            ),
          ],
        ),
      ),
    );
  }
}
