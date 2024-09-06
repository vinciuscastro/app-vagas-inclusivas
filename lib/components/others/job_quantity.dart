import 'package:flutter/material.dart';

class JobQuantity extends StatelessWidget {
  final size;
  final label;

  const JobQuantity({super.key, required this.size, required this.label});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      alignment: Alignment.bottomLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: Theme.of(context).textTheme.titleSmall,
          ),
          Text('Total: ${size}',
              style: const TextStyle(color: Color(0xFFD9E7FF))),
        ],
      ),
    );
  }
}
