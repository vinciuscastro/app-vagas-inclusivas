import 'package:app_kimberle/components/home/home_filters.dart';
import 'package:app_kimberle/components/home_card.dart';
import 'package:app_kimberle/components/others/job_quantity.dart';
import 'package:app_kimberle/providers/filter_provider.dart';
import 'package:app_kimberle/providers/jobs.dart';
import 'package:app_kimberle/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/filter.dart';
import '../providers/job.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchController = TextEditingController();
  List<Job> vagas = [];
  List<Job> vagasFiltradas = [];

  @override
  void initState() {
    super.initState();
    final jobsProvider = Provider.of<Jobs>(context, listen: false);
    jobsProvider.loadJobs().then((_) {
      setState(() {
        vagas = jobsProvider.jobs;
        vagasFiltradas = vagas;
      });
    });
  }


  void _filterJobs() {
    final filterProvider = Provider.of<FilterProvider>(context, listen: false);
    final searchQuery = searchController.text.toLowerCase();

    final filteredJobs = vagas.where((vaga) {
      final matchesSearch = vaga.name.toLowerCase().contains(searchQuery);
      final matchesSalary = vaga.salary >= filterProvider.salary;
      // final matchesDistance = vaga.location <= filterProvider.distance;
      final matchesJobType =
          filterProvider.type.isEmpty || vaga.type == filterProvider.type;
      final matchesWorkMode = filterProvider.modality.isEmpty ||
          vaga.modality == filterProvider.modality;

      return matchesSearch && matchesJobType && matchesWorkMode && matchesSalary;
    }).toList();

    setState(() {
      vagasFiltradas = filteredJobs;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(AppRoutes.FAVORITES);
        },
        backgroundColor: Theme.of(context).primaryColor,
        child: const Icon(Icons.favorite),
      ),
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(left: 15),
          child: Text('Kimberlé'),
        ),
        toolbarHeight: 90,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings, size: 30),
            onPressed: () => {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            HomeFilters(searchController, _filterJobs),
            JobQuantity(size: vagasFiltradas.length, label: 'Vagas Disponiveis'),

            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
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
