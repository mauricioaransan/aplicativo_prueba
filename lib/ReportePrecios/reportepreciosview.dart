import 'package:flutter/material.dart';

import 'package:aplicativo_prueba/Listas/listaProductos.dart';
import 'package:aplicativo_prueba/PuntoVenta/puntoVentaView.dart';
import 'package:aplicativo_prueba/ReportePrecios/editar.dart';
import 'package:aplicativo_prueba/SearchWidget/searchWidget.dart';

class ReportePrecios extends StatefulWidget {
  final String nombre;
  const ReportePrecios({
    Key key,
    @required this.nombre,
  }) : super(key: key);

  @override
  _ReportePreciosState createState() => _ReportePreciosState();
}

class _ReportePreciosState extends State<ReportePrecios> {
  String query = '';
  List _allResults = [];

  @override
  void initState() {
    super.initState();
    _allResults = listaProductos;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("metro alfonso ugarte".toUpperCase()),
        actions: [
          IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                Navigator.pop(context,
                    MaterialPageRoute(builder: (context) => PuntoVenta()));
              })
        ],
      ),
      body: ListView(
        children: [
          SizedBox(height: 15),
          Align(
            alignment: Alignment.center,
            child: Text(
              "Reporte Precios",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
          ),
          SearchWidget(
              text: query, onChanged: buscarProducto, hintText: "Buscar"),
          _cabecera(context),
          Container(height: 600, child: _productos(context, _allResults))
        ],
      ),
    );
  }

  void buscarProducto(String value) {
    final listaProd = listaProductos.where((puntoven) {
      final nombre = puntoven.nombre.toString().toLowerCase();
      final search = value.toLowerCase();
      return nombre.contains(search);
    }).toList();
    setState(() {
      this.query = value;
      this._allResults = listaProd;
    });
  }
}

Widget _cabecera(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      _cabeceraItem(context, "Productos", 2),
      _cabeceraItem(context, "P. Costo", 1),
      _cabeceraItem(context, "P. Mayor", 1),
      _cabeceraItem(context, "Stock", 1),
    ],
  );
}

Widget _cabeceraItem(BuildContext context, String titulo, int multip) {
  return Container(
    color: Colors.grey[300],
    width: MediaQuery.of(context).size.width / 5.3 * multip,
    height: 30,
    child: Center(
      child: Text(
        titulo,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    ),
  );
}

Widget _productos(BuildContext context, List listita) {
  return ListView.builder(
      itemCount: listita.length,
      itemBuilder: (BuildContext context, int index) =>
          _producotsCont(context, listita[index]));
}

Widget _producotsCont(BuildContext context, Productos lista) {
  return InkWell(
    onTap: () {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => Editar(producto: lista)));
    },
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        __productosItem(context, "${lista.nombre.toUpperCase()}", 2),
        __productosItem(context, "${lista.preciocosto}", 1),
        __productosItem(context, "${lista.preciomayor}", 1),
        __productosItem(context, "${lista.stock}", 1),
      ],
    ),
  );
}

Widget __productosItem(BuildContext context, String titulo, int multip) {
  return Container(
    color: Colors.grey[200],
    width: MediaQuery.of(context).size.width / 5.3 * multip,
    height: 30,
    child: Center(
      child: Text(
        titulo,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    ),
  );
}
