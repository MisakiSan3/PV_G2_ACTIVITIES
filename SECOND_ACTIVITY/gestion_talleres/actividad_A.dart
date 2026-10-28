void main() {
  
  List<String> talleres = [
    'Flutter inicial',
    'Dart desde cero',
    'Diseño UX',
    'Flutter inicial', 
  ];

  Map<String, int> cuposPorTaller = {
    'Flutter inicial': 20,
    'Dart desde cero': 25,
    'Diseño UX': 15,
  };

  
  Set<String> participantesRegistrados = {
    'Ana',
    'Luis',
    'Marta',
    'Ana', 
  };

 // Actividad A — Variables y tipos 

  bool inscripcionesAbiertas = true;
  String nombreUniversidad = 'UNIBE';

 
  String universidad = nombreUniversidad;
  String tallerSeleccionado = 'Flutter inicial';
  int cupos = cuposPorTaller[tallerSeleccionado] ?? 0;
  bool abiertas = inscripcionesAbiertas;

  print('--- Actividad A: Variables y tipos ---');
  print('Universidad (String): $universidad');
  print('Taller (String): $tallerSeleccionado');
  print('Cupo del taller (int): $cupos');
  print('Inscripciones abiertas (bool): $abiertas');
  print('');
  print('¿Qué representa cada tipo?');
  print('  String -> texto: aquí, el nombre de la universidad y del taller.');
  print('  int    -> número entero: aquí, la cantidad de cupos del taller.');
  print('  bool   -> verdadero o falso: aquí, si las inscripciones están abiertas.');

  print('');
  print('Talleres en la lista: ${talleres.length}');
  print('Participantes únicos en el Set: ${participantesRegistrados.length}');
}