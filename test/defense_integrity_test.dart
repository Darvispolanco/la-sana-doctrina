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
        content,
        isNot(contains('Estado editorial')),
        reason: 'El documento $id contiene una nota editorial interna que no debe mostrarse en la app.',
      );
      expect(
        content,
        isNot(contains('Nota bibliográfica de trabajo')),
        reason: 'El documento $id contiene una nota bibliográfica interna que no debe mostrarse en la app.',
      );
      expect(
        content,
        isNot(contains('bibliografía final del libro')),
        reason: 'El documento $id contiene una referencia al formato de un libro externo a la app.',
      );
      expect(
        RegExp(r'^#{1,3}\s+\S', multiLine: true).hasMatch(content),
        isTrue,
        reason: 'El documento $id no contiene encabezados estructurados.',
      );
      final numericId = int.parse(id.substring(2));
      if (numericId >= 31 && numericId <= 100) {
        final wordCount = content.trim().split(RegExp(r'\s+')).length;
        final minimumWords = numericId <= 60 ? 450 : (numericId <= 80 ? 540 : 650);
        expect(
          wordCount,
          greaterThanOrEqualTo(minimumWords),
          reason: 'El documento $id necesita mayor desarrollo bíblico y contextual.',
        );
        expect(
          RegExp(r'^#{1,3}\s+.*referencias', multiLine: true, caseSensitive: false).hasMatch(content),
          isTrue,
          reason: 'El documento $id debe incluir referencias bíblicas identificables.',
        );
      }
    }
  });
}
