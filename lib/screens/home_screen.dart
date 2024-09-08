import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/home/clear_filter.dart';
import '../components/home/home_card.dart';
import '../components/home/home_filters.dart';
import '../components/others/footer_component.dart';
import '../components/others/job_quantity.dart';
import '../providers/filter_provider.dart';
import '../providers/jobs.dart';
import '../providers/job.dart';
import '../utils/app_routes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchController = TextEditingController();
  List<Job> vagas = [];
  List<Job> vagasFiltradas = [];
  int itemsToShow = 5;

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
      final matchesLocation = filterProvider.location.isEmpty ||
          vaga.location
              .toLowerCase()
              .contains(filterProvider.location.toLowerCase());
      final matchesJobType =
          filterProvider.type.isEmpty || vaga.type == filterProvider.type;
      final matchesWorkMode = filterProvider.modality.isEmpty ||
          vaga.modality == filterProvider.modality;
      final matchesCompany = filterProvider.company.isEmpty ||
          vaga.company
              .toLowerCase()
              .contains(filterProvider.company.toLowerCase());

      return matchesSearch &&
          matchesJobType &&
          matchesWorkMode &&
          matchesSalary &&
          matchesLocation &&
          matchesCompany;
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
        actions: [
          IconButton(
            icon: const Icon(Icons.settings, size: 30),
            onPressed: () => {
              Navigator.of(context).pushNamed(AppRoutes.SETTINGS),
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            HomeFilters(searchController, _filterJobs),
            Container(
              padding: const EdgeInsets.only(left: 30, top: 20, bottom: 10, right: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  JobQuantity(
                      size: vagasFiltradas.length, label: 'Vagas Disponiveis'),
                  ClearFilter(searchController, _filterJobs),
                ],
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: itemsToShow > vagasFiltradas.length
                  ? vagasFiltradas.length
                  : itemsToShow,
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
            if (vagasFiltradas.length > itemsToShow)
              TextButton(
                onPressed: () {
                  setState(() {
                    itemsToShow += 5;
                  });
                },
                child: Container(
                    padding: const EdgeInsets.all(10),
                    alignment: Alignment.center,
                    width: 200,
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text("Mostrar mais vagas", style: TextStyle(color: Theme.of(context).primaryColorLight, fontWeight: FontWeight.bold, fontSize: 14))),
              ),
            const FooterComponent(),
          ],
        ),
      ),
    );
  }
}
