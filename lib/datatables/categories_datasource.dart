import 'package:flutter/material.dart';
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
        DataCell(Text(categoria.id)),
        DataCell(Text(categoria.nombre)),
        DataCell(Text(categoria.usuario.nombre)),
        DataCell(Row(
          children: [
            IconButton(
              icon: Icon (Icons.edit_outlined), 
              onPressed: (){},
            ),
            IconButton(
              icon: Icon (Icons.delete_outline,color: Colors.red.withOpacity(0.8),), 
              onPressed: (){
                final dialog = AlertDialog(
                  title: Text('Borrar registro'),
                  content: Text('¿Borrar definitivamente ${categoria.nombre}?'),
                  actions:[
                    TextButton( onPressed: (){Navigator.of(context).pop();}, child: Text('No') ),               
                    TextButton( onPressed: (){Navigator.of(context).pop();}, child: Text('Si') )
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