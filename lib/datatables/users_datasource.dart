// ignore_for_file: prefer_const_constructors

import 'package:admin_dashboard/services/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:admin_dashboard/models/usuario.dart';

class UsersDTS extends DataTableSource {

  final List<Usuario> users;
  final BuildContext context;

  UsersDTS(this.context,{required this.users});

  @override
  DataRow? getRow(int index) {

    final Usuario user = users[index];
    final image = ( user.img == null || user.img == "") 
    ? const Image(image: AssetImage('no-image.jpg'),width: 40,height: 40,) 
    : FadeInImage.assetNetwork(placeholder: 'loader.gif', image: user.img!,width: 40,height: 40,);

    return DataRow.byIndex (
      index: index,
      cells: [      
        DataCell(ClipOval(child: image,)),
        DataCell(Text(user.nombre!)),
        DataCell(Text(user.correo!)),
        DataCell(Text(user.uid!)),
        DataCell(Row(
          children: [
            IconButton(
              icon: const Icon (Icons.edit_outlined), 
              onPressed: (){
                NavigationService.replaceTo('/dashboard/users/${user.uid}');
                // showModalBottomSheet(
                //   backgroundColor: Colors.transparent,
                //   context: context, 
                //   builder: ( _ ) => CategoriesModal(categoria: categoria)
                // );
              },
            ),
            // IconButton(
            //   icon: Icon (Icons.delete_outline,color: Colors.red.withOpacity(0.8),), 
            //   onPressed: (){
            //     // final dialog = AlertDialog(
            //     //   title: const Text('Borrar registro'),
            //     //   content: Text('¿Borrar definitivamente ${categoria.nombre}?'),
            //     //   actions:[
            //     //     TextButton( onPressed: (){Navigator.of(context).pop();}, child: const Text('No') ),               
            //     //     TextButton( 
            //     //       onPressed: () async {
            //     //         await Provider.of<CategoriesProvider>(context,listen: false).deleteCategory(categoria.id);
            //     //         Navigator.of(context).pop();
            //     //       }, child: const Text('Si') )
            //     //   ]
            //     // );
            //     // showDialog(context: context, builder: ( _ ) => dialog);
            //   },
            // ),
          ],
        )),
      ]
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => users.length;

  @override
  int get selectedRowCount => 0;
}