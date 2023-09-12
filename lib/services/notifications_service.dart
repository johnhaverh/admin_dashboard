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
        child: const Center(child: CircularProgressIndicator(),
        ),
      ),
    );

    showDialog(context: context, builder: ( _ )=> dialog );
  }

}