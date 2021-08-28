import 'dart:convert';
import 'package:localstorage/localstorage.dart';
import 'package:venta/environmentConfig/url.dart';

import 'package:http/http.dart' as http;

import 'apiService.dart';

class ModulosService {
  ApiService _apiService = new ApiService();

  dynamic getModulos() async {
    final response =
        await _apiService.ApiCallSpring("GET", "/modulos", null, null);
    return response.body;
  }
}
