// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:admin_dashboard/providers/categories_provider.dart';

import 'package:admin_dashboard/ui/modals/categories_modal.dart';
import 'package:admin_dashboard/models/category.dart';

class CategoriesDTS extends DataTableSource{

  final List<Categoria> categorias;
  final BuildContext context;

  CategoriesDTS(this.context, {required this.categorias});
  
  @override
  DataRow? getRow(int index) {

    final categoria = categorias[index];

    return DataRow.byIndex (
      index: index,
      cells: [
        DataCell(Text(categoria.uid)),
        DataCell(Text(categoria.nombre)),
        DataCell(Text(categoria.usuario.nombre)),
        DataCell(Row(
          children: [
            IconButton(
              icon: const Icon (Icons.edit_outlined), 
              onPressed: (){
                showModalBottomSheet(
                  backgroundColor: Colors.transparent,
                  context: context, 
                  builder: ( _ ) => CategoriesModal(categoria: categoria)
                );
              },
            ),
            IconButton(
              icon: Icon (Icons.delete_outline,color: Colors.red.withOpacity(0.8),), 
              onPressed: (){
                final dialog = AlertDialog(
                  title: const Text('Borrar registro'),
                  content: Text('¿Borrar definitivamente ${categoria.nombre}?'),
                  actions:[
                    TextButton( onPressed: (){Navigator.of(context).pop();}, child: const Text('No') ),               
                    TextButton( 
                      onPressed: () async {
                        await Provider.of<CategoriesProvider>(context,listen: false).deleteCategory(categoria.uid);
                        Navigator.of(context).pop();
                      }, child: const Text('Si') )
                  ]
                );
                showDialog(context: context, builder: ( _ ) => dialog);
              },
            ),
          ],
        )),
      ]
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => categorias.length;

  @override
  int get selectedRowCount => 0;

}