import 'package:app_kimberle/providers/job.dart';
import 'package:flutter/material.dart';

class FavoriteIcon extends StatefulWidget {
  final Job vaga;
  const FavoriteIcon({super.key, required this.vaga});

  @override
  State<FavoriteIcon> createState() => _FavoriteIconState();
}

class _FavoriteIconState extends State<FavoriteIcon> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          widget.vaga.isFavorite = !widget.vaga.isFavorite;
        });
      },
      child: Icon(widget.vaga.isFavorite ? Icons.favorite : Icons.favorite_border,
      color: widget.vaga.isFavorite ? Colors.red : Colors.grey,
      size: 30,
      ),

    );
  }
}
