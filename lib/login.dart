import 'package:flutter/material.dart';

void main() =>runApp(Main());

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Scaffold is a layout for
    // the major Material Components.
    return MaterialApp(
      home: Login()
    );
  }
}

class Login extends StatelessWidget {
  Login();

  @override
  Widget build(BuildContext context) {
    // Scaffold is a layout for
    // the major Material Components.
    return Scaffold(
        body: Center(
            child: Text('Hello World')
        )
    );
  }
}
