// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';

import 'package:admin_dashboard/ui/cards/white_card.dart';
import 'package:admin_dashboard/ui/labels/custom_labels.dart';

class BlackView extends StatelessWidget {
  const BlackView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          Text('Black View', style: CustomLabels.h1,),
          const SizedBox(height: 10,),
          const WhiteCard(title: 'title',child: Text('Complement')),
        ],
      )
    );
  }
}