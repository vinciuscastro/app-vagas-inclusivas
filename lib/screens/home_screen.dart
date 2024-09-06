import 'package:app_kimberle/components/app_drawer.dart';
import 'package:app_kimberle/components/filter.dart';
import 'package:app_kimberle/providers/jobs.dart';
import 'package:app_kimberle/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:app_kimberle/components/home_card.dart';
import 'package:app_kimberle/components/app_bar_component.dart';
import 'package:app_kimberle/screens/job_detail.dart';
import 'dart:convert';
import 'package:app_kimberle/components/home_card.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:provider/provider.dart';
import 'package:app_kimberle/providers/job.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // D9E7FF texto
  // 2A4673 fundo
  // 2A4673 barra

  TextEditingController searchController = TextEditingController();
  List<Job> vagas = []; // Lista completa de vagas
  List<Job> vagasFiltradas = []; // Lista filtrada de vagas


  @override
  void initState() {
    super.initState();
    vagas = [];
    final jobsProvider = Provider.of<Jobs>(context, listen: false);
    jobsProvider.loadJobs().then((_) {
      carregarVagas(jobsProvider.jobs); // Usar a lista de jobs do provider
    });

    searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    searchController.removeListener(_onSearchChanged);
    searchController.dispose();
    super.dispose();
  }

  // Método para carregar as vagas do provider
  void carregarVagas(List<Job> jobs) {
    setState(() {
      vagas = jobs; // Inicializa a lista de vagas com os dados do provider
      vagasFiltradas = vagas; // Inicia com todas as vagas exibidas
    });
  }

  // Método que lida com a busca quando o usuário digita no campo de busca
  void _onSearchChanged() {
    filtrarVagas(searchController.text);
  }

  // Método para filtrar vagas com base no termo de pesquisa
  void filtrarVagas(String query) {
    final vagasFiltradas = vagas.where((vaga) {
      final tituloLower = vaga.name.toLowerCase(); // Usa o título do Job
      final searchLower = query.toLowerCase();
      return tituloLower.contains(searchLower);
    }).toList();

    setState(() {
      this.vagasFiltradas = vagasFiltradas; // Atualiza a lista filtrada
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(AppRoutes.FAVORITES);
        },
        child: Icon(Icons.favorite),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(left: 15),
          child: Text('Kimberlé'),
        ),
        toolbarHeight: 90,
        actions: [
          IconButton(
            icon: Icon(Icons.settings, size: 30),
            onPressed: () => {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Theme.of(context).primaryColor,
              height: 180,
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Busca',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  SizedBox(
                      height:
                          10), // Adiciona um espaço entre o texto e o TextField (campo de busca
                  TextField(
                    controller: searchController,
                    style: TextStyle(color: Colors.black, fontSize: 15),
                    decoration: const InputDecoration(
                      isDense: true,
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 0),
                        borderRadius: BorderRadius.zero,
                      ),
                      filled: true,
                      suffixIcon: Icon(Icons.search),
                      hintText: 'Insira a vaga',
                    ),
                  ),
                  SizedBox(height: 20),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Filter("Salário", () => {}),
                        Filter("Localização", () => {}),
                        Filter("Nível", () => {}),
                        Filter("Tipo", () => {}),
                        Filter("Empresa", () => {}),


                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              alignment: Alignment.bottomLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Vagas Disponíveis',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  Text('Total: ${vagasFiltradas.length}',
                      style: TextStyle(color: Color(0xFFD9E7FF))),
                ],
              ),
            ),
            ListView.builder(
              shrinkWrap:
                  true, // Garante que o ListView não tente expandir indefinidamente
              physics:
                  NeverScrollableScrollPhysics(), // Remove a rolagem do ListView, deixando apenas a rolagem principal
              itemCount: vagasFiltradas.length,
              itemBuilder: (context, index) {
                final vaga = vagasFiltradas[index];
                return InkWell(
                  onTap: () {
                    Navigator.of(context)
                        .pushNamed(AppRoutes.JOB_DETAIL, arguments: vaga);
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
