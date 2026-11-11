//GRUPO 2

// Leonardo Coronel
// Mateo Navas
// Isak Gómez
// Paola Narváez
// David Cocha
// Esteven Viracocha

// ============================================================
// EVALUACIÓN PRÁCTICA DE DART · PLANTILLA DEL GRUPO
// Reto: "Cafetería UNIBE Express" (lógica de una app de pedidos)
// Grupo N.º: 2   Integrantes: Leonardo Coronel, Mateo Navas, Isak Gómez, Paola Narváez, David Cocha, Esteven Viracocha
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
// La funcion registra el pedido y actualiza el stock y los clientes.
String registrarPedido({
  required String cliente,
  required String producto,
  required Set<String> clientes,
  required Map<String, int> stock,
  required Map<String, double> menu,
  required bool abierta,
  int cantidad = 1,
  bool esEstudiante = false,
}) {
  //   1) Cafetería cerrada  -> 'RECHAZADO: la cafetería está cerrada.'
  if (!abierta) {
    return 'Rechazado: La cafetería está cerrada.';
  }

  //   2) Producto fuera del menú -> 'RECHAZADO: "X" no existe en el menú.'
  if (!menu.containsKey(producto)) {
    return 'Rechazado: $producto no existe en el menú.';
  }

  //   3) Stock insuficiente -> 'RECHAZADO: solo quedan N de X.'
  final disponible = stock[producto] ?? 0;
  if (disponible < cantidad) {
    return 'Rechazado: Solo quedan $disponible de $producto.';
  }

  //   4) Válido -> descontar stock, añadir cliente al Set y devolver
  stock[producto] = disponible - cantidad;
  clientes.add(cliente);
  final total = calcularTotal(
    precio: menu[producto]!,
    cantidad: cantidad,
    esEstudiante: esEstudiante,
  );

  //      'APROBADO: ... Total: $...' (usen calcularTotal)
  return 'Aprobado: $cliente pidió $cantidad X $producto. Total: \$${total.toStringAsFixed(2)}';
}

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

  print('\n--- PARTE A ---');
  mostrarEncabezado(nombreCafeteria, cafeteriaAbierta);
  print('');

  print('Nombre: $nombreCafeteria');
  print('Abierta: $cafeteriaAbierta');
  print('Pedidos maximos por hora: $pedidosMaximosPorHora');

  /*
   String: Guarda cadenas de texto, utilizamos por ejemplo en el nombre de la universidad.
   int: Guarda numeros enteros, utilizamos para el numero maximo de pedidos.
   double: Guarda numeros decimales, por ejemplo para los precios de los pedidos.
   bool: Guarda un valor de verdadero o falso, si esta abierta o no la cafeteria.
 */

  // ---------- PARTE B · COLECCIONES ----------
  // TODO B1: muestren los pedidos del día numerados (1. Café, 2. Empanada...).
  // TODO B2: impriman el precio del Café leyendo el Map menu.
  // TODO B3: impriman cuántos pedidos hay en la lista.
  // TODO B4: impriman cuántos productos DISTINTOS se pidieron (pista: toSet()).
  // TODO B5: impriman cuántos clientes únicos hay en el Set.
  // TODO B6: añadan 'Pedro' y 'Ana' al Set e impriman el tamaño. ¿Por qué solo sube 1?

  print('\n--- PARTE B ---');

  // TODO B1: muestren los pedidos del día numerados (1. Café, 2. Empanada...).
  for (int i = 0; i < pedidosDelDia.length; i++) {
    print('${i + 1}. ${pedidosDelDia[i]}');
  }

  // TODO B2: impriman el precio del Café leyendo el Map menu.
  print('Precio del Café: \$${menu['Café']}');

  // TODO B3: impriman cuántos pedidos hay en la lista.
  print('Pedidos del día: ${pedidosDelDia.length}');

  // TODO B4: impriman cuántos productos DISTINTOS se pidieron (pista: toSet()).
  print('Productos distintos: ${pedidosDelDia.toSet().length}');

  // TODO B5: impriman cuántos clientes únicos hay en el Set.
  print('Clientes únicos: ${clientes.length}');

  // TODO B6: añadan 'Pedro' y 'Ana' al Set e impriman el tamaño. ¿Por qué solo sube 1?
  clientes.add('Pedro');
  clientes.add('Ana');
  print('Tamaño del Set tras añadir Pedro y Ana: ${clientes.length}');
  // Solo sube 1 porque los Set no admiten duplicados: 'Ana' ya estaba en el Set.

  // ---------- PARTE C · PRUEBAS DE FUNCIONES ----------
  // TODO: prueben obtenerPrecio con 'Empanada' y con 'Pizza'.
  // TODO: prueben hayStock con 'Café' y con 'Jugo natural'.
  // TODO: prueben calcularTotal SIN esEstudiante (3 cafés) y CON esEstudiante (2 sánduches).
  // TODO: prueben crearTicket sin cantidad y con cantidad: 3.

  print('\n--- PARTE C ---');

  // C1 se prueba en la parte A.

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
  print(
    'Total 2 sanduches con descuento: \$${totalSanduche.toStringAsFixed(2)}',
  );

  // C5: Crear tickets
  print(crearTicket(cliente: 'Luis', producto: 'Café'));

  print(crearTicket(cliente: 'Ana', producto: 'Empanada', cantidad: 3));

  // ---------- PARTE D · ITERABLES ----------
  // TODO D1: Iterable<String> con los productos del menú que cuestan menos de $2 (where). Muéstrenlo con toList().
  // TODO D2: cuenten cuántas veces se pidió 'Café' (where + length).
  // TODO D3: List<String> con los productos agotados (stock == 0).
  // TODO D4: con map, creen la carta 'Café: $1.25' para cada producto y muéstrenla.

  print('\n--- PARTE D ---');

  // D1: Productos que cuestan menos de $2

  Iterable<String> economicos = menu.entries
      .where((e) => e.value < 2.0)
      .map((e) => e.key);

  print('Productos de menos de \$2: ${economicos.toList()}');

  // D2: Contar cuántas veces se pidió Café

  int vecesCafe = pedidosDelDia.where((p) => p == 'Café').length;

  print('Veces que se pidió Café: $vecesCafe');

  // D3: Productos agotados

  List<String> agotados = stock.entries
      .where((e) => e.value == 0)
      .map((e) => e.key)
      .toList();

  print('Productos agotados: $agotados');

  // D4: Crear la carta de productos y precios

  List<String> carta = menu.entries
      .map((e) => '  ${e.key}: \$${e.value.toStringAsFixed(2)}')
      .toList();

  print('--- CARTA DE LA CAFETERÍA ---');

  for (String linea in carta) {
    print(linea);
  }

  // ---------- PARTE E · PRUEBAS DE registrarPedido ----------
  // TODO: ejecuten los 6 casos de prueba de la hoja y anoten el resultado real.

  print('\n--- PARTE E ---');
  print(
    'P1: ${registrarPedido(cliente: 'Sofía', producto: 'Café', cantidad: 2, esEstudiante: true, clientes: clientes, stock: stock, menu: menu, abierta: true)}',
  );

  // Segundo caso de prueba
  print(
    'P2: ${registrarPedido(cliente: 'Ana', producto: 'Empanada', clientes: clientes, stock: stock, menu: menu, abierta: true)}',
  );

  // Tercer caso de prueba
  print(
    'P3: ${registrarPedido(cliente: 'Luis', producto: 'Jugo natural', clientes: clientes, stock: stock, menu: menu, abierta: true)}',
  );

  // Cuarto caso de prueba
  print(
    'P4: ${registrarPedido(cliente: 'Luis', producto: 'Pizza', clientes: clientes, stock: stock, menu: menu, abierta: true)}',
  );

  // Quinto caso de prueba
  print(
    'P5: ${registrarPedido(cliente: 'Marta', producto: 'Café', clientes: clientes, stock: stock, menu: menu, abierta: false)}',
  );

  // Sexto caso de prueba
  print(
    'P6: ${registrarPedido(cliente: 'Carlos', producto: 'Ensalada de frutas', cantidad: 6, clientes: clientes, stock: stock, menu: menu, abierta: true)}',
  );

  // ---------- BONO (+5) ----------
  // TODO: double calcularVentasDelDia(List<String> pedidos, Map<String, double> menu)
  // (La función está escrita fuera de main, al final del archivo.)

  print('\n--- BONO ---');
  print(
    'Ventas del día: ${calcularVentasDelDia(pedidosDelDia, menu)}',
  ); // 10.75
}

// ---------- BONO (+5) · FUNCIÓN (fuera de main) ----------
double calcularVentasDelDia(List<String> pedidos, Map<String, double> menu) {
  double ventas = 0.0;
  for (String pedido in pedidos) {
    ventas += menu[pedido] ?? 0.0;
  }
  return ventas;
}

/*
Preguntas breves

1. Los parametros posicionales se envian en el orden indicado. Los nombrados
   se pasan con su nombre y pueden ir en otro orden. required obliga a enviar
   ese parametro al llamar la funcion.

2. El operador ?? devuelve el precio si existe. Cuando el producto no esta
   en el menu, devuelve 0.0. Sin ??, menu[producto] podria devolver null y
   no se podria retornar directamente como double.

3. Usamos Set para que cada cliente se guarde una sola vez. Usamos List para
   los pedidos porque pueden repetirse y necesitamos mantener su orden.
*/
