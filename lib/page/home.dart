import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  HomeFormState createState() {
    return HomeFormState();
  }
}

class HomeFormState extends State<Home> {
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

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Scaffold(
      appBar: AppBar(
        title:  Text('Home'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.arrow_back_rounded),
              onPressed: () {
                Navigator.pop(context);
              }),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child:  Column(
                  children: <Widget>[
                    Image(
                      image: AssetImage('assets/Avatar_Male_4.png'),
                      width: 100,
                      height: 100,
                    ),
                    Container(
                        margin:  const EdgeInsets.only(top: 10),
                        child:Text("Bryan Zamora"))
                ]
              )
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Módulos'),
            ),
            ListTile(
              leading: Icon(Icons.shield),
              title: Text('Seguridad'),
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