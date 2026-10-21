import 'dart:io';

void main() {
  stdout.write('¿Cómo te llamas? ');
  final nombre = stdin.readLineSync() ?? '';
  print('Hola, $nombre. Tu entorno Dart funciona.');
  print('Sistema: ${Platform.operatingSystem}');
  print('Dart: ${Platform.version}');
}