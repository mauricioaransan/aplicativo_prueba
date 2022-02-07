class PuntoVentaTile {
  final String nombre;
  final String codigo;
  final String direccion;
  final double latitud;
  final double longitud;

  PuntoVentaTile(
      this.nombre, this.codigo, this.direccion, this.latitud, this.longitud);
}

List puntosDeVenta = [
  PuntoVentaTile(
      "yosly amali seguilar",
      "409183",
      "real s/n urb: esq. 10 noviembre",
      -12.048050255748237,
      -77.06137405228718),
  PuntoVentaTile("metro colonial", "409184", "av. alfonso ugarte 740",
      -12.053792304279705, -77.04313041852569),
  PuntoVentaTile("tottus zorritos", "409183", "av. colonial 1520",
      -12.048070627627371, -77.05867203776612),
  PuntoVentaTile("plaza vea jockey plaza", "15023",
      "av. javier prado este 4200", -12.084324622182038, -76.97546230696894),
  PuntoVentaTile("tottus atocongo", "15803", "san juan de miraflores",
      -12.147152258026845, -76.98169880404582),
];
