import 'package:flutter_test/flutter_test.dart';
import 'package:la_sana_doctrina/dictionary_extra.dart';
import 'package:la_sana_doctrina/dictionary_tranche_02.dart';
import 'package:la_sana_doctrina/dictionary_tranche_03.dart';
import 'package:la_sana_doctrina/dictionary_tranche_04.dart';
import 'package:la_sana_doctrina/dictionary_tranche_05.dart';

String normalizeTerm(String value) {
  return value
      .trim()
      .toLowerCase()
      .replaceAll(RegExp(r'\s+'), ' ')
      .replaceAll(RegExp(r'[áàä]'), 'a')
      .replaceAll(RegExp(r'[éèë]'), 'e')
      .replaceAll(RegExp(r'[íìï]'), 'i')
      .replaceAll(RegExp(r'[óòö]'), 'o')
      .replaceAll(RegExp(r'[úùü]'), 'u');
}

void main() {
  final entries = <Map<String, String>>[
    ...additionalDictionaryEntries,
    ...dictionaryTranche02,
    ...dictionaryTranche03,
    ...dictionaryTranche04,
    ...dictionaryTranche05,
  ];

  test('el diccionario ampliado conserva entradas completas y contextos específicos', () {
    expect(entries.length, greaterThanOrEqualTo(540));
    for (final entry in entries) {
      for (final field in ['term', 'definition', 'category', 'references', 'context']) {
        expect(entry[field]?.trim().isNotEmpty, isTrue,
            reason: 'Una entrada del diccionario no contiene $field.');
      }
      expect(
        entry['context']!.contains('Este concepto se interpreta en relación con'),
        isFalse,
        reason: 'El contexto de una entrada no debe ser una plantilla genérica.',
      );
    }
    expect(baseDictionaryContexts.length, greaterThanOrEqualTo(56));
    for (final context in baseDictionaryContexts.entries) {
      expect(context.key.trim(), isNotEmpty);
      expect(context.value.trim(), isNotEmpty);
    }
  });

  test('no hay términos duplicados ignorando mayúsculas y tildes', () {
    final terms = entries.map((entry) => normalizeTerm(entry['term']!)).toList();

    expect(terms.toSet().length, terms.length,
        reason: 'Hay términos repetidos entre los bloques del diccionario.');
  });
}
