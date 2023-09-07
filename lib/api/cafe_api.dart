// ignore_for_file: prefer_final_fields

import 'package:admin_dashboard/services/local_storage.dart';
import 'package:dio/dio.dart';

class CafeApi{
  static Dio _dio = Dio();

  static void configureDio(){
    //base del url
    _dio.options.baseUrl = 'http://localhost:8080/api';

    //headers
    _dio.options.headers = {'x-token': LocalStorage.prefs.getString('token') ?? ''};
  }

  static Future httpGet (String path) async {
    try {
      final resp = await _dio.get(path);
      return resp.data;
    } catch (e) {
      throw('Error en el GET - Dio');
    }
  }

  static Future httpPost (String path, Map<String, dynamic> data) async {
    final formData = FormData.fromMap(data);
    try {
      final resp = await _dio.post(path, data: formData);
      return resp.data;
    } catch (e) {
      throw('Error en el POST - Dio');
    }
  }

  static Future httpPut (String path, Map<String, dynamic> data) async {
    final formData = FormData.fromMap(data);
    try {
      final resp = await _dio.put(path, data: formData);
      return resp.data;
    } catch (e) {
      throw('Error en el PUT - Dio');
    }
  }

  static Future httpDelete (String path, Map<String, dynamic> data) async {
    final formData = FormData.fromMap(data);
    try {
      final resp = await _dio.delete(path, data: formData);
      return resp.data;
    } catch (e) {
      throw('Error en el Delete - Dio');
    }
  }
}