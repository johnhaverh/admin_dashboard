import 'package:flutter/material.dart';

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
}