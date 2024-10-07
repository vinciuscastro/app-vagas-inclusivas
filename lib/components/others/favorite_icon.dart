import 'package:app_kimberle/data/db_helper.dart';
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

    return FutureBuilder(
      future: DatabaseHelper.isFavorited(widget.vaga.id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else {
          widget.vaga.isFavorite = snapshot.data!;
          return GestureDetector(
            onTap: () {
              setState(() {
                if (!widget.vaga.isFavorite) {
                  widget.vaga.addFavorite();
                } else {
                  widget.vaga.removeFavorite();
                }
              });
            },
            child: Icon(widget.vaga.isFavorite ? Icons.favorite : Icons.favorite_border,
              color: widget.vaga.isFavorite ? Colors.red : Colors.grey,
              size: 30,
            ),
          );
        }
      },
      // child: GestureDetector(
      //   onTap: () {
      //     setState(() {
      //       if (!widget.vaga.isFavorite) {
      //         widget.vaga.addFavorite();
      //       } else {
      //         widget.vaga.removeFavorite();
      //       }
      //     });
      //   },
      //   child: Icon(widget.vaga.isFavorite ? Icons.favorite : Icons.favorite_border,
      //   color: widget.vaga.isFavorite ? Colors.red : Colors.grey,
      //   size: 30,
      //   ),
      //
      // ),
    );
  }
}
