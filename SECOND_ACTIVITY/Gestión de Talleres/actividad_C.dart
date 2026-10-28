void mostrarEncabezado(String universidad) {
  print('--- Talleres de $universidad ---');
}


int obtenerCupo(
  Map<String, int> cupos,
  String nombreTaller,
) {
  return cupos[nombreTaller] ?? 0;
}


bool puedeInscribirse(bool inscripcionesAbiertas, int cuposDisponibles) {
  return inscripcionesAbiertas && cuposDisponibles > 0;
}


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

void main() {
  
  Map<String, int> cuposPorTaller = {
    'Flutter inicial': 20,
    'Dart desde cero': 25,
    'Diseño UX': 15,
  };
  String nombreUniversidad = 'UNIBE';

  //  Actividad C 
  
  mostrarEncabezado(nombreUniversidad);
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
  
  print(crearResumen(cupos: 15, taller: 'Diseño UX'));

  
  print('');
  print('Preguntas:');
  print('1) ¿Qué función devuelve un valor?');
  print('   obtenerCupo (int), puedeInscribirse (bool) y crearResumen (String). '
      'mostrarEncabezado es void: solo imprime y no devuelve nada.');
  print('2) ¿Diferencia entre parámetro posicional y nombrado?');
  print('   El posicional se identifica por su orden: obtenerCupo(mapa, taller). '
      'El nombrado va entre llaves {} y se pasa con su nombre: '
      'crearResumen(taller: ..., cupos: ...), sin importar el orden.');
  print('3) ¿Para qué se usa required?');
  print('   Obliga a pasar ese parámetro nombrado al llamar la función; '
      'si se omite, el código no compila.');
}