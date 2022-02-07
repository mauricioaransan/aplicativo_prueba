class Productos {
  final String nombre;
  final double preciocosto;
  final double preciomayor;
  final int stock;

  Productos(
    this.nombre,
    this.preciocosto,
    this.preciomayor,
    this.stock,
  );
}

List listaProductos = [
  Productos("jabon bolivar", 12.50, 14.3, 15),
  Productos("papel toalla", 16.45, 18.90, 105),
  Productos("detergente sao", 1.75, 3.21, 79),
  Productos("aceite sao", 24.56, 26.47, 87),
  Productos("fideos", 2.54, 4.21, 324),
  Productos("dentrifico", 3.78, 5.45, 541),
  Productos("shampoo", 3.45, 5.21, 45),
];
