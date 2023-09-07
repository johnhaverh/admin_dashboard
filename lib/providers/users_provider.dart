import 'package:flutter/material.dart';
//import 'package:admin_dashboard/services/notifications_service.dart';

import 'package:admin_dashboard/api/cafe_api.dart';
import 'package:admin_dashboard/models/http/users_response.dart';
import 'package:admin_dashboard/models/usuario.dart';


class UsersProvider extends ChangeNotifier{

  List<Usuario> users = [];
  bool isLoading = true;

  UsersProvider(){
    getPaginatedUsers();
  }
  
  // getUsers() async {
  //   final resp = await CafeApi.httpGet('/usuarios');
  //   final usersResp = UsersResponse.fromMap(resp);

  //   users = [...usersResp.usuarios];    
  //   notifyListeners();
  // }

  getPaginatedUsers() async {
    final resp = await CafeApi.httpGet('/usuarios?limite=100&desde=0');
    final usersResp = UsersResponse.fromMap(resp);

    isLoading = false;

    users = [...usersResp.usuarios];    
    notifyListeners();
  }

  // Future newUser(String name) async {
  //   final data = {
  //     'nombre': name
  //   };
  //   try {
  //     final json = await CafeApi.httpPost('/usuarios',data);
  //     final newUser = Usuario.fromMap(json);
  //     users.add(newUser);
  //     notifyListeners();
  //   }catch (e){
  //     throw('Error alta usuario - error : $e');
  //     //NotificationsService.showSnackbarError('Error alta categoría - error : $e');
  //   }
  // }


  // Future updateUser(String id, String name) async {
  //   final data = {
  //     'nombre': name
  //   };
  //   try {
  //     await CafeApi.httpPut('/usuarios/$id',data);
  //     users = users.map(
  //       (user) {
  //         if (user.id != id) return user;
  //         user.nombre = name;
  //         return user;
  //       }
  //     ).toList();
  //     notifyListeners();
  //   }catch (e){
  //     throw('Error update usuario - error : $e');
  //     //NotificationsService.showSnackbarError('Error update categoría - error : $e');
  //   }
  // }

  // Future deleteUser(String id) async {

  //   try {
  //     await CafeApi.httpDelete('/usuarios/$id',{});
      
  //     users.removeWhere((user) => user.id == id);
  //     notifyListeners();
  //   }catch (e){
  //     throw('Error borrado usuario - error : $e');
  //     //NotificationsService.showSnackbarError('Error delete categoría - error : $e');
  //   }
  // }
}