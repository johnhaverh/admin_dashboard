// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:admin_dashboard/providers/categories_provider.dart';
import 'package:admin_dashboard/services/notifications_service.dart';

import 'package:admin_dashboard/models/category.dart';

import 'package:admin_dashboard/ui/buttons/custom_outline_button.dart';
import 'package:admin_dashboard/ui/inputs/custom_inputs.dart';
import 'package:admin_dashboard/ui/labels/custom_labels.dart';

class CategoriesModal extends StatefulWidget {

  final Categoria? categoria;

  const CategoriesModal({super.key, this.categoria});

  @override
  State<CategoriesModal> createState() => _CategoriesModalState();
}

class _CategoriesModalState extends State<CategoriesModal> {

  String nombre ="";
  String? id;

  @override
  void initState() {
    super.initState();
    id= widget.categoria?.id;
    nombre = widget.categoria?.nombre ?? '';
  }

  @override
  Widget build(BuildContext context) {

    final categoryProvider = Provider.of<CategoriesProvider>(context, listen: false);

    return Container(
      padding: const EdgeInsets.all(20),
      height: 300,
      width: 100,
      decoration: buildBoxDecoration(),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(widget.categoria?.nombre ?? 'Nueva Categoría', style: CustomLabels.h1.copyWith(color: Colors.blue)),
              IconButton(onPressed: () => Navigator.of(context).pop(), icon: const Icon(Icons.close))
            ],
          ),
          Divider(color: Colors.black.withOpacity(0.3),),
          const SizedBox(height: 20,),
          TextFormField(
            initialValue: widget.categoria?.nombre ?? '',
            onChanged: (value) => nombre = value,
            decoration: CustomInputs.modalInputDecaration(hint: 'Nombre categoría', label: 'Categoría', icon: Icons.new_releases_outlined,color: Colors.black),
            style: const TextStyle(color: Colors.black),
          ),
          Container(
            margin: const EdgeInsets.only(top: 30),
            alignment: Alignment.center,
            child: CustomOutlineButton(
              onPressed: () async {

                try {
                  if (id == null ){
                    await categoryProvider.newCategory(nombre);
                    NotificationsService.showSnackbarMessage('Categoría < $nombre > agregada correctamente');
                  } else {
                      await categoryProvider.updateCategory(id!, nombre);
                      NotificationsService.showSnackbarMessage('Categoría < $nombre > modificada correctamente');
                  }
                  Navigator.of(context).pop();
                } catch (e) {
                  Navigator.of(context).pop();
                  NotificationsService.showSnackbarError('Categoría no se pudo guardar');
                } 
              }, 
              text: 'Guardar',
              color:Colors.blue,
              isFilled: true,
              //icon: Icons.add_outlined
            )
          )
        ],
      ),
    );
  }

  BoxDecoration buildBoxDecoration() => const BoxDecoration(  
    //borderRadius: BorderRadius.circular(50),
    borderRadius: BorderRadius.only(topLeft: Radius.circular(50), topRight: Radius.circular(50)),
    color: Colors.white, //.withOpacity(.1),
    boxShadow: [
      BoxShadow(
      color: Colors.black26,
      ) 
    ]

  );
}