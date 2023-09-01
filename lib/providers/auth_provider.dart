import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier{
  String? _token;

  login(String email, String password){
    _token = 'adsf92837rbj23kjhdasdf09124bkdfasd0';

    notifyListeners();
  }
}