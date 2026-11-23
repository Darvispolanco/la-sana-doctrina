import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:la_sana_doctrina/main.dart';

void main() {
  testWidgets('el diccionario muestra el catálogo completo y busca sin distinguir tildes',
      (tester) async {
    await tester.pumpWidget(const MaterialApp(home: DiccionarioTab()));

    expect(find.text('636 términos disponibles'), findsOneWidget);

    await tester.enterText(find.byType(TextField), 'Espiritu Santo');
    await tester.pumpAndSettle();

    expect(find.text('Espíritu Santo'), findsOneWidget);

    await tester.enterText(find.byType(TextField), 'ESPÍRITU SANTO');
    await tester.pumpAndSettle();

    expect(find.text('Espíritu Santo'), findsOneWidget);
  });

  testWidgets('el diccionario busca también por referencias bíblicas',
      (tester) async {
    await tester.pumpWidget(const MaterialApp(home: DiccionarioTab()));

    await tester.enterText(find.byType(TextField), 'Juan 14:16-17,26');
    await tester.pumpAndSettle();

    expect(find.text('Espíritu Santo'), findsOneWidget);
  });
}
