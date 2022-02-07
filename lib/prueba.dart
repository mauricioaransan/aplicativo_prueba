import 'package:aplicativo_prueba/Listas/listaPuntoVenta.dart';
import 'package:aplicativo_prueba/PuntoVenta/maps.dart';
import 'package:aplicativo_prueba/PuntoVenta/visitaview.dart';
import 'package:aplicativo_prueba/SearchWidget/searchWidget.dart';
import 'package:flutter/material.dart';

class Prueba extends StatefulWidget {
  const Prueba({Key key}) : super(key: key);

  @override
  _PruebaState createState() => _PruebaState();
}

class _PruebaState extends State<Prueba> {
  String query = '';
  List _allResults = [];

  @override
  void initState() {
    super.initState();
    _allResults = puntosDeVenta;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SearchWidget(
              text: query, onChanged: buscarPuntoVenta, hintText: "Prueba"),
          Container(
            height: 600,
            child: _listaPuntoVenta(context, _allResults),
          )
        ],
      ),
    );
  }

  void buscarPuntoVenta(String value) {
    final puntoVentita = puntosDeVenta.where((puntoven) {
      final nombre = puntoven.nombre.toString().toLowerCase();
      final search = value.toLowerCase();
      return nombre.contains(search);
    }).toList();
    setState(() {
      this.query = value;
      this._allResults = puntoVentita;
    });
  }
}

Widget _listaPuntoVenta(BuildContext contextito, List listin) {
  return ListView.builder(
    itemCount: listin.length,
    itemBuilder: (BuildContext context, int index) =>
        _itemListaPuntoVenta(contextito, listin[index]),
  );
}

Widget _itemListaPuntoVenta(
    BuildContext contextaso, PuntoVentaTile puntoVenta) {
  return Container(
    decoration: BoxDecoration(
      boxShadow: <BoxShadow>[
        BoxShadow(
          color: Colors.grey[200],
          blurRadius: 10.0,
          spreadRadius: 3.0,
          offset: Offset(2, 4),
        )
      ],
    ),
    child: InkWell(
      onTap: () {
        _mostrarAlerta(contextaso, puntoVenta);
      },
      child: Card(
        child: Container(
          child: ListTile(
            leading: InkWell(
              child: Icon(Icons.my_library_add_sharp),
              onTap: () {
                Navigator.push(
                    contextaso,
                    MaterialPageRoute(
                        builder: (context) => Maps(
                            latitud: puntoVenta.latitud,
                            longitud: puntoVenta.longitud,
                            nombre: "${puntoVenta.nombre.toUpperCase()}")));
              },
            ), //COLOCAR IMAGEN GOOGLE MAPS
            title: Text(
              "${puntoVenta.nombre}".toUpperCase(),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            trailing: Icon(Icons.arrow_right),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Código:${puntoVenta.codigo}",
                    style: TextStyle(fontSize: 12)),
                Text("${puntoVenta.direccion}".toUpperCase(),
                    style: TextStyle(fontSize: 12))
              ],
            ),
          ),
        ),
      ),
    ),
  );
}

void _mostrarAlerta(BuildContext context, PuntoVentaTile pv) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          title: Text("${pv.nombre.toUpperCase()}"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("¿Atenderá el PDV?"),
            ],
          ),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("Cancelar")),
            TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Visita(punven: pv)));
                },
                child: Text("Ok")),
          ],
        );
      });
}
