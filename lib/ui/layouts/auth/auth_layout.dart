import 'package:flutter/material.dart';
import 'package:admin_dashboard/ui/layouts/auth/widgets/custom_background.dart';
import 'package:admin_dashboard/ui/layouts/auth/widgets/custom_title.dart';
import 'package:admin_dashboard/ui/layouts/auth/widgets/link_bar.dart';

class AuthLayaut extends StatelessWidget {
  
  final Widget child;
  const AuthLayaut({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          //desktop
          _DesktopBody(child: child),  
          //mobile
          //linksbar
          const LinkBar(),
        ],
      )
    );
  }
}

class _DesktopBody extends StatelessWidget {

  final Widget child;

  const _DesktopBody({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      height: size.height * 0.95,
      color: Colors.greenAccent,
      child: Row(
        children: [
          //backgroud
          const CustomBackground(),
          //view container
          Container(
            width: 600,
            height: double.infinity,
            color: Colors.black,
            child: Column( 
              children:[ 
                const SizedBox(height: 20,),
                const CustomTitle(), 
                const SizedBox(height: 50,),
                Expanded(child: child)
              ]  
            ),
          )
        ],
      ),
    );
  }
}