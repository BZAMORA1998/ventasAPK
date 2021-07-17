import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:venta/page/login.dart';

class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
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
          body: null
        )
    );
  }

}