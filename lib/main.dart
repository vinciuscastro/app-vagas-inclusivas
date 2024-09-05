import 'dart:convert';
import 'package:app_kimberle/components/home_card.dart';
import 'package:app_kimberle/components/app_bar_component.dart';
import 'package:app_kimberle/vaga_detalhe_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vagas de Emprego',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF2A4673)),
        primarySwatch: Colors.blue,
        primaryColor: Color(0xFF2A4673),
        primaryColorLight: Color(0xFFD9E7FF),
        primaryColorDark: Color(0xFF2A4673),
        scaffoldBackgroundColor: Color(0xFF1E1E1E),
        textTheme: const TextTheme(
          bodySmall: TextStyle(fontSize: 16, color: Color(0xFFD9E7FF)),
          titleLarge: TextStyle(fontSize: 32, color: Color(0xFFD9E7FF), fontWeight: FontWeight.bold),
          titleMedium: TextStyle(fontSize: 24, color: Color(0xFFD9E7FF), fontWeight: FontWeight.bold),
          titleSmall: TextStyle(fontSize: 20, color: Color(0xFFD9E7FF), fontWeight: FontWeight.bold),
        ),

        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(color: Color(0xFFD9E7FF), size: 40),
          backgroundColor: Color(0xFF2A4673),
          titleTextStyle: TextStyle(color: Color(0xFFD9E7FF), fontSize: 32, fontWeight: FontWeight.bold),
        ),
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<dynamic> vagas = [];
  List<dynamic> vagasFiltradas = [];
  TextEditingController searchController = TextEditingController();


  // D9E7FF texto
  // 2A4673 fundo
  // 2A4673 barra
  @override
  void initState() {
    super.initState();
    carregarVagas();
    searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    searchController.removeListener(_onSearchChanged);
    searchController.dispose();
    super.dispose();
  }

  Future<void> carregarVagas() async {
    final String response = await rootBundle.loadString('assets/vagas.json');
    final data = await json.decode(response);
    setState(() {
      vagas = data;
      vagasFiltradas = vagas;
    });
  }

  void _onSearchChanged() {
    filtrarVagas(searchController.text);
  }

  void filtrarVagas(String query) {
    final vagasFiltradas = vagas.where((vaga) {
      final tituloLower = vaga['titulo'].toLowerCase();
      final searchLower = query.toLowerCase();
      return tituloLower.contains(searchLower);
    }).toList();

    setState(() {
      this.vagasFiltradas = vagasFiltradas;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarComponent(),
      body: SingleChildScrollView( // Envolve todo o corpo em SingleChildScrollView
        child: Column(
          children: [
            Container(
              color: Theme.of(context).primaryColor,
              height: 100,
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Busca', style: Theme.of(context).textTheme.bodySmall,),
                  TextField(
                    controller: searchController,
                    style: Theme.of(context).textTheme.bodySmall,
                    decoration: const InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 0),
                        borderRadius: BorderRadius.zero,
                      ),
                      filled: true,
                      suffixIcon: Icon(Icons.search),
                      hintText: 'Insira a vaga',
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              alignment: Alignment.bottomLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Vagas Disponíveis', style: Theme.of(context).textTheme.titleSmall,),
                  Text('Total: ${vagasFiltradas.length}', style: TextStyle(color: Color(0xFFD9E7FF))),
                ],
              ),
            ),
            ListView.builder(
              shrinkWrap: true, // Garante que o ListView não tente expandir indefinidamente
              physics: NeverScrollableScrollPhysics(), // Remove a rolagem do ListView, deixando apenas a rolagem principal
              itemCount: vagasFiltradas.length,
              itemBuilder: (context, index) {
                final vaga = vagasFiltradas[index];
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => VagaDetalheScreen(vaga: vaga),
                      ),
                    );
                  },
                  child: HomeCard(vaga: vaga),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

}