// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';

import 'package:admin_dashboard/ui/cards/white_card.dart';
import 'package:admin_dashboard/ui/labels/custom_labels.dart';

class ProductsView extends StatelessWidget {
  const ProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          Text('Products View', style: CustomLabels.h1,),
          const SizedBox(height: 10,),
          const WhiteCard(title: 'title',child: Text('Complement')),
        ],
      )
    );
  }
}