import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTitle extends StatelessWidget {
  const CustomTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Image.asset('twitter-white-logo.png', width:50, height: 50,),
          //Image.asset('logo.png', width:50, height: 50,),
          Icon(Icons.bubble_chart_outlined,color: Color(0xff7A6BF5),size: 50,),
          const SizedBox(height: 20,),
          FittedBox(
            fit: BoxFit.contain,
            child: Text('Admin Dashboard',style: GoogleFonts.montserratAlternates(fontSize: 50,color: Colors.white, fontWeight: FontWeight.bold),)),
        ],
      ),
    );
  }
}