import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:venta/services/autenticacion.dart';

import 'home.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Ventas';
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appTitle,
      home: Scaffold(
        body: Container(
          child:Center(
                    child: SizedBox(
                        width: 300 ,
                        child: Row(
                          children:[
                            Expanded(
                                child:LoginForm()
                            )
                          ]
                        )
                    ),
          )
        ),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  @override
  LoginFormState createState() {
    return LoginFormState();
  }
}

class LoginFormState extends State<LoginForm> {
  var strUsuario=TextEditingController();
  var strPassword=TextEditingController();
  Autenticacion _autenticacion=new Autenticacion();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: Text("Sistema de Ventas",style: TextStyle(fontSize: 30,color: Colors.blue))
        ),
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: Text("Inicie Sesión",style: TextStyle(fontSize: 30,color: Colors.blue))
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: TextFormField(
            keyboardType:TextInputType.text,
            style: TextStyle(fontSize: 19),
            decoration: InputDecoration(
              labelText: "Ingrese su usuario",
              prefixIcon: Icon(Icons.person),
              border:OutlineInputBorder(
                borderRadius: BorderRadius.circular(25.0),
                borderSide: BorderSide(
                )
              )

            ),
            controller: strUsuario,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: TextFormField(
            keyboardType:TextInputType.text,
            style: TextStyle(fontSize: 19),
            decoration: InputDecoration(
                labelText: "Ingrese su Contraseña",
                prefixIcon: Icon(Icons.password),
                border:OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: BorderSide(
                    )
                )

            ),
            controller: strPassword,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: MaterialButton(
            minWidth: 300,
            height: 60,
            color: Colors.blue,
            child:Text("Iniciar Sesión", style: TextStyle(fontSize: 20,color: Colors.white)),
            onPressed: () async {
              var json = await this._autenticacion.postAutenticacion(strUsuario.text,strPassword.text);
              Map<String, dynamic> data = jsonDecode(json);
              if(data['code'] as int ==200){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Home()),
                );
              }else{
                _showMyDialog(data['message']);
              }
            },

          ),
        ),
      ],
    );
  }

  postAutenticacion(String strUsuario,String strPassword) async {
    // var json = await this._autenticacion.postAutenticacion(strUsuario,strPassword);
    // Map<String, dynamic> data = jsonDecode(json);
    // print(data['data']);
  }

  Future<void> _showMyDialog(String strMessage) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Alerta'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(strMessage),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('cerrar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
