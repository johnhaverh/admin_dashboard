import 'package:flutter/material.dart';
import 'package:admin_dashboard/ui/shared/sidebar.dart';

class DashboardLayout extends StatelessWidget {

  final Widget child;
  const DashboardLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color( 0xffEDF1F2),
      body: Row(
        children: [
          const Sidebar(),
          Expanded(child: child)
        ],

      )
    );
  }
}