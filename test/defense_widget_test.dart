import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:la_sana_doctrina/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    SharedPreferences.setMockInitialValues({});
    SavedStudyStore.saved.value = <String>{};
  });

  testWidgets('Defensa permite buscar, guardar y recuperar un estudio', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: DefensaDoctrinalPage()));
    await tester.pumpAndSettle();

    expect(find.text('100 de 100 estudios'), findsOneWidget);

    await tester.enterText(find.byType(TextField), 'D-081');
    await tester.pumpAndSettle();
    expect(find.text('1 de 100 estudios'), findsOneWidget);

    await tester.enterText(find.byType(TextField), 'monoteismo');
    await tester.pumpAndSettle();
    expect(find.textContaining('de 100 estudios'), findsOneWidget);
    expect(find.text('0 de 100 estudios'), findsNothing);

    await tester.enterText(find.byType(TextField), 'D-081');
    await tester.pumpAndSettle();
    expect(find.text('Un solo Dios: el fundamento del monoteísmo bíblico'), findsOneWidget);

    final targetCard = find.ancestor(
      of: find.text('Un solo Dios: el fundamento del monoteísmo bíblico'),
      matching: find.byType(Card),
    );
    await tester.tap(find.descendant(of: targetCard, matching: find.byTooltip('Guardar estudio')));
    await tester.pumpAndSettle();

    expect(SavedStudyStore.saved.value, contains('D-081'));

    await tester.pumpWidget(const MaterialApp(home: GuardadosTab()));
    await tester.pumpAndSettle();

    expect(find.text('Un solo Dios: el fundamento del monoteísmo bíblico'), findsOneWidget);
  });
}
