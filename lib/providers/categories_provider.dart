import 'package:flutter/material.dart';
//import 'package:admin_dashboard/services/notifications_service.dart';

import 'package:admin_dashboard/api/cafe_api.dart';
import 'package:admin_dashboard/models/category.dart';
import 'package:admin_dashboard/models/http/categories_response.dart';


class CategoriesProvider extends ChangeNotifier{

  List<Categoria> categories = [];
  
  getCategories() async {
    final resp = await CafeApi.httpGet('/categorias');
    final categoriesResp = CategoriesResponse.fromMap(resp);

    categories = [...categoriesResp.categorias];    
    notifyListeners();
  }

  Future newCategory(String name) async {
    final data = {
      'nombre': name
    };
    try {
      final json = await CafeApi.httpPost('/categorias',data);
      final newCategory = Categoria.fromMap(json);
      categories.add(newCategory);
      notifyListeners();
    }catch (e){
      throw('Error alta categoría - error : $e');
      //NotificationsService.showSnackbarError('Error alta categoría - error : $e');
    }
  }


  Future updateCategory(String id, String name) async {
    final data = {
      'nombre': name
    };
    try {
      await CafeApi.httpPut('/categorias/$id',data);
      categories = categories.map(
        (category) {
          if (category.uid != id) return category;
          category.nombre = name;
          return category;
        }
      ).toList();
      notifyListeners();
    }catch (e){
      throw('Error update categoría - error : $e');
      //NotificationsService.showSnackbarError('Error update categoría - error : $e');
    }
  }

  Future deleteCategory(String id) async {

    try {
      await CafeApi.httpDelete('/categorias/$id',{});
      
      categories.removeWhere((category) => category.uid == id);
      notifyListeners();
    }catch (e){
      throw('Error borrado categoría - error : $e');
      //NotificationsService.showSnackbarError('Error delete categoría - error : $e');
    }
  }
}