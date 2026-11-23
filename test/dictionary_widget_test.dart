import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:la_sana_doctrina/main.dart';

void main() {
  testWidgets('el diccionario busca términos sin distinguir tildes ni mayúsculas',
      (tester) async {
    await tester.pumpWidget(const MaterialApp(home: Scaffold(body: DiccionarioTab())));

    expect(find.textContaining('términos disponibles'), findsOneWidget);

    await tester.enterText(find.byType(TextField), 'Espiritu Santo');
    await tester.pumpAndSettle();

    expect(find.textContaining('resultados de'), findsOneWidget);
    expect(find.textContaining('0 resultados de'), findsNothing);

    await tester.enterText(find.byType(TextField), 'ESPÍRITU SANTO');
    await tester.pumpAndSettle();

    expect(find.textContaining('resultados de'), findsOneWidget);
    expect(find.textContaining('0 resultados de'), findsNothing);
  });

  testWidgets('el diccionario permite localizar conceptos por referencias bíblicas',
      (tester) async {
    await tester.pumpWidget(const MaterialApp(home: Scaffold(body: DiccionarioTab())));

    await tester.enterText(find.byType(TextField), 'Juan 14:16-17,26');
    await tester.pumpAndSettle();

    expect(find.textContaining('resultados de'), findsOneWidget);
    expect(find.textContaining('0 resultados de'), findsNothing);
  });
}
