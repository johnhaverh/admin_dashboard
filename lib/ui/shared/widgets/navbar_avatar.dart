// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';

class NavbarAvatar extends StatelessWidget {
  const NavbarAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Container(
        width: 30,
        height: 30,
        child: Image.network('https://upload.wikimedia.org/wikipedia/commons/9/9e/Placeholder_Person.jpg'),
      ),
    );
  }
}