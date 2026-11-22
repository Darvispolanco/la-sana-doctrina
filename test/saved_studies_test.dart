import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../lib/main.dart';

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
    expect(SavedStudyStore.saved.value, contains('01'));

    final preferences = await SharedPreferences.getInstance();
    expect(preferences.getStringList('saved_study_numbers'), contains('01'));

    await SavedStudyStore.toggle('01');
    expect(SavedStudyStore.saved.value, isEmpty);
    expect(preferences.getStringList('saved_study_numbers'), isEmpty);
  });
}
