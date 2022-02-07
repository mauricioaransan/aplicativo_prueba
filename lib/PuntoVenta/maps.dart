import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Maps extends StatefulWidget {
  final String nombre;
  final double latitud;
  final double longitud;
  const Maps({
    Key key,
    @required this.latitud,
    @required this.longitud,
    @required this.nombre,
  }) : super(key: key);

  @override
  _MapsState createState() => _MapsState();
}

class _MapsState extends State<Maps> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("${widget.nombre}"),
        ),
        body: Container(
          height: 700,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(75.0)),
          ),
          child: GoogleMap(
            initialCameraPosition: CameraPosition(
                target: LatLng(widget.latitud, widget.longitud), zoom: 16),
            compassEnabled: false,
            markers: _createMarkers(),
            scrollGesturesEnabled: true,
          ),
        ));
  }

  Set<Marker> _createMarkers() {
    var tmp = Set<Marker>();
    tmp.add(Marker(
        markerId: MarkerId("Point"),
        position: LatLng(widget.latitud, widget.longitud)));
    return tmp;
  }
}
