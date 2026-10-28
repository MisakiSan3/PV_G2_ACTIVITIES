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

void main() {
  
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

  bool inscripcionesAbiertas = true;
  int cuposFlutter = cuposPorTaller['Flutter inicial'] ?? 0;

  // Actividad E 
  print('--- Actividad E: Regla de negocio ---');
  print('Participantes al inicio: $participantesRegistrados');
  print('');

  // Caso válido
  print('1) Registro válido (Carlos):');
  print('   ${registrarParticipante('Carlos', participantesRegistrados, inscripcionesAbiertas, cuposFlutter)}');

  // Duplicado
  print('2) Persona ya registrada (Ana):');
  print('   ${registrarParticipante('Ana', participantesRegistrados, inscripcionesAbiertas, cuposFlutter)}');

  // Inscripciones cerradas
  print('3) Inscripciones cerradas (Sofía):');
  print('   ${registrarParticipante('Sofía', participantesRegistrados, false, cuposFlutter)}');

  // Sin cupos
  print('4) Sin cupos disponibles (Pedro):');
  print('   ${registrarParticipante('Pedro', participantesRegistrados, inscripcionesAbiertas, 0)}');

  // Nombre vacío
  print('5) Nombre vacío:');
  print('   ${registrarParticipante('   ', participantesRegistrados, inscripcionesAbiertas, cuposFlutter)}');

  print('');
  print('Participantes al final: $participantesRegistrados');
}