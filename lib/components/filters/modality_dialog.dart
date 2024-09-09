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
        height: 250,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Modalidade de Trabalho',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            DropdownButton<String>(
              value: filterProvider.modality,
              icon: const Icon(Icons.expand_more),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
              dropdownColor: Colors.white,
              underline: Container(
                height: 2,
                color: Theme.of(context).primaryColor,
              ),
              items:
                  ['', 'Presencial', 'Remoto', 'Hibrido'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    child: Text(value,
                        style: const TextStyle(color: Colors.black)),
                  ),
                );
              }).toList(),
              onChanged: (value) {
                filterProvider.updateWorkMode(value!);
              },
            ),
            const SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextButton(
                onPressed: () {
                  _callback();
                  Navigator.of(context).pop();
                },
                child: const Text('Aplicar Filtro', style: TextStyle(color: Colors.white, fontSize: 16)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
