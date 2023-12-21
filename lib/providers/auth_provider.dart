import 'package:flutter/material.dart';

import 'package:admin_dashboard/api/cafe_api.dart';
import 'package:admin_dashboard/models/http/auth_response.dart';
import 'package:admin_dashboard/models/usuario.dart';

import 'package:admin_dashboard/router/router.dart';

import 'package:admin_dashboard/services/local_storage.dart';
import 'package:admin_dashboard/services/navigation_service.dart';
import 'package:admin_dashboard/services/notifications_service.dart';

enum AuthStatus {
  checking,
  authenticated,
  notAuthenticated
}

class AuthProvider extends ChangeNotifier{
  //String? _token;
  AuthStatus authStatus = AuthStatus.checking;
  Usuario? user;

  copyUserWith({
    String? rol,
    bool? estado,
    bool? google,
    String? nombre,
    String? correo,
    String? uid,
    String? img,
    
  }){
    user = Usuario(
      rol: rol ?? user!.rol,
      estado: estado ?? user!.estado, 
      google: google ?? user!.google, 
      nombre: nombre ?? user!.nombre,
      correo: correo ?? user!.correo, 
      uid: uid ?? user!.uid,
      img: img ?? user!.img,
    );
    notifyListeners();
  }


  AuthProvider(){
    isAuthenticated();
  }

  login(String email, String password){

    final data = {
      'correo': email,
      'password': password
    };


    CafeApi.httpPost('/auth/login', data).then(
      (json) {
        //print(json);
        final authResponse = AuthResponse.fromMap(json);
        user=authResponse.usuario;

        authStatus = AuthStatus.authenticated;
        LocalStorage.prefs.setString('token', authResponse.token);
        NavigationService.replaceTo(Flurorouter.dashboardRoute);
        CafeApi.configureDio();
        notifyListeners();
      }
      ).catchError((e){
        //print('error en: $e');
        NotificationsService.showSnackbarError('Usuario / password no validos - error en: $e');
    });
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
        CafeApi.configureDio();
        notifyListeners();
      }
      ).catchError((e){
        //print('error en: $e');
        NotificationsService.showSnackbarError('Usuario ya existe - error en: $e');
    });
  }

  logout(){
    LocalStorage.prefs.remove('token');
    authStatus = AuthStatus.notAuthenticated;
    notifyListeners();
  }

  Future<bool> isAuthenticated() async {
    final token = LocalStorage.prefs.getString('token');

    if (token == null){
      authStatus = AuthStatus.notAuthenticated;
      notifyListeners(); 
      return false;
    }

    try{
      final resp = await CafeApi.httpGet('/auth');
      final authResponse = AuthResponse.fromMap(resp);
      // para mantener conectado por 2 semanas 
      LocalStorage.prefs.setString('token', authResponse.token);

      user=authResponse.usuario;
      authStatus = AuthStatus.authenticated;
      CafeApi.configureDio();
      notifyListeners();
      return true;
    } catch (e) {
      //print(e);
      authStatus = AuthStatus.notAuthenticated;
      notifyListeners();
      return false;
    }
  }

  void refreshUser(Usuario  newUser){
    if (user!.uid == newUser.uid){
      user=newUser;
    }
    notifyListeners();
  }

}