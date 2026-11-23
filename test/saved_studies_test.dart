import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:la_sana_doctrina/main.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    SavedStudyStore.saved.value = <String>{};
  });

  test('carga y conserva los estudios guardados localmente', () async {
    await SavedStudyStore.load();
    expect(SavedStudyStore.saved.value, isEmpty);

    await SavedStudyStore.toggle('01');
    await SavedStudyStore.toggle('D-001');
    expect(SavedStudyStore.saved.value, containsAll(['01', 'D-001']));

    final preferences = await SharedPreferences.getInstance();
    expect(
      preferences.getStringList('saved_study_numbers'),
      containsAll(['01', 'D-001']),
    );

    await SavedStudyStore.toggle('01');
    await SavedStudyStore.toggle('D-001');
    expect(SavedStudyStore.saved.value, isEmpty);
    expect(preferences.getStringList('saved_study_numbers'), isEmpty);
  });
  testWidgets('Estudios permite buscar sin tildes y guardar desde el catálogo', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: Scaffold(body: EstudiosTab())));
    await tester.enterText(find.byType(TextField), 'espiritu santo');
    await tester.pumpAndSettle();
    expect(find.textContaining('de 150 estudios'), findsOneWidget);
    expect(find.text('0 de 150 estudios'), findsNothing);

    await tester.enterText(find.byType(TextField), 'persona divinidad identidad');
    await tester.pumpAndSettle();
    expect(find.text('El Espíritu Santo'), findsOneWidget);

    final targetCard = find.ancestor(
      of: find.text('El Espíritu Santo'),
      matching: find.byType(Card),
    );
    await tester.tap(find.descendant(of: targetCard, matching: find.byTooltip('Guardar estudio')));
    await tester.pumpAndSettle();
    expect(SavedStudyStore.saved.value, contains('06'));

    await tester.pumpWidget(const MaterialApp(home: Scaffold(body: GuardadosTab())));
    await tester.pumpAndSettle();
    expect(find.text('El Espíritu Santo'), findsOneWidget);
  });

}
