import 'dart:convert';

import 'package:http/http.dart' as http;

class Autenticacion{

  dynamic postAutenticacion() async {
    final response =
    await http.get(Uri.parse('https://sistema-general-api.herokuapp.com/general/tipoIdentificacion'));
    return response.body;
  }
}