import 'package:flutter/material.dart';

import 'package:aplicativo_prueba/Listas/listaProductos.dart';

class Editar extends StatefulWidget {
  final Productos producto;
  const Editar({
    Key key,
    @required this.producto,
  }) : super(key: key);

  @override
  _EditarState createState() => _EditarState();
}

class _EditarState extends State<Editar> {
  TextEditingController contStock;
  TextEditingController contPrecioCosto;
  TextEditingController contPrecioMayor;

  @override
  void initState() {
    super.initState();
    contStock = TextEditingController(text: (widget.producto.stock).toString());
    contPrecioCosto =
        TextEditingController(text: (widget.producto.preciocosto).toString());
    contPrecioMayor =
        TextEditingController(text: (widget.producto.preciomayor).toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("${widget.producto.nombre.toUpperCase()}"),
        ),
        body: Column(
          children: [
            _precioystockTextField(
              contPrecioCosto,
              TextInputType.emailAddress,
              'Precio Costo',
              Icons.monetization_on_outlined,
            ),
            Divider(),
            _precioystockTextField(
              contPrecioMayor,
              TextInputType.text,
              'Precio Mayor',
              Icons.arrow_circle_up,
            ),
            Divider(),
            _precioystockTextField(
              contStock,
              TextInputType.text,
              'stock',
              Icons.lock_open,
            ),
            Divider(),
            InkWell(
              child: Container(
                height: 40,
                width: MediaQuery.of(context).size.width / 1.5,
                decoration: BoxDecoration(
                    color: Colors.pink[500],
                    borderRadius: BorderRadius.circular(20)),
                child: Center(
                    child: Text(
                  "editar".toUpperCase(),
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                )),
              ),
              onTap: () {},
            )
          ],
        ));
  }

  _precioystockTextField(
    TextEditingController control,
    TextInputType tipoTexto,
    String titulo,
    IconData tipoicono1,
  ) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: TextField(
        controller: control,
        keyboardType: tipoTexto,
        decoration: InputDecoration(
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(12.0)),
            icon: Icon(tipoicono1),
            labelText: '$titulo'),
      ),
    );
  }
}
