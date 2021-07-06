
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddUsers extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green
      ),home: AddUser(title:"Registras"),
    );
  }
}

class AddUser  extends StatelessWidget{
  final String title;

  AddUser({ Key? key,required this.title}):super(key: key );

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
            ), onPressed: () {  },
          )
        ],
      ),
    );
  }
}