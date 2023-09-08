import 'package:flutter/material.dart';

class CustomBackground extends StatelessWidget {
  const CustomBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.black,
      decoration: buildBoxDecoration(),
      child: Container(
        constraints: const BoxConstraints(maxWidth: 400),
        child: const Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            //child:  Image(image: AssetImage('twitter-white-logo.png'),width: 400,)),
            //child:  Image(image: AssetImage('logo.png'),width: 300,)),
            child:  Icon(Icons.bubble_chart_outlined,color: Color(0xff7A6BF5),size: 400,),),
        ),
      ),
    );
  }

  BoxDecoration buildBoxDecoration() {
    return const BoxDecoration(
        image: DecorationImage(
          //image:  AssetImage('twitter-bg.png'),
          image:  AssetImage('dashboard-bg.png'),
          fit: BoxFit.cover,
        )
    );
  }
}