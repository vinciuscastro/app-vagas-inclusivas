import 'package:app_kimberle/components/home/filter_component.dart';
import 'package:flutter/material.dart';

class HomeFilters extends StatelessWidget {
  final TextEditingController searchController;
  final VoidCallback _filterJobs;

  const HomeFilters(this.searchController, this._filterJobs, {super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      height: 180,
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Text('Busca',style: Theme.of(context).textTheme.bodySmall,),
          const SizedBox(height: 10),
          TextField(
            onSubmitted: (_) => _filterJobs(),
            controller: searchController,
            style: const TextStyle(color: Colors.black, fontSize: 15),
            decoration: InputDecoration(
              isDense: true,
              contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
              border: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 0),
                borderRadius: BorderRadius.zero,
              ),
              filled: true,
              suffixIcon: IconButton(
                icon: const Icon(Icons.search_sharp),
                onPressed: _filterJobs,
              ),
              hintText: 'Insira a vaga',

            ),
          ),
          const SizedBox(height: 20),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                FilterComponent("Salário", _filterJobs),
                FilterComponent("Tipo", _filterJobs),
                FilterComponent("Modalidade", _filterJobs),
                FilterComponent("Localização", _filterJobs),
                FilterComponent("Empresa", _filterJobs),
                FilterComponent("Minoria", _filterJobs),
              ],
            ),
          )
        ],
      ),
    );
  }
}
