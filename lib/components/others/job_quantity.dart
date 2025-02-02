import 'package:flutter/material.dart';

class JobQuantity extends StatelessWidget {
  final int size;
  final String label;
  const JobQuantity({super.key, required this.size, required this.label});
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: Theme.of(context).textTheme.titleSmall,
          ),
          Text('Total: $size',
              style: TextStyle(
                color: Theme.of(context).textTheme.bodySmall?.color,
                fontSize: 14,
              )),
        ],
      ),
    );
  }
}
