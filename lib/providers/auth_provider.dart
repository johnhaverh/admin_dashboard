import 'package:admin_dashboard/services/local_storage.dart';
import 'package:flutter/material.dart';

enum AuthStatus {
  checking,
  authenticated,
  noAuthenticated
}

class AuthProvider extends ChangeNotifier{
  String? _token;
  AuthStatus authStatus = AuthStatus.checking;

  AuthProvider(){
    isAuthenticated();
  }

  login(String email, String password){
    _token = 'adsf92837rbj23kjhdasdf09124bkdfasd0';
    LocalStorage.prefs.setString('token',_token!);
    authStatus = AuthStatus.authenticated;
    notifyListeners();
  }

  Future<bool> isAuthenticated() async {
    final token = LocalStorage.prefs.getString('token');

    if (token == null){
      authStatus = AuthStatus.noAuthenticated;
      notifyListeners(); 
      return false;
    }
    await Future.delayed(Duration(milliseconds: 1000));

    authStatus = AuthStatus.authenticated;
    notifyListeners();
    return true;
  }
}