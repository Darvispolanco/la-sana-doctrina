import 'package:flutter_test/flutter_test.dart';
import '../lib/dictionary_extra.dart';
import '../lib/dictionary_tranche_02.dart';
import '../lib/dictionary_tranche_03.dart';

void main() {
  final entries = <Map<String, String>>[
    ...additionalDictionaryEntries,
    ...dictionaryTranche02,
    ...dictionaryTranche03,
  ];

  test('el diccionario ampliado conserva entradas completas', () {
    expect(entries.length, greaterThanOrEqualTo(450));
    for (final entry in entries) {
      for (final field in ['term', 'definition', 'category', 'references', 'context']) {
        expect(entry[field]?.trim().isNotEmpty, isTrue,
            reason: 'La entrada ${entry['term']} no contiene $field.');
      }
    }
    for (final context in baseDictionaryContexts.entries) {
      expect(context.key.trim(), isNotEmpty);
      expect(context.value.trim(), isNotEmpty);
    }
  });

  test('no hay términos duplicados entre los bloques ampliados', () {
    final terms = <String>[
      ...baseDictionaryContexts.keys,
      ...entries.map((entry) => entry['term']!),
    ].map((term) => term.trim().toLowerCase()).toList();

    expect(terms.toSet().length, terms.length,
        reason: 'Hay términos repetidos entre los bloques del diccionario.');
  });
}
