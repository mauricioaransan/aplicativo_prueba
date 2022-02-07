import 'package:aplicativo_prueba/PuntoVenta/puntoVentaView.dart';
import 'package:aplicativo_prueba/prueba.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  String titles = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(_selectedIndex == 0 ? "Punto de Venta" : "Prueba")),
      drawer: SideNav((index) {
        setState(() {
          _selectedIndex = index;
        });
      }),
      body: Builder(
        builder: (context) {
          if (_selectedIndex == 0) {
            return PuntoVenta();
          }
          if (_selectedIndex == 1) {
            return Prueba();
          }
          return Container();
        },
      ),
    );
  }
}

Widget cabecera() {
  return Column(
    children: [
      Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(50)),
            color: Colors.grey[300]),
        child: Icon(
          Icons.person,
          size: 40,
        ),
      ),
      Text(
        "Antonio Herrera",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 25,
        ),
      ),
      Text("antonioCarrera@gmail.com"),
      Divider(
        color: Colors.black,
        height: 20,
        thickness: 2,
        endIndent: 25,
        indent: 25,
      ),
    ],
  );
}

class SideNav extends StatelessWidget {
  final Function indexSeleccionado;

  SideNav(this.indexSeleccionado);
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          cabecera(),
          paginas(context),
        ],
      ),
    );
  }

  Widget paginas(BuildContext context) {
    return Column(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              title: Text("Punto de Venta"),
              leading: Icon(Icons.location_on),
              onTap: () {
                Navigator.of(context).pop();
                indexSeleccionado(0);
              },
            ),
            ListTile(
              title: Text("Soporte"),
              leading: Icon(Icons.people),
              onTap: () {
                Navigator.of(context).pop();
                indexSeleccionado(1);
              },
            ),
            ListTile(
              title: Text("Cerrar Sesion"),
              leading: Icon(Icons.near_me_disabled_rounded),
              onTap: () {
                Navigator.of(context).pop();
                indexSeleccionado(2);
              },
            ),
          ],
        ),
      ],
    );
  }
}
