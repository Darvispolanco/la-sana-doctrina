import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

part 'app/app_shell.dart';
part 'screens/inicio/inicio_tab.dart';
part 'screens/estudios/study_models.dart';
part 'screens/estudios/study_detail_page.dart';
part 'screens/estudios/study_catalog.dart';
part 'screens/estudios/study_catalog_01.dart';
part 'screens/estudios/study_catalog_02.dart';
part 'screens/estudios/study_catalog_03.dart';
part 'screens/estudios/study_catalog_04.dart';
part 'screens/estudios/study_catalog_05.dart';
part 'screens/estudios/study_catalog_06.dart';
part 'screens/estudios/study_catalog_07.dart';
part 'screens/estudios/study_catalog_08.dart';
part 'screens/estudios/study_catalog_09.dart';
part 'screens/estudios/study_catalog_10.dart';
part 'screens/estudios/study_catalog_11.dart';
part 'screens/estudios/study_catalog_12.dart';
part 'screens/estudios/study_catalog_13.dart';
part 'screens/estudios/study_catalog_14.dart';
part 'screens/estudios/study_catalog_15.dart';
part 'screens/estudios/study_catalog_16.dart';
part 'screens/estudios/study_catalog_17.dart';
part 'screens/estudios/study_catalog_18.dart';
part 'screens/estudios/study_catalog_19.dart';
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
