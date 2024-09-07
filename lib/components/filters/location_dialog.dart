import 'package:app_kimberle/providers/filter_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LocationDialog extends StatelessWidget {
  final VoidCallback _callback;
  const LocationDialog(this._callback, {super.key});

  @override
  Widget build(BuildContext context) {
    final filterProvider = Provider.of<FilterProvider>(context);
    TextEditingController locationController = TextEditingController();
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
              'Localização',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            TextField(
              controller: locationController,
              style: const TextStyle(color: Colors.black, fontSize: 15),
            ),

            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                filterProvider.updateLocation(locationController.text);
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
