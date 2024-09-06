import 'package:app_kimberle/utils/app_routes.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 250,
      child: ListView(
        children: [
          Container(
            height: 100,
            color: Theme.of(context).primaryColor,
            alignment: Alignment.center,
            child: Text(
              'Menu',
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ),

          ListTile(
            title:  Text('Vagas Favoritas', style: TextStyle(color: Colors.black, fontSize: 18)),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/favorites');
            },
          ),
        ],
      ),
    );
  }
}
