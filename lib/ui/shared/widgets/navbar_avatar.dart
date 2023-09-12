// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:admin_dashboard/providers/providers.dart';

class NavbarAvatar extends StatelessWidget {
  const NavbarAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    
    final authProvider = Provider.of<AuthProvider>(context);
    
     final user = authProvider.user!;
     final image = ( user.img == null) 
     ? const Image(image: AssetImage('no-image.jpg')) 
     : FadeInImage.assetNetwork(placeholder: 'loader.gif', image: user.img!);
    
    return ClipOval(
      child: Container(
        width: 30,
        height: 30,
        child: image,
        //child: Image.network('https://upload.wikimedia.org/wikipedia/commons/9/9e/Placeholder_Person.jpg'),
      ),
    );
  }
}