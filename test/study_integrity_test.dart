import 'package:flutter_test/flutter_test.dart';
import 'package:la_sana_doctrina/study_data.dart';

void main() {
  test('el catálogo conserva los 150 estudios con estructura completa', () {
    expect(studyCatalog, hasLength(150));

    final numbers = studyCatalog.map((study) => study.number).toSet();
    expect(numbers, hasLength(150));

    final titles = studyCatalog
        .map((study) => study.title.trim().toLowerCase())
        .toSet();
    expect(titles, hasLength(150));

    for (final study in studyCatalog) {
      expect(study.number.trim(), isNotEmpty);
      expect(study.title.trim(), isNotEmpty);
      expect(study.subtitle.trim(), isNotEmpty);
      expect(study.introduction.trim(), isNotEmpty);
      expect(study.sections, isNotEmpty,
          reason: 'El estudio ${study.number} no contiene secciones.');
      expect(study.conclusion.trim(), isNotEmpty);

      for (final section in study.sections) {
        expect(section.title.trim(), isNotEmpty);
        expect(section.content.trim(), isNotEmpty);
        expect(section.references.trim(), isNotEmpty,
            reason: 'La sección "${section.title}" del estudio ${study.number} no tiene referencias.');
      }
    }
  });
}
