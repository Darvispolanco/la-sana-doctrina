import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:la_sana_doctrina/main.dart';
import 'package:la_sana_doctrina/quiz_data.dart';

void main() {
  test('la normalización descarta duplicados con diferencias de formato Unicode', () {
    expect(
      normalizeQuizQuestionKey('¿Qué enseña Jesús?'),
      normalizeQuizQuestionKey('QUE ENSENA JESUS'),
    );
    expect(
      normalizeQuizQuestionKey('¿Qué es la Trinidad?'),
      normalizeQuizQuestionKey('Que\u0301 es la Trinidad!!!'),
    );

    const repeated = QuizQuestion(
      question: '¿Qué enseña Jesús?',
      options: ['A', 'B', 'C', 'D'],
      correctIndex: 0,
      explanation: 'Explicación de prueba.',
      references: 'Juan 1:1',
    );
    const duplicate = QuizQuestion(
      question: 'QUE ENSENA JESUS!!!',
      options: ['A', 'B', 'C', 'D'],
      correctIndex: 0,
      explanation: 'Explicación de prueba.',
      references: 'Juan 1:1',
    );
    expect(uniqueQuizQuestions([repeated, duplicate]), hasLength(1));
  });

  test('ningún cuestionario conserva preguntas duplicadas tras la limpieza', () {
    for (final pack in quizPacks) {
      final unique = uniqueQuizQuestions(pack.questions);
      expect(
        unique,
        hasLength(pack.questions.length),
        reason: 'La evaluación ${pack.title} contiene preguntas duplicadas.',
      );
    }
  });
  test('hay al menos 50 evaluaciones con 20 preguntas completas', () {
    expect(quizPacks.length, greaterThanOrEqualTo(50));

    for (final pack in quizPacks) {
      expect(pack.title.trim().isNotEmpty, isTrue);
      expect(
        pack.questions,
        hasLength(20),
        reason: 'La evaluación ' + pack.title + ' no tiene exactamente 20 preguntas.',
      );

      final questionTexts = pack.questions.map((question) {
        return question.question
            .toLowerCase()
            .replaceAll(RegExp(r'[áàä]'), 'a')
            .replaceAll(RegExp(r'[éèë]'), 'e')
            .replaceAll(RegExp(r'[íìï]'), 'i')
            .replaceAll(RegExp(r'[óòö]'), 'o')
            .replaceAll(RegExp(r'[úùü]'), 'u')
            .replaceAll('ñ', 'n')
            .replaceAll(RegExp(r'[^a-z0-9]'), '');
      }).toSet();
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
      await tester.pumpAndSettle();

      // La opción es interactiva mediante el ListTile completo. Pulsar el
      // texto interno puede no activar el callback en el test cuando hay
      // elementos desplazables o textos coincidentes.
      final optionTile = find.ancestor(
        of: correctOption,
        matching: find.byType(ListTile),
      ).first;
      await tester.tap(optionTile);
      await tester.pumpAndSettle();

      expect(
        find.text('¡Respuesta correcta!'),
        findsOneWidget,
        reason: 'La opción correcta no quedó registrada en la pregunta ${i + 1}.',
      );

      // El ListView de preguntas construye sus hijos bajo demanda. El botón
      // puede estar fuera del viewport y todavía no existir en el árbol;
      // desplazar primero hasta la zona inferior permite que se monte.
      await tester.drag(
        find.byType(ListView).first,
        const Offset(0, -650),
      );
      await tester.pumpAndSettle();

      final nextLabel = i + 1 == pack.questions.length
          ? 'Ver resultado'
          : 'Siguiente pregunta';
      // La respuesta ya fue registrada y la etiqueta del control debe
      // estar montada. Usar el texto exacto evita depender del árbol interno
      // que Material construye alrededor de FilledButton.
      final nextButton = find.text(nextLabel);
      expect(
        nextButton,
        findsOneWidget,
        reason: 'No apareció el control para avanzar después de responder la pregunta ${i + 1}.',
      );
      expect(find.text(nextLabel), findsOneWidget);
      await tester.ensureVisible(nextButton);
      await tester.pumpAndSettle();
      await tester.tap(nextButton);
      await tester.pumpAndSettle();
    }

    final reviewButton = find.text('Ver respuestas');
    expect(reviewButton, findsOneWidget);
    await tester.tap(reviewButton);
    await tester.pumpAndSettle();

    expect(find.textContaining('Pregunta 1:'), findsOneWidget);
    final lastReviewQuestion = find.textContaining('Pregunta 20:');
    // La pantalla de resultados presenta la revisión en un ListView
    // único. Desplazar ese viewport hasta que se construya la pregunta 20.
    final resultsList = find.byType(ListView).last;
    for (var attempt = 0;
        attempt < 30 && lastReviewQuestion.evaluate().isEmpty;
        attempt++) {
      await tester.drag(resultsList, const Offset(0, -450));
      await tester.pumpAndSettle();
    }
    expect(lastReviewQuestion, findsOneWidget);
  });

}
