import 'package:flutter_test/flutter_test.dart';
import 'package:la_sana_doctrina/main.dart';

void main() {
  test('hay al menos 50 evaluaciones con 20 preguntas completas', () {
    expect(quizPacks.length, greaterThanOrEqualTo(50));

    for (final pack in quizPacks) {
      expect(pack.title.trim().isNotEmpty, isTrue);
      expect(pack.questions, hasLength(20),
          reason: 'La evaluación "\${pack.title}" no tiene exactamente 20 preguntas.');

      final questionTexts = pack.questions
          .map((question) => question.question.trim().toLowerCase())
          .toSet();
      expect(questionTexts, hasLength(20),
          reason: 'La evaluación "\${pack.title}" contiene preguntas repetidas.');

      for (final question in pack.questions) {
        expect(question.question.trim().isNotEmpty, isTrue);
        expect(question.options, hasLength(4),
            reason: 'Una pregunta de "\${pack.title}" no tiene cuatro opciones.');
        expect(question.options.toSet(), hasLength(4),
            reason: 'Una pregunta de "\${pack.title}" repite opciones.');
        expect(question.correctIndex, inInclusiveRange(0, 3));
        expect(question.explanation.trim().isNotEmpty, isTrue);
        expect(question.references.trim().isNotEmpty, isTrue);
      }
    }
  });
}
