import 'package:app_kimberle/providers/filter_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ClearFilter extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback callback;
  const ClearFilter(this.controller, this.callback, {super.key});

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: controller.text.isNotEmpty || Provider.of<FilterProvider>(context).isFilterActive(),
      child: Container(
        height: 35,
        color: Theme.of(context).primaryColorLight,
        child: TextButton(
          onPressed: () {
            controller.clear();
            Provider.of<FilterProvider>(context, listen: false).resetFilters();
            callback();
          },
          child: const Text('Limpar Filtros', style: TextStyle(color: Colors.black, fontSize: 14), textAlign: TextAlign.start),
        ),
      ),
    );
  }
}
