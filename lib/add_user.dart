
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

      ),body: MyStatefulWidget(),
    );
  }
}

/// This is the stateful widget that the main application instantiates.
class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

      ],
    );
  }
}
