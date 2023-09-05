// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:admin_dashboard/providers/auth_provider.dart';

import 'package:admin_dashboard/ui/cards/white_card.dart';
import 'package:admin_dashboard/ui/labels/custom_labels.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {

    final authProvider = Provider.of<AuthProvider>(context);
    
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          Text('Dashborad View', style: CustomLabels.h1,),
          const SizedBox(height: 10,),
          //const WhiteCard(title: 'Sales Statistics',child: Text('Hello World')),
          WhiteCard(title: authProvider.user!.nombre, child: Text(authProvider.user!.correo)),
        ],
      )
    );
  }
}