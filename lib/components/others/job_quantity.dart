import 'package:flutter/material.dart';

class JobQuantity extends StatelessWidget {
  final int size;
  final String label;
  const JobQuantity({super.key, required this.size, required this.label});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 30, top: 20, bottom: 10, right: 20),
      alignment: Alignment.bottomLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: Theme.of(context).textTheme.titleSmall,
          ),
          Text('Total: $size',
              style: const TextStyle(color: Color(0xFFD9E7FF))),
        ],
      ),
    );
  }
}
