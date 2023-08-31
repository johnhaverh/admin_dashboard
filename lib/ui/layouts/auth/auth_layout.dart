import 'package:flutter/material.dart';
import 'package:admin_dashboard/ui/layouts/auth/widgets/custom_background.dart';
import 'package:admin_dashboard/ui/layouts/auth/widgets/custom_title.dart';
import 'package:admin_dashboard/ui/layouts/auth/widgets/link_bar.dart';

class AuthLayaut extends StatelessWidget {
  
  final Widget child;
  const AuthLayaut({super.key, required this.child});

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          (size.width > 1000) ?  _DesktopBody(child: child) : _MobileBody(child: child),
          //linksbar
          const LinkBar(),
        ],
      )
    );
  }
}

class _MobileBody extends StatelessWidget {

  final Widget child;

  const _MobileBody({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
           const SizedBox(height: 20,),
           const CustomTitle(), 
           Container(
            width: double.infinity,
            height: 420,
            child: child,
           ),
           Container(
            width: double.infinity,
            height: 400,
            child: CustomBackground(),
           ),
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
      color: Colors.black,
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