import 'package:flutter/material.dart';

class FooterComponent extends StatelessWidget {
  const FooterComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 230,
      width: double.infinity,
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      color: Theme.of(context).primaryColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Kimberlé', style: Theme.of(context).textTheme.titleLarge),
          Text("Empresas", style: Theme.of(context).textTheme.labelSmall),
          Text("Sobre nós", style: Theme.of(context).textTheme.labelSmall),
          Text("Contato", style: Theme.of(context).textTheme.labelSmall),
          Text("Termos de uso", style: Theme.of(context).textTheme.labelSmall),
          Container(
            width: 150,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
               IconButton(
                 icon: Icon(Icons.facebook, color: Colors.white),
                 onPressed: () => {},
               ),
                IconButton(
                  icon: Icon(Icons.phone, color: Colors.white),
                  onPressed: () => {},
                ),
                IconButton(
                  icon: Icon(Icons.email, color: Colors.white),
                  onPressed: () => {},
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
