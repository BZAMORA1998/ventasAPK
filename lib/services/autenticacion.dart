import 'dart:convert';
import 'package:venta/environmentConfig/url.dart';

import 'package:http/http.dart' as http;

class Autenticacion{
  Url _url=new Url();

  /**
   *Usuario inicia sesion
   *
   * @author Bryan Zamora
   * @param strUsuario
   * @param strPassword
   */
  dynamic postAutenticacion(String strUsuario,String strPassword) async {
    String credentials=strUsuario+":"+strPassword;
    Codec<String, String> stringToBase64Url = utf8.fuse(base64Url);
    String encoded = stringToBase64Url.encode(credentials);
    final response =
    await http.post(Uri.parse(_url.SEGURIDAD+'/autenticacion/login'),
      headers: <String, String>{
        'Authorization': "Basic "+encoded,
      },
      body: null
    );
    return response.body;
  }
}