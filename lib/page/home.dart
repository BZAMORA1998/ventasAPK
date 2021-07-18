import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:venta/page/login.dart';

class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final children = <Widget>[];
    for (var i = 0; i < 2; i++) {
      children.add(new ModuloForm(nombre: "Seguridad",img: "assets/ventas.png"));
    }

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Home",
        home:Scaffold(
          appBar: AppBar(
            title: Text('Home'),
            leading: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Login()),
                );
              },
              icon: Icon(Icons.keyboard_backspace ),
            )
          ),
          body:  ListView(
                        children: children,
          )
        )
    );
  }
}

class ModuloForm extends StatefulWidget {

  final String nombre;
  final String img;

  const ModuloForm ({ Key? key, required this.nombre ,required this.img}): super(key: key);

  @override
  ModuloFormState createState() {
    return ModuloFormState();
  }
}

class ModuloFormState extends State<ModuloForm>{

  @override
  Widget build(BuildContext context) {
    return  Center(
        child: Container(
          margin: const EdgeInsets.only(top: 50.0),
          width: 100,
          height: 100,
          decoration: BoxDecoration(
              border: Border.all(
                color: Colors.blue,
                style: BorderStyle.solid,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(10)
          ),
          child: ListView(
            children: [
              Container(
                height: 30,
                decoration: BoxDecoration(
                  border: Border(
                      bottom:BorderSide(
                        color: Colors.blue,
                        style: BorderStyle.solid,
                        width: 1.0,
                      )
                  ),
                ),
                child: Align( alignment: Alignment.center,child:Text(widget.nombre)),
              ),
              Center(
                  child:Container(
                      height: 70,
                      child: Image(image: AssetImage(widget.img),
                        width: 40,
                        height: 40,
                      )
                  )
              )
            ],
          )
        )
    );
  }
 
}