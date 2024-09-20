import 'package:app_kimberle/providers/job.dart';
import 'package:flutter/material.dart';

class HomeCard extends StatelessWidget {
  final Job vaga;
  const HomeCard({super.key, required this.vaga});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blue[50],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 4,
      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  vaga.name,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    overflow: TextOverflow.ellipsis,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Text(
                  vaga.company,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[600],
                  ),
                ),
                const Spacer(),
                Text(vaga.minority,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                    )),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              vaga.description,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[800],
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}

