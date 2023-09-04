import 'package:flutter/material.dart';

class NavbarAvatar extends StatelessWidget {
  const NavbarAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Container(
        child: Image.network('https://www.digtalent.id/wp-content/uploads/2023/04/people.jpg'),
        width: 30,
        height: 30,
      ),
    );
  }
}