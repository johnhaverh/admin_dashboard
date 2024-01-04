// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:admin_dashboard/providers/providers.dart';

import 'package:admin_dashboard/providers/auth_provider.dart';
import 'package:admin_dashboard/services/navigation_service.dart';
import 'package:admin_dashboard/ui/shared/widgets/drop_down_items.dart';

class NavbarAvatar extends StatelessWidget {
  const NavbarAvatar({super.key});

  @override
  Widget build(BuildContext context) {

    return ClipOval(
      child: Container(
        width: 30,
        height: 30,
        child: _popupMenuButton(context),
        //child: Image.network('https://upload.wikimedia.org/wikipedia/commons/9/9e/Placeholder_Person.jpg'),
      ),
    );
  }
} 


PopupMenuButton<String> _popupMenuButton(BuildContext context) {

  final authProvider = Provider.of<AuthProvider>(context);

  final user = authProvider.user!;
  final image = ( user.img == null || user.img == '') 
  ? const Image(image: AssetImage('no-image.jpg')) 
  : FadeInImage.assetNetwork(placeholder: 'loader.gif', image: user.img!);
    
  return PopupMenuButton<String>(
    // color: secondaryColor,
    onSelected: seleccionOpcion,
    itemBuilder: (BuildContext context) {
      return DropDownItems.opciones.map((String choice) {
        return PopupMenuItem<String>(
          value: choice,
          child: Text(choice),
        );
      }).toList();
    },
    child: image,
    // child: const Icon( Icons.more_vert_outlined, size: 38, ),
  );
}


void seleccionOpcion(String choice) {
  final authProvider = Provider.of<AuthProvider>(NavigationService.navigatorKey.currentContext!, listen: false);

  switch (choice){
    case DropDownItems.option1:
        //  print('Funcionalidad opcion 1');
         break;    
    case DropDownItems.option2:
        //  print('Funcionalidad opcion 2');
         break;    
    case DropDownItems.option3:
        //  print('Funcionalidad opcion 3');
         break;   
    case DropDownItems.perfil:
        //  print('Funcionalidad perfil');
        NavigationService.replaceTo('/dashboard/users/${authProvider.user?.uid}');
         break;
    case DropDownItems.salir:
         Provider.of<AuthProvider>(NavigationService.navigatorKey.currentContext!, listen: false).logout();
         break;
  }
}
