import 'package:flutter/material.dart';

import 'package:admin_dashboard/ui/shared/widgets/search_text.dart';

class Navbar extends StatelessWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: buildBoxDecoration(),
      child: Row(
        children: [
          IconButton(
            onPressed: (){}, 
            icon: const Icon(Icons.menu_outlined)),
            const SizedBox(width: 5,),

            //SearchInput
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 250),
              child: SearchText(),
              ),

        ],
      ),
    );
  }

  BoxDecoration buildBoxDecoration() => const BoxDecoration(
    color: Colors.white,
    boxShadow: [
      BoxShadow(
        color: Colors.black12,
        blurRadius: 5
      )
    ]
  );
}