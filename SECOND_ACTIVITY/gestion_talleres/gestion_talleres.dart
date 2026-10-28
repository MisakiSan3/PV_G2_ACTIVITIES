// gestion_talleres.dart
// Reto grupal - UNIBE Ecuador · Aplicaciones móviles con Flutter
// Programa de consola integrado (Actividades A-F).
// Ejecutar con: dart run gestion_talleres.dart

// ===========================================================================
// FUNCIONES
// ===========================================================================

// ---------------------------------------------------------------------------
// Actividad C — Funciones y parámetros
// ---------------------------------------------------------------------------

/// No devuelve valor (void): solo imprime.
void mostrarEncabezado(String universidad) {
  print('--- Talleres de $universidad ---');
}

/// Devuelve el cupo del taller, o 0 si el taller no existe.
int obtenerCupo(
  Map<String, int> cupos,
  String nombreTaller,
) {
  return cupos[nombreTaller] ?? 0;
}

/// Devuelve true solo si hay inscripciones abiertas Y cupos disponibles.
bool puedeInscribirse(bool inscripcionesAbiertas, int cuposDisponibles) {
  return inscripcionesAbiertas && cuposDisponibles > 0;
}

/// Parámetros nombrados: taller y cupos son obligatorios (required);
/// incluirDetalle es opcional y vale true por defecto.
String crearResumen({
  required String taller,
  required int cupos,
  bool incluirDetalle = true,
}) {
  if (incluirDetalle) {
    return 'Taller: $taller | Cupos disponibles: $cupos';
  }
  return taller;
}

// ---------------------------------------------------------------------------
// Actividad E — Regla de negocio
// ---------------------------------------------------------------------------

/// Intenta registrar a [nombre] en el Set [participantes].
/// Rechaza si: el nombre está vacío, las inscripciones están cerradas,
/// no hay cupos disponibles o la persona ya está registrada.
/// Si todo es válido, la agrega al Set y devuelve un mensaje explicativo.
String registrarParticipante(
  String nombre,
  Set<String> participantes,
  bool inscripcionesAbiertas,
  int cuposDisponibles,
) {
  final nombreLimpio = nombre.trim();

  if (nombreLimpio.isEmpty) {
    return 'Rechazado: el nombre no puede estar vacío.';
  }
  if (!inscripcionesAbiertas) {
    return 'Rechazado: las inscripciones están cerradas.';
  }
  if (cuposDisponibles <= 0) {
    return 'Rechazado: no hay cupos disponibles.';
  }
  if (participantes.contains(nombreLimpio)) {
    return 'Rechazado: $nombreLimpio ya está registrado/a.';
  }

  participantes.add(nombreLimpio);
  return 'Éxito: $nombreLimpio fue registrado/a. '
      'Total de participantes: ${participantes.length}.';
}

// ---------------------------------------------------------------------------
// Utilidad para las pruebas (Actividad F)
// ---------------------------------------------------------------------------

int _pruebasOk = 0;
int _pruebasTotal = 0;

void probar(int numero, String caso, Object esperado, Object real) {
  _pruebasTotal++;
  final ok = esperado == real;
  if (ok) _pruebasOk++;
  print('Prueba $numero | $caso');
  print('   Esperado: $esperado');
  print('   Real:     $real');
  print('   Resultado: ${ok ? "OK" : "FALLÓ"}');
}

// ===========================================================================
// PROGRAMA PRINCIPAL
// ===========================================================================

