import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Home",
        home:Scaffold(
          appBar: AppBar(
              title: Text("Home")
          ),
          body: null
        )
    );
  }

}