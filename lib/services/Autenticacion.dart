import 'dart:convert';

import 'package:http/http.dart' as http;

class Autenticacion{

  dynamic postAutenticacion(String strUsuario,String strPassword) async {

    String credentials=strUsuario+":"+strPassword;
    Codec<String, String> stringToBase64Url = utf8.fuse(base64Url);
    String encoded = stringToBase64Url.encode(credentials);
    final response =
    await http.post(Uri.parse('https://sistemas-seguridad-api.herokuapp.com/ventas/v1/autenticacion/login'),
      headers: <String, String>{
        'Authorization': "Basic "+encoded,
      },
      body: null
    );
    return response.body;
  }
}