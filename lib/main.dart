import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

part 'app/app_shell.dart';
part 'screens/inicio/inicio_tab.dart';
part 'screens/estudios/study_models.dart';
part 'screens/estudios/study_detail_page.dart';
part 'screens/estudios/study_catalog.dart';
part 'screens/estudios/study_catalog_part_01.dart';
part 'screens/estudios/study_catalog_part_02.dart';
part 'screens/estudios/study_catalog_part_03.dart';
part 'screens/estudios/study_catalog_part_04.dart';
part 'screens/estudios/study_catalog_part_05.dart';
part 'screens/estudios/estudios_tab.dart';
part 'screens/diccionario/diccionario_tab.dart';
part 'screens/pruebas/cuestionarios_tab.dart';
part 'screens/guardados/guardados_tab.dart';
part 'widgets/home_widgets.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MobileAds.instance.initialize();
  runApp(const SanaDoctrinaApp());
}
