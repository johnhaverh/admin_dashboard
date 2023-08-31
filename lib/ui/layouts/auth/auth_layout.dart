import 'package:admin_dashboard/ui/layouts/auth/widgets/custom_background.dart';
import 'package:flutter/material.dart';

class AuthLayaut extends StatelessWidget {
  const AuthLayaut({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          //desktop
          _DesktopBody(),  
          //mobile
          //linksbar
        ],
      )
    );
  }
}

class _DesktopBody extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      height: size.height,
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
          )
        ],
      ),
    );
  }
}