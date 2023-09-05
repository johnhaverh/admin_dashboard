// ignore_for_file: unrelated_type_equality_checks

import 'package:admin_dashboard/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:admin_dashboard/providers/side_menu_provider.dart';
import 'package:admin_dashboard/router/router.dart';
import 'package:admin_dashboard/services/navigation_service.dart';

import 'package:admin_dashboard/ui/shared/widgets/logo.dart';
import 'package:admin_dashboard/ui/shared/widgets/menu_item.dart';
import 'package:admin_dashboard/ui/shared/widgets/text_separator.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  void navigateTo(String routeName){
    NavigationService.navegateTo(routeName);
    SideMenuProvider.closeMenu();
  }

  @override
  Widget build(BuildContext context) {

    final sideMenuProvider = Provider.of<SideMenuProvider>(context);

    return Container(
      width: 200,
      height: double.infinity,
      decoration: buildBoxDecoration(),
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          const Logo(),
          const SizedBox(height: 50,),
          const TextSeparator(text: 'main'),
          MenuItem( text: 'Dashboard' ,icon: Icons.compass_calibration_outlined, isActive: sideMenuProvider.currentPage == Flurorouter.dashboardRoute, onPressed: () => navigateTo(Flurorouter.dashboardRoute)),
          MenuItem( text: 'Orders', icon: Icons.shopping_cart_outlined, isActive: false, onPressed: () {}),
          MenuItem( text: 'Analytic', icon: Icons.show_chart_outlined, isActive: false, onPressed: () {}),
          MenuItem( text: 'Categories', icon: Icons.layers_outlined, isActive: false, onPressed: () => navigateTo(Flurorouter.categoriesRoute)),
          MenuItem( text: 'Products', icon: Icons.dashboard_outlined, isActive: false, onPressed: () {}),
          MenuItem( text: 'Discount', icon: Icons.attach_money_outlined, isActive: false, onPressed: () {}),
          MenuItem( text: 'Customers', icon: Icons.people_alt_outlined, isActive: false, onPressed: () {}),

          const SizedBox(height: 30,),
          const TextSeparator(text: 'UI elements'),
          MenuItem( text: 'Icons', icon: Icons.list_alt_outlined, isActive: sideMenuProvider.currentPage == Flurorouter.iconsRoute, onPressed: () => navigateTo(Flurorouter.iconsRoute)),
          MenuItem( text: 'Marketing', icon: Icons.mark_email_read_outlined, isActive: false, onPressed: () {}),
          MenuItem( text: 'Campeign', icon: Icons.note_add_outlined, isActive: false, onPressed: () {}),
          MenuItem( text: 'Blank Page', icon: Icons.post_add_outlined, isActive: sideMenuProvider.currentPage == Flurorouter.blankRoute, onPressed: () => navigateTo(Flurorouter.blankRoute)),
          
          const SizedBox(height: 50,),
          const TextSeparator(text: 'Exit'),
          MenuItem( text: 'Logout', icon: Icons.exit_to_app_outlined, isActive: false, onPressed: () {Provider.of<AuthProvider>(context, listen: false).logout();}),

        ],
      ),
    );
  }

  BoxDecoration buildBoxDecoration() => const BoxDecoration(
    gradient:  LinearGradient(
      colors: [
       Color( 0xff092044 ),
       Color( 0xff092042 ),
      ],
    ),
    boxShadow: [
      BoxShadow(
        color: Colors.black26,
        blurRadius: 10,
      ),
    ]
  );
}