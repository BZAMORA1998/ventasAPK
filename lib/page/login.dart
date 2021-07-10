import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:venta/services/autenticacion.dart';
import 'package:venta/util/dialogAlert.dart';
import 'package:venta/util/loading.dart';

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
            margin: const EdgeInsets.only(top:100),
            child: Center(
          child: SizedBox(
              width: 300, child: Row(children: [Expanded(child: LoginForm())])),
        )),
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
  Autenticacion _autenticacion = new Autenticacion();
  DialogAlert _dialogAlert=new DialogAlert();
  Loading _loading=new Loading();
  final   _formKey=GlobalKey<FormState>();

  var strUsuario = TextEditingController();
  var strPassword = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
          Expanded(
              child: Form(
                  key: _formKey,
                  child: ListView (
                      children: <Widget>[

                        Padding(
                              padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                              child: Image(
                                image: AssetImage('assets/ventas.png'),
                                width: 100,
                                height: 100,
                                )

                        ),
                        Align(
                        alignment: Alignment.center,
                        child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 0, vertical: 10),

                            child: Text("Bienvenido",
                                style: TextStyle(fontSize: 20, color: Colors.blue))),
                        ),
                        Align(
                        alignment: Alignment.center,
                        child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 0, vertical: 6),
                            child: Text("Inicie Sesión",
                                style: TextStyle(fontSize: 20, color: Colors.blue)))
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                          child: TextFormField(
                            keyboardType: TextInputType.text,
                            style: TextStyle(fontSize: 19),
                            decoration: InputDecoration(
                                labelText: "Ingrese su usuario",
                                prefixIcon: Icon(Icons.person),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25.0),
                                    borderSide: BorderSide())),
                            controller: strUsuario,
                            validator: (value){
                              if(value!.isEmpty){
                                return "Por favor ingrese su usuario.";
                              }
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                          child: TextFormField(
                              keyboardType: TextInputType.text,
                              style: TextStyle(fontSize: 19),
                              validator: (value){
                                if(value!.isEmpty){
                                  return "Por favor ingrese su contraseña.";
                                }
                              },
                              decoration: InputDecoration(
                                  labelText: "Ingrese su Contraseña",
                                  prefixIcon: Icon(Icons.password),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(25.0),
                                      borderSide: BorderSide())),
                              controller: strPassword,
                              obscureText: true
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                            child: SizedBox(
                              width: 250.0,
                              height: 50.0,
                              child: ElevatedButton(
                                onPressed: ()  async {
                                  if(_formKey.currentState!.validate()) {
                                    _loading.showLoading(context,true);
                                    var json = await postAutenticacion(strUsuario.text, strPassword.text);
                                    Map<String, dynamic> data = jsonDecode(json);
                                    if (data['code'] as int == 200) {
                                      _loading.showLoading(context,false);
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => Home()),
                                      );
                                    } else {
                                      _loading.showLoading(context,false);
                                      _dialogAlert.showAlertDialog(context,data['message']);
                                    }
                                  }
                                },
                                child: Text('Iniciar Sesión'),
                                style: ElevatedButton.styleFrom(
                                  shape: BeveledRectangleBorder(
                                      borderRadius: BorderRadius.circular(12)
                                  ),
                                ),
                              ),
                            )
                        ),Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16,vertical: 10),
                            child:Align(
                                alignment: Alignment.topRight,
                                child: TextButton(
                                    onPressed: () {  },
                                    child: Text("Recuperar Contraseña",
                                        textAlign: TextAlign.end,
                                        style: TextStyle(fontSize: 15)
                                    )
                                )
                            )
                        )
                      ]
                  )
              )
          )
      ]
    );
  }

  postAutenticacion(String strUsuario,String strPassword) async {
    return await this
        ._autenticacion
        .postAutenticacion(strUsuario, strPassword);
  }
}
