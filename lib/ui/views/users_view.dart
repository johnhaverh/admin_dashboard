// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:admin_dashboard/datatables/users_datasource.dart';
import 'package:admin_dashboard/providers/users_provider.dart';

//import 'package:admin_dashboard/ui/cards/white_card.dart';
import 'package:admin_dashboard/ui/labels/custom_labels.dart';

class UsersView extends StatelessWidget {
  const UsersView({super.key});

  @override
  Widget build(BuildContext context) {

    final usersProvider = Provider.of<UsersProvider>(context);
    final usersDataSource = UsersDTS(usersProvider.users);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          Center(child:Text('Users View', style: CustomLabels.h1,)),
          const SizedBox(height: 10,),
          PaginatedDataTable(
              sortAscending: usersProvider.ascending,
              sortColumnIndex: usersProvider.sortColumnIndex,
              columns: [
                const DataColumn(label: Text('Avatar')),
                DataColumn(label: const Text('Nombre'), onSort: ( colIndex, _ ) {
                  usersProvider.sortColumnIndex = colIndex;
                  usersProvider.sort<String>((user) => user.nombre);
                }),
                DataColumn(label: const Text('Email'), onSort: ( colIndex, _ ) {
                  usersProvider.sortColumnIndex = colIndex;
                  usersProvider.sort<String>((user) => user.nombre);
                }),
                const DataColumn(label: Text('UID')),
                const DataColumn(label: Text('Acciones')),
              ],
              source: usersDataSource,
              onPageChanged: ( page ) {},
              // ,
              // header: const Text('Lista de Categorías',maxLines: 2,),
              // onRowsPerPageChanged: (value){
              //   setState(() {
              //     _rowsPerPage = value ?? 10;
              //   });
              // },
          ),
        ],
      )
    );
  }
}