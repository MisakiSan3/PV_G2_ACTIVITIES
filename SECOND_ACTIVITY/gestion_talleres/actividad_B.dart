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

  // Actividad B — List, Map y Set 
  print('---Actividad B: List, Map y Set ---');

  
  print('Talleres almacenados en la lista:');
  for (final taller in talleres) {
    print('  - $taller');
  }


  print('Cupo de Flutter inicial (Map): ${cuposPorTaller['Flutter inicial']}');

  
  print('Cantidad de talleres en la lista: ${talleres.length}');
  print('Participantes únicos en el Set: ${participantesRegistrados.length}');

  // Explicación
  print('¿Por qué la List tiene repetidos y el Set no?');
  print('  La List guarda cada elemento en su posición, aunque se repita '
      '(por eso "Flutter inicial" aparece 2 veces).');
  print('  El Set solo guarda valores únicos y descarta los que ya contiene '
      '(por eso "Ana" cuenta 1 sola vez).');
}