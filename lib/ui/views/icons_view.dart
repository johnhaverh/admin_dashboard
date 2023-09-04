// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';

import 'package:admin_dashboard/ui/cards/white_card.dart';
import 'package:admin_dashboard/ui/labels/custom_labels.dart';

class IconsView extends StatelessWidget {
  const IconsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          Text('Icons', style: CustomLabels.h1,),
          const SizedBox(height: 10,),
          const Wrap(
            crossAxisAlignment: WrapCrossAlignment.start,
            direction: Axis.horizontal,
            children: [
              WhiteCard(title: 'ac_unit_outlined',child: Center(child: Icon( Icons.ac_unit_outlined)),width: 170,),
              WhiteCard(title: 'access_alarm_outlined',child: Center(child: Icon( Icons.access_alarm_outlined)),width: 170,),
              WhiteCard(title: 'access_time_filled_rounded',child: Center(child: Icon( Icons.access_time_filled_rounded)),width: 170,),
              WhiteCard(title: 'all_inbox_outlined',child: Center(child: Icon( Icons.all_inbox_outlined)),width: 170,),
              WhiteCard(title: 'desktop_mac_sharp',child: Center(child: Icon( Icons.desktop_mac_sharp)),width: 170,),
              WhiteCard(title: 'keyboard_tab_rounded',child: Center(child: Icon( Icons.keyboard_tab_rounded)),width: 170,),
              WhiteCard(title: 'not_listed_location',child: Center(child: Icon( Icons.not_listed_location)),width: 170,),
            ],
          )
        ],
      )
    );
  }
}