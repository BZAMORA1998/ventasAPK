import 'package:flutter/material.dart';
import 'package:venta/add_user.dart';

void main() {runApp(MyApp());}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return MaterialApp(
      debugShowCheckedModeBanner: false,
     title: "Ventas",
     theme: ThemeData(
       primarySwatch: Colors.blue
     ),
     home: MyHomePage(title:"Home"),
   );
  }
}

class MyHomePage  extends StatelessWidget{

  final String title;

  MyHomePage({ Key? key,required this.title}):super(key: key );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text(title),
        actions: <Widget>[
          IconButton(
            icon:Icon(
              Icons.add,
              color: Colors.white,
            ), onPressed: () {
              Navigator.of(context).push(PageRouteBuilder(pageBuilder: (_,__,___)=>AddUser(title: 'Agregar usuario')));
              },
          )
        ],
      ),
    );
  }
}  

