// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';

class NotificationsService {
  static GlobalKey<ScaffoldMessengerState> messagerKey = GlobalKey<ScaffoldMessengerState>();

  static showSnackbarError(String message){
    final snackbar = SnackBar(
      backgroundColor: Colors.red.withOpacity(0.9),
      content: Text(message, style: const TextStyle(color: Colors.white, fontSize: 20))
    );
    messagerKey.currentState!.showSnackBar(snackbar);
  }

  static showSnackbarMessage(String message){
    final snackbar = SnackBar(
      backgroundColor: Colors.blue.withOpacity(0.9),
      content: Text(message, style: const TextStyle(color: Colors.white, fontSize: 20))
    );
    messagerKey.currentState!.showSnackBar(snackbar);
  }

  static showBusyIndicator( BuildContext context ) {

    final AlertDialog dialog = AlertDialog(
      content: Container(
        width: 100,
        height: 100,
        child: const Center(child: CircularProgressIndicator(),),
      ),
    );

    showDialog(context: context, builder: ( _ )=> dialog );
  }  
  
  static showMessage( BuildContext context, message ) {
    final AlertDialog dialog = AlertDialog(
      // title: const Center(child: Text('Admin Dashboard')),
      content: Container(
        width: 100,
        height: 60,
        child: Column(
          children: [
            const Icon(Icons.bubble_chart_outlined,color: Color(0xff7A6BF5),size: 30,),
            const SizedBox(width: 30,),
            const Spacer(flex:10),
            // const Center(child: CircularProgressIndicator(),),
            Center(child: Text(message, style: const TextStyle(color: Colors.black, fontSize: 20)))
          ],
        )
      ),
      actions:[TextButton( onPressed: (){Navigator.of(context).pop();}, child: const Text('Aceptar') ), ]
    );

    showDialog(context: context, builder: ( _ )=> dialog );
  }  
  
  static showMessageError( BuildContext context, message ) {
    final AlertDialog dialog = AlertDialog(
      // title: const Center(child: Text('Admin Dashboard')),
      content: Container(
        width: 100,
        height: 60,
        child: Column(
          children: [
            const Icon(Icons.bubble_chart_outlined,color: Color(0xff7A6BF5),size: 30,),
            const SizedBox(width: 30,),
            Container(height: 20,),
             Center(child: Text(message, style: const TextStyle(color: Colors.red, fontSize: 20)))
          ],
        )
      ),
      actions:[TextButton( onPressed: (){Navigator.of(context).pop();}, child: const Text('Salir') ), ]
    );

    showDialog(context: context, builder: ( _ )=> dialog );
  }

}