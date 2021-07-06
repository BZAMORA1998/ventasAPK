import 'package:flutter/material.dart';

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
        title: Text(title)
      )
    );
  }
}  