void main() {
  // =========================================================================
  // Datos iniciales obligatorios (sección 3 de la guía)
  // =========================================================================
  List<String> talleres = [
    'Flutter inicial',
    'Dart desde cero',
    'Diseño UX',
    'Flutter inicial', // repetido a propósito: List permite duplicados
  ];

  Map<String, int> cuposPorTaller = {
    'Flutter inicial': 20,
    'Dart desde cero': 25,
    'Diseño UX': 15,
  };

  // ignore: equal_elements_in_set
  Set<String> participantesRegistrados = {
    'Ana',
    'Luis',
    'Marta',
    'Ana', // repetido a propósito: Set conserva solo valores únicos
  };

  bool inscripcionesAbiertas = true;
  String nombreUniversidad = 'UNIBE';

  // =========================================================================
  // Actividad A — Variables y tipos
  // =========================================================================
  String universidad = nombreUniversidad;
  String tallerSeleccionado = 'Flutter inicial';
  int cupos = cuposPorTaller[tallerSeleccionado] ?? 0;
  bool abiertas = inscripcionesAbiertas;

  mostrarEncabezado(nombreUniversidad);
  print('');
  print('--- Actividad A: Variables y tipos ---');
  print('Universidad (String): $universidad');
  print('Taller (String): $tallerSeleccionado');
  print('Cupo del taller (int): $cupos');
  print('Inscripciones abiertas (bool): $abiertas');
  print('¿Qué representa cada tipo?');
  print('  String -> texto: aquí, el nombre de la universidad y del taller.');
  print('  int    -> número entero: aquí, la cantidad de cupos del taller.');
  print('  bool   -> verdadero o falso: aquí, si las inscripciones están abiertas.');

  // =========================================================================
  // Actividad B — List, Map y Set
  // =========================================================================
  print('');
  print('--- Actividad B: List, Map y Set ---');
  print('Talleres almacenados en la lista:');
  for (final taller in talleres) {
    print('  - $taller');
  }
  print('Cupo de Flutter inicial (Map): ${cuposPorTaller['Flutter inicial']}');
  print('Cantidad de talleres en la lista: ${talleres.length}');
  print('Participantes únicos en el Set: ${participantesRegistrados.length}');
  print('¿Por qué la List tiene repetidos y el Set no?');
  print('  La List guarda cada elemento en su posición, aunque se repita '
      '(por eso "Flutter inicial" aparece 2 veces).');
  print('  El Set solo guarda valores únicos y descarta los que ya contiene '
      '(por eso "Ana" cuenta 1 sola vez).');

  // =========================================================================
  // Actividad C — Funciones y parámetros
  // =========================================================================
  print('');
  print('--- Actividad C: Funciones y parámetros ---');
  print('Cupo de "Flutter inicial": '
      '${obtenerCupo(cuposPorTaller, 'Flutter inicial')}');
  print('Cupo de "Robótica" (no existe): '
      '${obtenerCupo(cuposPorTaller, 'Robótica')}');
  print('Abiertas=true,  cupos=5 -> ${puedeInscribirse(true, 5)}');
  print('Abiertas=true,  cupos=0 -> ${puedeInscribirse(true, 0)}');
  print('Abiertas=false, cupos=5 -> ${puedeInscribirse(false, 5)}');
  print('Abiertas=false, cupos=0 -> ${puedeInscribirse(false, 0)}');
  print(crearResumen(taller: 'Dart desde cero', cupos: 25));
  print(crearResumen(taller: 'Dart desde cero', cupos: 25, incluirDetalle: false));
  print('Devuelven valor: obtenerCupo, puedeInscribirse y crearResumen; '
      'mostrarEncabezado es void.');
  print('Posicional: se identifica por su orden. Nombrado: va entre {} y se '
      'pasa con su nombre. required obliga a pasar el parámetro nombrado.');

  // =========================================================================
  // Actividad D — Iterables y filtrado
  // =========================================================================
  print('');
  print('--- Actividad D: Iterables y filtrado ---');
  Iterable<String> talleresFlutter =
      talleres.where((taller) => taller.contains('Flutter'));
  List<String> resultado = talleresFlutter.toList();
  print('Talleres que contienen "Flutter": $resultado');
  print('Cantidad de resultados (Flutter): ${resultado.length}');

  Iterable<String> talleresLargos =
      talleres.where((taller) => taller.length > 10);
  List<String> resultadoLargos = talleresLargos.toList();
  print('Talleres con más de 10 caracteres: $resultadoLargos');
  print('Cantidad de resultados (más de 10 caracteres): ${resultadoLargos.length}');
  print('where conserva solo los elementos que cumplen la condición y devuelve '
      'un Iterable<String> (se calcula al recorrerlo o al usar toList()).');
  print('La variable puede ser Iterable<String> porque where devuelve un '
      'Iterable, no una List; List es un tipo de Iterable.');

  // =========================================================================
  // Actividad E — Regla de negocio
  // =========================================================================
  print('');
  print('--- Actividad E: Regla de negocio ---');
  int cuposFlutter = obtenerCupo(cuposPorTaller, 'Flutter inicial');
  print(registrarParticipante(
      'Carlos', participantesRegistrados, inscripcionesAbiertas, cuposFlutter));
  print(registrarParticipante(
      'Ana', participantesRegistrados, inscripcionesAbiertas, cuposFlutter));
  print(registrarParticipante(
      'Sofía', participantesRegistrados, false, cuposFlutter));
  print(registrarParticipante(
      'Pedro', participantesRegistrados, inscripcionesAbiertas, 0));
  print('Participantes al final: $participantesRegistrados');

  // =========================================================================
  // Actividad F — Pruebas (esperado vs real)
  // =========================================================================
  print('');
  print('--- Actividad F: Casos de prueba ---');

  // Copia del Set para que las pruebas no alteren los datos anteriores.
  final participantesPrueba = <String>{'Ana', 'Luis', 'Marta'};

  probar(1, 'Consultar taller existente (Flutter inicial)', 20,
      obtenerCupo(cuposPorTaller, 'Flutter inicial'));

  probar(2, 'Consultar taller inexistente (Robótica)', 0,
      obtenerCupo(cuposPorTaller, 'Robótica'));

  probar(3, 'Inscripción habilitada (abiertas=true, cupos=5)', true,
      puedeInscribirse(true, 5));

  probar(4, 'Inscripción sin cupos (abiertas=true, cupos=0)', false,
      puedeInscribirse(true, 0));

  probar(5, 'Inscripción cerrada (abiertas=false, cupos=5)', false,
      puedeInscribirse(false, 5));

  final tamanoAntes = participantesPrueba.length;
  registrarParticipante('Ana', participantesPrueba, true, 5);
  probar(6, 'Participante duplicado (Ana) no aumenta el Set', tamanoAntes,
      participantesPrueba.length);

  probar(7, 'Filtro de talleres que contienen "Flutter"', 2,
      talleres.where((t) => t.contains('Flutter')).length);

  registrarParticipante('Daniela', participantesPrueba, true, 5);
  probar(8, 'Registro válido (Daniela) aumenta el Set en 1', tamanoAntes + 1,
      participantesPrueba.length);

  print('');
  print('Resumen: $_pruebasOk de $_pruebasTotal pruebas correctas.');
}