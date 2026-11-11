// ============================================================
// EVALUACIÓN PRÁCTICA DE DART · PLANTILLA DEL GRUPO
// Reto: "Cafetería UNIBE Express" (lógica de una app de pedidos)
// Grupo N.º: ____   Integrantes: ______________________________
// Ejecuten en DartPad (modo Dart): https://dartpad.dev
// Completen cada TODO. NO borren los datos iniciales.
// ============================================================

// ---------- PARTE C · FUNCIONES (escríbanlas aquí, fuera de main) ----------

// TODO C1: void mostrarEncabezado(String nombre, bool abierta)
//   Imprime: === Cafetería UNIBE | ABIERTA ===  (o CERRADA si abierta es false)

// TODO C2: double obtenerPrecio(Map<String, double> menu, String producto)
//   Devuelve el precio del producto. Si no existe, devuelve 0.0 (usen ??).

// TODO C3: bool hayStock(Map<String, int> stock, String producto)
//   Devuelve true si quedan unidades (> 0). Si el producto no existe, false.

// TODO C4: double calcularTotal({required double precio, required int cantidad, bool esEstudiante = false})
//   total = precio * cantidad. Si esEstudiante es true, aplica 10 % de descuento.

// TODO C5: String crearTicket({required String cliente, required String producto, int cantidad = 1})
//   Devuelve: 'Ticket -> Luis: 1 x Café'

// C1: Mostrar el encabezado de la cafeteria
void mostrarEncabezado(String nombre, bool abierta) {
  String estado = abierta ? 'ABIERTA' : 'CERRADA';
  print('=== $nombre | $estado ===');
}

// C2: Obtener el precio de un producto
double obtenerPrecio(Map<String, double> menu, String producto) {
  return menu[producto] ?? 0.0;
}

// C3: Comprobar si un producto tiene stock
bool hayStock(Map<String, int> stock, String producto) {
  return (stock[producto] ?? 0) > 0;
}

// C4: Calcular el total de una compra
double calcularTotal({
  required double precio,
  required int cantidad,
  bool esEstudiante = false,
}) {
  double total = precio * cantidad;

  if (esEstudiante) {
    total = total * 0.90;
  }

  return total;
}

// C5: Crear el ticket de una compra
String crearTicket({
  required String cliente,
  required String producto,
  int cantidad = 1,
}) {
  return 'Ticket -> $cliente: $cantidad x $producto';
}

// ---------- PARTE E · REGLA DE NEGOCIO ----------
// TODO E: String registrarPedido({...})  (ver la hoja de la evaluación)
//   1) Cafetería cerrada  -> 'RECHAZADO: la cafetería está cerrada.'
//   2) Producto fuera del menú -> 'RECHAZADO: "X" no existe en el menú.'
//   3) Stock insuficiente -> 'RECHAZADO: solo quedan N de X.'
//   4) Válido -> descontar stock, añadir cliente al Set y devolver
//      'APROBADO: ... Total: $...' (usen calcularTotal)

void main() {
  // ---------- DATOS INICIALES (obligatorios, no los borren) ----------
  String nombreCafeteria = 'Cafetería UNIBE';
  bool cafeteriaAbierta = true;
  int pedidosMaximosPorHora = 30;

  List<String> pedidosDelDia = [
    'Café',
    'Empanada',
    'Jugo natural',
    'Café',
    'Sánduche de pollo',
    'Café',
  ];

  Map<String, double> menu = {
    'Café': 1.25,
    'Empanada': 1.50,
    'Jugo natural': 2.00,
    'Sánduche de pollo': 3.50,
    'Ensalada de frutas': 2.75,
  };

  Map<String, int> stock = {
    'Café': 40,
    'Empanada': 12,
    'Jugo natural': 0,
    'Sánduche de pollo': 8,
    'Ensalada de frutas': 5,
  };

  // Ojo: 'Ana' está repetida a propósito. DartPad mostrará un aviso; es normal.
  Set<String> clientes = {'Ana', 'Luis', 'Marta', 'Ana'};

  // ---------- PARTE A · VARIABLES Y TIPOS ----------
  // TODO A1: llamen a mostrarEncabezado(...).
  // TODO A2: impriman nombre, estado y pedidos máximos por hora con interpolación ($variable).
  // TODO A3: en un comentario, expliquen qué guarda String, int, double y bool.

  // ---------- PARTE B · COLECCIONES ----------
  // TODO B1: muestren los pedidos del día numerados (1. Café, 2. Empanada...).
  // TODO B2: impriman el precio del Café leyendo el Map menu.
  // TODO B3: impriman cuántos pedidos hay en la lista.
  // TODO B4: impriman cuántos productos DISTINTOS se pidieron (pista: toSet()).
  // TODO B5: impriman cuántos clientes únicos hay en el Set.
  // TODO B6: añadan 'Pedro' y 'Ana' al Set e impriman el tamaño. ¿Por qué solo sube 1?

  // ---------- PARTE C · PRUEBAS DE FUNCIONES ----------
  // TODO: prueben obtenerPrecio con 'Empanada' y con 'Pizza'.
  // TODO: prueben hayStock con 'Café' y con 'Jugo natural'.
  // TODO: prueben calcularTotal SIN esEstudiante (3 cafés) y CON esEstudiante (2 sánduches).
  // TODO: prueben crearTicket sin cantidad y con cantidad: 3.
  
  // PARTE C - PRUEBAS DE FUNCIONES

  print('\n--- PARTE C ---');

  // C1: Mostrar encabezado
  mostrarEncabezado(nombreCafeteria, cafeteriaAbierta);

  // C2: Probar precios
  print('Precio Empanada: ${obtenerPrecio(menu, 'Empanada')}');
  print('Precio Pizza: ${obtenerPrecio(menu, 'Pizza')}');

  // C3: Probar stock
  print('Hay stock de Cafe: ${hayStock(stock, 'Café')}');
  print('Hay stock de Jugo natural: ${hayStock(stock, 'Jugo natural')}');

  // C4: Calcular el total sin descuento
  double totalCafe = calcularTotal(
    precio: obtenerPrecio(menu, 'Café'),
    cantidad: 3,
  );
  print('Total 3 cafes: \$$totalCafe');

  // C4: Calcular el total con descuento de estudiante
  double totalSanduche = calcularTotal(
    precio: obtenerPrecio(menu, 'Sánduche de pollo'),
    cantidad: 2,
    esEstudiante: true,
  );
  print('Total 2 sanduches con descuento: \$$totalSanduche');

  // C5: Crear tickets
  print(crearTicket(cliente: 'Luis', producto: 'Café'));

  print(crearTicket(
    cliente: 'Ana',
    producto: 'Empanada',
    cantidad: 3,
  ));

  // ---------- PARTE D · ITERABLES ----------
  // TODO D1: Iterable<String> con los productos del menú que cuestan menos de $2 (where). Muéstrenlo con toList().
  // TODO D2: cuenten cuántas veces se pidió 'Café' (where + length).
  // TODO D3: List<String> con los productos agotados (stock == 0).
  // TODO D4: con map, creen la carta 'Café: $1.25' para cada producto y muéstrenla.

  // ---------- PARTE E · PRUEBAS DE registrarPedido ----------
  // TODO: ejecuten los 6 casos de prueba de la hoja y anoten el resultado real.

  // ---------- BONO (+5) ----------
  // TODO: double calcularVentasDelDia(List<String> pedidos, Map<String, double> menu)
}
