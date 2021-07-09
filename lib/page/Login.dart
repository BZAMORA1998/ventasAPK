import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:venta/services/autenticacion.dart';

import 'Home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
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
                                child:MyCustomForm()
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

class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<MyCustomForm> {
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
}
