import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Ventas';
    return MaterialApp(
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
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: Text("Login",
            style: TextStyle(fontSize: 70))
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
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: TextFormField(
            keyboardType:TextInputType.pa,
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
          ),
        ),
        TextButton(
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
          ),
          onPressed: () { },
          child: Text('Iniciar Sesión'),
        )
      ],
    );
  }
}
