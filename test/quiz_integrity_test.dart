import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:la_sana_doctrina/main.dart';

void main() {
  test('hay al menos 50 evaluaciones con 20 preguntas completas', () {
    expect(quizPacks.length, greaterThanOrEqualTo(50));

    for (final pack in quizPacks) {
      expect(pack.title.trim().isNotEmpty, isTrue);
      expect(
        pack.questions,
        hasLength(20),
        reason: 'La evaluación ' + pack.title + ' no tiene exactamente 20 preguntas.',
      );

      final questionTexts = pack.questions
          .map((question) => question.question.trim().toLowerCase())
          .toSet();
      expect(
        questionTexts,
        hasLength(20),
        reason: 'La evaluación ' + pack.title + ' contiene preguntas repetidas.',
      );

      for (final question in pack.questions) {
        expect(question.question.trim().isNotEmpty, isTrue);
        expect(
          question.options,
          hasLength(4),
          reason: 'Una pregunta de ' + pack.title + ' no tiene cuatro opciones.',
        );
        expect(
          question.options.toSet(),
          hasLength(4),
          reason: 'Una pregunta de ' + pack.title + ' repite opciones.',
        );
        expect(question.correctIndex, inInclusiveRange(0, 3));
        expect(question.explanation.trim().isNotEmpty, isTrue);
        expect(question.references.trim().isNotEmpty, isTrue);
      }
    }
  });
  test('las evaluaciones trinitarias principales incluyen reactivos específicos', () {
    const focusedTitles = [
      'El Padre',
      'Divinidad del Hijo',
      'Persona del Espíritu Santo',
      'Bautismo de Jesús',
      'Jesús y el Padre',
    ];

    for (final title in focusedTitles) {
      final pack = quizPacks.singleWhere((item) => item.title == title);
      final firstFive = pack.questions.take(5).toList();
      expect(firstFive, hasLength(5));
      expect(
        firstFive.map((question) => question.options[question.correctIndex]).toSet(),
        hasLength(5),
        reason: 'La evaluación $title debe comenzar con respuestas específicas y no repetir una única plantilla.',
      );
    }
  });


  test('las evaluaciones trinitarias prioritarias no usan preguntas de relleno', () {
    const focusedTitles = [
      'Unidad de Dios',
      'Relaciones trinitarias',
      'El Padre',
      'Divinidad del Hijo',
      'Persona del Espíritu Santo',
      'Bautismo de Jesús',
      'Jesús y el Padre',
      'Nombre del Padre, Hijo y Espíritu',
      'Bendición apostólica',
      'El Verbo eterno',
    ];

    for (final title in focusedTitles) {
      final pack = quizPacks.singleWhere((item) => item.title == title);
      expect(pack.questions, hasLength(20), reason: title);
      final texts = pack.questions.map((item) => item.question.trim()).toSet();
      expect(texts, hasLength(20), reason: 'Preguntas repetidas en $title');

      for (final question in pack.questions) {
        expect(
          question.question,
          isNot(contains('Al leer el pasaje principal')),
          reason: 'Se detectó una plantilla genérica en $title',
        );
        expect(question.references, isNotEmpty);
        expect(question.explanation.length, greaterThan(45));
      }
    }
  });


  test('el catálogo tiene títulos únicos y al menos mil preguntas', () {
    final titles = quizPacks
        .map((pack) => pack.title.trim().toLowerCase())
        .toSet();
    expect(titles, hasLength(quizPacks.length));
    expect(quizPacks.length, greaterThanOrEqualTo(50));
    expect(
      quizPacks.fold<int>(0, (total, pack) => total + pack.questions.length),
      greaterThanOrEqualTo(1000),
    );
  });


  testWidgets('la revisión de respuestas permite desplazamiento vertical', (tester) async {
    final pack = quizPacks.first;
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: const CuestionariosTab(),
        ),
      ),
    );

    await tester.tap(find.text(pack.title).first);
    await tester.pumpAndSettle();

    for (var i = 0; i < pack.questions.length; i++) {
      final question = pack.questions[i];
      final correctOption = find.text(question.options[question.correctIndex]).first;
      await tester.ensureVisible(correctOption);
      await tester.tap(correctOption);
      await tester.pumpAndSettle();

      final nextLabel = i + 1 == pack.questions.length
          ? 'Ver resultado'
          : 'Siguiente pregunta';
      final nextButton = find.text(nextLabel).last;
      await tester.ensureVisible(nextButton);
      await tester.tap(nextButton);
      await tester.pumpAndSettle();
    }

    final reviewButton = find.text('Ver respuestas');
    expect(reviewButton, findsOneWidget);
    await tester.tap(reviewButton);
    await tester.pumpAndSettle();

    expect(find.textContaining('Pregunta 1:'), findsOneWidget);
    final resultsList = find.byType(ListView).first;
    await tester.drag(resultsList, const Offset(0, -1600));
    await tester.pumpAndSettle();
    expect(find.textContaining('Pregunta 20:'), findsOneWidget);
  });

}
