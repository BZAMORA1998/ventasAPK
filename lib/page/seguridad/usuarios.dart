import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UsuariosForm extends StatefulWidget {
  @override
  UsuariosFormState createState() {
    return UsuariosFormState();
  }
}

class UsuariosFormState extends State<UsuariosForm> {
  @override
  Widget build(BuildContext context) {
    return MyHomePage(title: "hola");
  }

}


class MyHomePage extends StatefulWidget {
  final String title;

  MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedDestination = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Scaffold(
      appBar: AppBar(
        title:  Text('Seguridad'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: const <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Seguridad',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.message),
              title: Text('Usuarios'),
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Roles'),
            )
          ],
        ),
      ),
      body: Usuarios(),
    );
  }
}

class Usuarios extends StatefulWidget {

  @override
  UsuariosState createState() => UsuariosState();
}

class UsuariosState extends State<Usuarios> {
  int _selectedDestination = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Scaffold(
     body: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Hide the debug banner
        debugShowCheckedModeBanner: false,
        title: 'Kindacode.com',
        theme: ThemeData(
          primarySwatch: Colors.amber,
        ),
        home: HomeScreen());
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DataTableSource _data = MyData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        child:
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:[
                SizedBox(
                  width: 300.0,
                  child: ListView(
                    children: [
                      PaginatedDataTable(
                        source: _data,
                        header: Text('My Products'),
                        columns: [
                          DataColumn(label: Text('ID')),
                          DataColumn(label: Text('Name')),
                          DataColumn(label: Text('Price'))
                        ],
                        columnSpacing: 100,
                        horizontalMargin: 10,
                        rowsPerPage: 8,
                        showCheckboxColumn: true,
                      ),
                    ],
                  ),
                ),
            ]
          )
      )
    );
  }
}

// The "soruce" of the table
class MyData extends DataTableSource {
  // Generate some made-up data
  final List<Map<String, dynamic>> _data = List.generate(
      200,
          (index) => {
        "id": index,
        "title": "Item $index",
        "price": Random().nextInt(10000)
      });

  bool get isRowCountApproximate => false;
  int get rowCount => _data.length;
  int get selectedRowCount => 0;
  DataRow getRow(int index) {
    return DataRow(cells: [
      DataCell(Text(_data[index]['id'].toString())),
      DataCell(Text(_data[index]["title"])),
      DataCell(Text(_data[index]["price"].toString())),
    ]);
  }
}