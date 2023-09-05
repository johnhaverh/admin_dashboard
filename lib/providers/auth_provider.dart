import 'package:flutter/material.dart';

import 'package:admin_dashboard/api/cafe_api.dart';
import 'package:admin_dashboard/models/http/auth_response.dart';

import 'package:admin_dashboard/router/router.dart';

import 'package:admin_dashboard/services/local_storage.dart';
import 'package:admin_dashboard/services/navigation_service.dart';
import 'package:admin_dashboard/services/notifications_service.dart';

enum AuthStatus {
  checking,
  authenticated,
  noAuthenticated
}

class AuthProvider extends ChangeNotifier{
  String? _token;
  AuthStatus authStatus = AuthStatus.checking;
  Usuario? user;

  AuthProvider(){
    isAuthenticated();
  }

  login(String email, String password){
    _token = 'adsf92837rbj23kjhdasdf09124bkdfasd0';
    LocalStorage.prefs.setString('token',_token!);
    authStatus = AuthStatus.authenticated;
    notifyListeners();

    //isAuthenticated();
    NavigationService.replaceTo(Flurorouter.dashboardRoute);
  }

  register(String email, String password, String name){

    final data = {
      'nombre': name,
      'correo': email,
      'password': password
    };

    CafeApi.httpPost('/usuarios', data).then(
      (json) {
        //print(json);
        final authResponse = AuthResponse.fromMap(json);
        user=authResponse.usuario;

        authStatus = AuthStatus.authenticated;
        LocalStorage.prefs.setString('token', authResponse.token);
        NavigationService.replaceTo(Flurorouter.dashboardRoute);
        notifyListeners();
      }
      ).catchError((e){
        //print('error en: $e');
        NotificationsService.showSnackbarError('Usuario ya existe - error en: $e');
    });
  }

  Future<bool> isAuthenticated() async {
    final token = LocalStorage.prefs.getString('token');

    if (token == null){
      authStatus = AuthStatus.noAuthenticated;
      notifyListeners(); 
      return false;
    }
    await Future.delayed(const Duration(milliseconds: 1000));

    authStatus = AuthStatus.authenticated;
    notifyListeners();
    return true;
  }
}