import 'package:app_kimberle/providers/job.dart';
import 'info_card.dart';
import 'package:flutter/material.dart';

class HomeCard extends StatefulWidget {
  final Job vaga;
  const HomeCard({Key? key, required this.vaga}) : super(key: key);

  @override
  State<HomeCard> createState() => _HomeCardState();
}

class _HomeCardState extends State<HomeCard> {
  
  late Job vaga;
  
  @override
  void initState() {
    super.initState();
    vaga = widget.vaga;
  }
  
  
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
            Text(
              vaga.name,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Text(
                  vaga.company,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[600],
                  ),
                ),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      vaga.isFavorite = !vaga.isFavorite;
                    });
                  },
                  child: Icon(vaga.isFavorite ? Icons.favorite : Icons.favorite_border),
                )
              ],
            ),
            SizedBox(height: 8),
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
