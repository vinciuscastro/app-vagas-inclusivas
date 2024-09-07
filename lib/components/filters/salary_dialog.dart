import 'package:app_kimberle/providers/filter_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SalaryDialog extends StatelessWidget {
  final VoidCallback _callback;
  const SalaryDialog(this._callback, {super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController salaryController = TextEditingController();
    final filterProvider = Provider.of<FilterProvider>(context);
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      elevation: 16,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        height: 250,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Salário',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            TextField(
              decoration: const InputDecoration(
                hintText: 'Salário minimo desejado',
                hintStyle: TextStyle(color: Colors.black),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                suffixIcon: Icon(Icons.monetization_on),
              ),
              controller: salaryController,
              keyboardType: TextInputType.number,
              style: const TextStyle(color: Colors.black, fontSize: 14),
            ),

            const SizedBox(height: 20),
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextButton(
            onPressed: () {
              filterProvider.updateSalary(salaryController.text);
              _callback();
              Navigator.of(context).pop();
            },
            child: Text('Aplicar Filtro', style: Theme.of(context).textTheme.bodySmall),
          ),
        ),
          ],
        ),
      ),
    );
  }
}
