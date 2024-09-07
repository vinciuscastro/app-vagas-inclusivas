import 'package:app_kimberle/components/filters/company_dialog.dart';
import 'package:app_kimberle/components/filters/location_dialog.dart';
import 'package:app_kimberle/components/filters/salary_dialog.dart';
import 'package:app_kimberle/components/filters/type_dialog.dart';
import 'package:app_kimberle/providers/filter_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../filters/modality_dialog.dart';

class FilterComponent extends StatelessWidget {
  final String filterName;
  final VoidCallback _callback;

  FilterComponent(this.filterName, this._callback);

  @override
  Widget build(BuildContext context) {
    final filterProvider = Provider.of<FilterProvider>(context);

    return Container(
      margin: EdgeInsets.only(left: 1, right: 5),
      height: 35,
      color: Theme.of(context).primaryColorLight,
      child: TextButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  if (filterName == 'Tipo') {
                    return TypeDialog(_callback);
                  } else if (filterName == 'Modalidade') {
                    return ModalityDialog(_callback);
                  } else if (filterName == 'Salário') {
                    return SalaryDialog(_callback);
                  } else if (filterName == 'Localização') {
                    return LocationDialog(_callback);
                  } else {
                    return CompanyDialog(_callback);
                  }
                }
            );
          },
          child:
        Text(filterName, style: TextStyle(color: Colors.black, fontSize: 14))
      ),
    );
  }
}
