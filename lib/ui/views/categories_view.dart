// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:admin_dashboard/providers/categories_provider.dart';
import 'package:admin_dashboard/datatables/categories_datasource.dart';

import 'package:admin_dashboard/ui/labels/custom_labels.dart';
import 'package:admin_dashboard/ui/buttons/custom_icon_button.dart';
//import 'package:admin_dashboard/ui/cards/white_card.dart';

class CategoriesView extends StatefulWidget {
  const CategoriesView({super.key});

  @override
  State<CategoriesView> createState() => _CategoriesViewState();
}

class _CategoriesViewState extends State<CategoriesView> {

  int _rowPerPage = PaginatedDataTable.defaultRowsPerPage;

  @override
  void initState() {
    super.initState();
    Provider.of<CategoriesProvider>(context, listen: false).getCategories();
  }

  @override
  Widget build(BuildContext context) {

    final categorias = Provider.of<CategoriesProvider>(context).categories;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          Text('Categories View', style: CustomLabels.h1,),
          const SizedBox(height: 10,),
          //const WhiteCard(title: 'title',child: Text('Complement')),
          PaginatedDataTable(
              columns: const [
                DataColumn(label: Text('ID')),
                DataColumn(label: Text('Categoria')),
                DataColumn(label: Text('Creado por')),
                DataColumn(label: Text('Acciones')),
              ],
              source: CategoriesDTS(categorias: categorias, context),
              header: Text('Lista de Categorías',maxLines: 2,),
              onRowsPerPageChanged: (value){
                setState(() {
                  _rowPerPage = value ?? 10;
                });
              },
              rowsPerPage: _rowPerPage,
              actions: [
                CustomIconButton(onPressed: (){}, text: 'Crear', icon: Icons.add_outlined)
              ],
            ),
        ],
      )
    );
  }
}