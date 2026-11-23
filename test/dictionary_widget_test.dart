import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:la_sana_doctrina/main.dart';

void main() {
  testWidgets('el diccionario muestra el catálogo completo y busca sin distinguir tildes',
      (tester) async {
    await tester.pumpWidget(const MaterialApp(home: Scaffold(body: DiccionarioTab())));

    expect(find.textContaining('términos disponibles'), findsOneWidget);

    await tester.enterText(find.byType(TextField), 'Espiritu Santo');
    await tester.pumpAndSettle();

    expect(find.textContaining(' de 658 términos'), findsOneWidget);
    expect(find.text('0 resultados de 658 términos'), findsNothing);

    await tester.enterText(find.byType(TextField), 'ESPÍRITU SANTO');
    await tester.pumpAndSettle();

    expect(find.text('1 resultados de 658 términos'), findsOneWidget);
  });

  testWidgets('el diccionario busca también por referencias bíblicas',
      (tester) async {
    await tester.pumpWidget(const MaterialApp(home: Scaffold(body: DiccionarioTab())));

    await tester.enterText(find.byType(TextField), 'Juan 14:16-17,26');
    await tester.pumpAndSettle();

    expect(find.textContaining(' de 658 términos'), findsOneWidget);
  });
}
