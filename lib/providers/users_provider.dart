import 'package:flutter/material.dart';
//import 'package:admin_dashboard/services/notifications_service.dart';

import 'package:admin_dashboard/api/cafe_api.dart';
import 'package:admin_dashboard/models/http/users_response.dart';
import 'package:admin_dashboard/models/usuario.dart';


class UsersProvider extends ChangeNotifier{

  List<Usuario> users = [];
  bool isLoading = true;
  bool ascending = true;
  int? sortColumnIndex;

  UsersProvider(){
    getPaginatedUsers();
  }
  
  getPaginatedUsers() async {
    final resp = await CafeApi.httpGet('/usuarios?limite=100&desde=0');
    final usersResp = UsersResponse.fromMap(resp);
    isLoading = false;
    users = [...usersResp.usuarios];    
    notifyListeners();
  }


  void sort<T>(Comparable<T> Function(Usuario user) getField){
    users.sort((a,b){
        final aValue = getField(a);
        final bValue = getField(b);
        return ascending ? Comparable.compare(aValue, bValue) : Comparable.compare(bValue, aValue);
      }
    );
    ascending = !ascending;
    notifyListeners();
  }


  Future<Usuario> getUserById( String uid) async {

    try {
      final resp = await CafeApi.httpGet('/usuarios/$uid');
      final user = Usuario.fromMap(resp); 
      return user;
    } catch (e) {
      throw e;
    }
  }

  void refreshUser(Usuario  newUser){

    users = users.map(
      (user){
        if (user.uid == newUser.uid){
          user=newUser;
        }
        return user;
      }
    ).toList();
    
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