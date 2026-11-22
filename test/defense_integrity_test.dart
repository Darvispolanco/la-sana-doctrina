import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('Defensa de la doctrina contiene 100 documentos íntegros', () async {
    final rawIndex = await rootBundle.loadString('assets/defensa_doctrinal/indice.json');
    final entries = (jsonDecode(rawIndex) as List).cast<Map<String, dynamic>>();

    expect(entries, hasLength(100));

    final ids = entries.map((entry) => entry['id'] as String).toList();
    final files = entries.map((entry) => entry['file'] as String).toList();

    expect(ids.toSet(), hasLength(100), reason: 'Hay identificadores de estudios repetidos.');
    expect(files.toSet(), hasLength(100), reason: 'Hay archivos asociados a más de un estudio.');

    for (final entry in entries) {
      final id = entry['id'] as String;
      final file = entry['file'] as String;
      expect(id, matches(RegExp(r'^D-\d{3}$')));

      final content = await rootBundle.loadString('assets/defensa_doctrinal/$file');
      expect(content.trim().isNotEmpty, isTrue, reason: 'El documento $id está vacío.');
      expect(
        RegExp(r'^#{1,3}\s+\S', multiLine: true).hasMatch(content),
        isTrue,
        reason: 'El documento $id no contiene encabezados estructurados.',
      );
    }
  });
}
