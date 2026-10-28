void main() {
 
  List<String> talleres = [
    'Flutter inicial',
    'Dart desde cero',
    'Diseño UX',
    'Flutter inicial', 
  ];

  // Actividad D 
  print('---Actividad D: Iterables y filtrado ---');

  
  Iterable<String> talleresFlutter =
      talleres.where((taller) => taller.contains('Flutter'));
  List<String> resultado = talleresFlutter.toList();
  print('Talleres que contienen "Flutter": $resultado');
  print('Cantidad de resultados: ${resultado.length}');

  
  Iterable<String> talleresLargos =
      talleres.where((taller) => taller.length > 10);
  List<String> resultadoLargos = talleresLargos.toList();
  print('Talleres con más de 10 caracteres: $resultadoLargos');
  print('Cantidad de resultados: ${resultadoLargos.length}');

  // Explicaciones
  print('');
  print('Preguntas:');
  print('1) ¿Qué hace where?');
  print('   Recorre la colección y conserva solo los elementos para los que '
      'la condición devuelve true. No modifica la lista original.');
  print('2) ¿Por qué la variable puede ser Iterable<String>?');
  print('   Porque where devuelve un Iterable<String>, no una List. '
      'List es un tipo de Iterable, y el resultado se evalúa de forma '
      'perezosa: se calcula al recorrerlo o al llamar toList().');
}