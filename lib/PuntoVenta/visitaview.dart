import 'dart:io';

import 'package:aplicativo_prueba/Listas/listaPuntoVenta.dart';
import 'package:aplicativo_prueba/ReportePrecios/reportepreciosview.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Visita extends StatefulWidget {
  final PuntoVentaTile punven;
  const Visita({
    Key key,
    @required this.punven,
  }) : super(key: key);

  @override
  _VisitaState createState() => _VisitaState();
}

class _VisitaState extends State<Visita> {
  File _selectedPicture;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Visita"),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: 800,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Text(
                  "${widget.punven.nombre}".toUpperCase(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
                SizedBox(height: 10),
                Text("${widget.punven.direccion}".toUpperCase()),
                SizedBox(height: 30),
              ],
            ),
            InkWell(
              onTap: () async {
                var image =
                    await ImagePicker.pickImage(source: ImageSource.gallery);
                setState(() {
                  _selectedPicture = image;
                });
              },
              child: Container(
                width: MediaQuery.of(context).size.width / 2,
                height: MediaQuery.of(context).size.width / 2,
                color: Colors.grey[300],
                child: Icon(
                  Icons.photo_camera,
                  size: 30,
                  color: Colors.grey[600],
                ),
              ),
            ),
            (_selectedPicture != null)
                ? Container(
                    width: MediaQuery.of(context).size.width / 2,
                    height: MediaQuery.of(context).size.width / 2,
                    child: Image.file(_selectedPicture),
                  )
                : SizedBox(
                    height: 1,
                  ),
            InkWell(
              child: Container(
                height: 40,
                width: MediaQuery.of(context).size.width / 1.5,
                color: Colors.pink[500],
                child: Center(
                    child: Text(
                  "visitar".toUpperCase(),
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                )),
              ),
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            ReportePrecios(nombre: "${widget.punven.nombre}")));
              },
            )
          ],
        ),
      ),
    );
  }
}
