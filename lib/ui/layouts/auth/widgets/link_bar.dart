import 'package:flutter/material.dart';
import 'package:admin_dashboard/ui/buttons/link_text.dart';

class LinkBar extends StatelessWidget {
  const LinkBar({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      color: Colors.black,
      height: size.height * 0.05,
      child: const Wrap(
        children: [
          LinkText(text: 'About'),
          LinkText(text: 'Help Center'),
          LinkText(text: 'Term of service'),
          LinkText(text: 'Privacy Policy'),
          LinkText(text: 'Cookie Policy'),
          LinkText(text: 'Ads info'),
          LinkText(text: 'Blog'),
          LinkText(text: 'Status'),
          LinkText(text: 'Careers'),
          LinkText(text: 'Brand Resources'),
          LinkText(text: 'Advertising'),
          LinkText(text: 'BraMarketing'),
        ],
      ),
    );
  }
}