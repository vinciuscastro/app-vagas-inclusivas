import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppBarComponent extends StatelessWidget implements PreferredSizeWidget{
  const AppBarComponent({super.key});


  @override
  Size get preferredSize => Size.fromHeight(90);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/');
        },
        child: const Padding(
          padding: EdgeInsets.only(left: 15),
          child: Text('Kimberlé'),
        ),
      ),
      toolbarHeight: 90,
      automaticallyImplyLeading: false,
      actions: [
        IconButton(
          icon: Icon(Icons.menu),
          onPressed: () => {},
        ),
      ],

    );
  }
}

