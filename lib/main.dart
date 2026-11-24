import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dictionary_extra.dart';
import 'dictionary_tranche_02.dart';
import 'dictionary_tranche_03.dart';
import 'dictionary_tranche_04.dart';
import 'dictionary_tranche_05.dart';
import 'dictionary_tranche_06.dart';
import 'dictionary_tranche_07.dart';
import 'dictionary_tranche_08.dart';
import 'quiz_data.dart';
import 'study_data.dart';
export 'study_data.dart';
export 'quiz_data.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
Future<bool>? _adsInitialization;

Future<bool> _initializeAdsSafely() {
  return _adsInitialization ??= () async {
    try {
      await MobileAds.instance.initialize();
      return true;
    } catch (error, stackTrace) {
      debugPrint('No se pudieron inicializar los anuncios: $error');
      debugPrintStack(stackTrace: stackTrace);
      return false;
    }
  }();
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // La interfaz debe aparecer aunque falle un servicio externo del dispositivo.
  runApp(const SanaDoctrinaApp());

  try {
    await SavedStudyStore.load();
  } catch (error, stackTrace) {
    debugPrint('No se pudieron recuperar los estudios guardados: $error');
    debugPrintStack(stackTrace: stackTrace);
  }

  // Los anuncios se inicializan después de mostrar la primera pantalla.
  await _initializeAdsSafely();
}

class SanaDoctrinaApp extends StatelessWidget {
const SanaDoctrinaApp({super.key});

@override
Widget build(BuildContext context) {
const navy = Color(0xFF14243A);
const gold = Color(0xFFD5B46A);

return MaterialApp(
debugShowCheckedModeBanner: false,
title: 'La Sana Doctrina',
theme: ThemeData(
useMaterial3: true,
colorScheme: ColorScheme.fromSeed(
seedColor: navy,
primary: navy,
secondary: gold,
surface: const Color(0xFFF7F5F0),
),
scaffoldBackgroundColor: const Color(0xFFF7F5F0),
appBarTheme: const AppBarTheme(
backgroundColor: navy,
foregroundColor: Colors.white,
centerTitle: false,
),
),
home: const HomeScreen(),
);
}
}

class HomeScreen extends StatefulWidget {
const HomeScreen({super.key});

@override
State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
int selectedIndex = 0;

List<Widget> get pages => <Widget>[
  InicioTab(onNavigate: (i) { if (mounted) setState(() => selectedIndex = i); }),
  const EstudiosTab(), const DiccionarioTab(), const CuestionariosTab(), const GuardadosTab(),
];

static const titles = [
'La Sana Doctrina',
'Estudios bíblicos',
'Diccionario teológico',
'Cuestionarios',
'Mis guardados',
];

@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(
title: Text(
titles[selectedIndex],
style: const TextStyle(fontWeight: FontWeight.w700),
),
),
body: IndexedStack(index: selectedIndex, children: pages),
bottomNavigationBar: NavigationBar(
selectedIndex: selectedIndex,
onDestinationSelected: (value) =>
setState(() => selectedIndex = value),
destinations: const [
NavigationDestination(
icon: Icon(Icons.home_outlined),
selectedIcon: Icon(Icons.home),
label: 'Inicio',
),
NavigationDestination(
icon: Icon(Icons.menu_book_outlined),
selectedIcon: Icon(Icons.menu_book),
label: 'Estudios',
),
NavigationDestination(
icon: Icon(Icons.auto_stories_outlined),
selectedIcon: Icon(Icons.auto_stories),
label: 'Diccionario',
),
NavigationDestination(
icon: Icon(Icons.quiz_outlined),
selectedIcon: Icon(Icons.quiz),
label: 'Pruebas',
),
NavigationDestination(
icon: Icon(Icons.bookmark_border),
selectedIcon: Icon(Icons.bookmark),
label: 'Guardados',
),
],
),
);
}
}

class InicioTab extends StatelessWidget {
  const InicioTab({super.key, required this.onNavigate});
  final ValueChanged<int> onNavigate;
  @override
  Widget build(BuildContext context) => ListView(padding: const EdgeInsets.all(18), children: [
    Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: const LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight,
          colors: [Color(0xFF14243A), Color(0xFF243F5D)]),
        borderRadius: BorderRadius.circular(24),
        boxShadow: const [BoxShadow(color: Color(0x2414243A), blurRadius: 18, offset: Offset(0, 8))],
      ),
      child: const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Icon(Icons.menu_book_rounded, color: Color(0xFFD5B46A), size: 38),
        SizedBox(height: 16),
        Text('CONOCIENDO MÁS DE DIOS', style: TextStyle(color: Color(0xFFD5B46A),
          fontSize: 12, letterSpacing: 1.5, fontWeight: FontWeight.w800)),
        SizedBox(height: 10),
        Text('Crecer en la verdad de las Escrituras.', style: TextStyle(color: Colors.white,
          fontSize: 25, height: 1.2, fontWeight: FontWeight.w800)),
        SizedBox(height: 14),
        Text('“Pero tú habla lo que está de acuerdo con la sana doctrina”.',
          style: TextStyle(color: Colors.white70, height: 1.45, fontStyle: FontStyle.italic)),
        SizedBox(height: 6),
        Text('Tito 2:1', style: TextStyle(color: Color(0xFFD5B46A), fontWeight: FontWeight.bold)),
      ]),
    ),
    const SizedBox(height: 26), const SectionHeading('Explora la aplicación'), const SizedBox(height: 8),
    FeatureTile(icon: Icons.menu_book_rounded, title: 'Estudios bíblicos',
      subtitle: 'Explora los 150 estudios y profundiza en cada tema.', onTap: () => onNavigate(1)),
    FeatureTile(icon: Icons.shield_outlined, title: 'Defensa de la doctrina',
      subtitle: 'Consulta los 100 estudios de defensa bíblica e histórica.', onTap: () =>
        Navigator.push(context, MaterialPageRoute(builder: (_) => const DefensaDoctrinalPage()))),
    FeatureTile(icon: Icons.search_rounded, title: 'Diccionario teológico',
      subtitle: 'Busca conceptos y términos de la sana doctrina.', onTap: () => onNavigate(2)),
    FeatureTile(icon: Icons.quiz_rounded, title: 'Evaluaciones bíblicas',
      subtitle: 'Comprueba lo aprendido con preguntas explicadas.', onTap: () => onNavigate(3)),
    FeatureTile(icon: Icons.bookmark_rounded, title: 'Mis guardados',
      subtitle: 'Vuelve rápidamente a tus estudios favoritos.', onTap: () => onNavigate(4)),
    const SizedBox(height: 12), const HomeBannerAd(), const SizedBox(height: 14),
    const Text('Contenido de estudio fundamentado en las Escrituras.',
      textAlign: TextAlign.center, style: TextStyle(color: Colors.black54, fontSize: 12)),
  ]);
}
class EstudiosTab extends StatefulWidget {
const EstudiosTab({super.key});

static const studies = studyCatalog;
@override
State<EstudiosTab> createState() => _EstudiosTabState();
}

class _EstudiosTabState extends State<EstudiosTab> {
String query = '';

@override
Widget build(BuildContext context) {
final normalizedQuery = _dictionarySortKey(query.trim());
final filteredStudies = EstudiosTab.studies.where((study) {
  final searchableText = _dictionarySortKey([
    study.number,
    study.title,
    study.subtitle,
    study.introduction,
    study.conclusion,
    ...study.sections.expand((section) => [
      section.title,
      section.content,
      section.references,
    ]),
  ].join(' '));
  return normalizedQuery.isEmpty || searchableText.contains(normalizedQuery);
}).toList();

return ListView(
padding: const EdgeInsets.all(16),
children: [
const Text(
'Biblioteca de formación bíblica',
style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
),
const SizedBox(height: 6),
const Text(
'Estudia las Escrituras tema por tema y fortalece tus fundamentos.',
),
const SizedBox(height: 14),
TextField(
onChanged: (value) => setState(() => query = value),
decoration: InputDecoration(
hintText: 'Buscar estudio por título o tema...',
prefixIcon: const Icon(Icons.search),
suffixIcon: query.isEmpty ? null : IconButton(onPressed: () => setState(() => query = ''), icon: const Icon(Icons.clear)),
border: OutlineInputBorder(borderRadius: BorderRadius.circular(14)),
),
),
const SizedBox(height: 12),
Text(
  '${filteredStudies.length} de ${EstudiosTab.studies.length} estudios',
  style: const TextStyle(color: Colors.black54),
),
const SizedBox(height: 8),
if (filteredStudies.isEmpty)
const Padding(padding: EdgeInsets.all(24), child: Text('No se encontraron estudios con esa búsqueda.'))
else
for (final study in filteredStudies)
Card(
clipBehavior: Clip.antiAlias,
child: ListTile(
contentPadding: const EdgeInsets.all(12),
leading: CircleAvatar(
backgroundColor: const Color(0xFFE9DFC8),
child: Text(
study.number,
style: const TextStyle(
color: Color(0xFF14243A),
fontWeight: FontWeight.bold,
),
),
),
title: Text(
study.title,
style: const TextStyle(fontWeight: FontWeight.bold),
),
subtitle: Padding(
padding: const EdgeInsets.only(top: 5),
child: Text(study.subtitle),
),
trailing: Row(
  mainAxisSize: MainAxisSize.min,
  children: [
    ValueListenableBuilder<Set<String>>(
      valueListenable: SavedStudyStore.saved,
      builder: (context, saved, _) {
        final isSaved = saved.contains(study.number);
        return IconButton(
          tooltip: isSaved ? 'Quitar de guardados' : 'Guardar estudio',
          icon: Icon(
            isSaved ? Icons.bookmark : Icons.bookmark_border,
            color: const Color(0xFF14243A),
          ),
          onPressed: () => SavedStudyStore.toggle(study.number),
        );
      },
    ),
    const Icon(Icons.chevron_right),
  ],
),
onTap: () {
Navigator.push(
context,
MaterialPageRoute(
builder: (_) => StudyDetailPage(study: study),
),
);
},
),
),
],
);
}
}

class SavedStudyStore {
static final ValueNotifier<Set<String>> saved = ValueNotifier<Set<String>>({});

static Future<void> load() async {
  try {
    final preferences = await SharedPreferences.getInstance();
    saved.value = preferences.getStringList('saved_study_numbers')?.toSet() ?? <String>{};
  } catch (error, stackTrace) {
    debugPrint('No se pudieron cargar los estudios guardados: $error');
    debugPrintStack(stackTrace: stackTrace);
    saved.value = <String>{};
  }
}

static Future<void> toggle(String number) async {
  final next = Set<String>.from(saved.value);
  if (!next.add(number)) next.remove(number);
  saved.value = next;

  try {
    final preferences = await SharedPreferences.getInstance();
    await preferences.setStringList('saved_study_numbers', next.toList());
  } catch (error, stackTrace) {
    debugPrint('No se pudieron guardar los cambios localmente: $error');
    debugPrintStack(stackTrace: stackTrace);
  }
}
}



class StudyDetailPage extends StatelessWidget {
final Study study;

const StudyDetailPage({super.key, required this.study});

@override
Widget build(BuildContext context) {
const navy = Color(0xFF14243A);
const gold = Color(0xFFD5B46A);

return Scaffold(
appBar: AppBar(
title: Text(study.title),
actions: [
ValueListenableBuilder<Set<String>>(
valueListenable: SavedStudyStore.saved,
builder: (context, saved, _) {
final isSaved = saved.contains(study.number);
return IconButton(
tooltip: isSaved ? 'Quitar de guardados' : 'Guardar estudio',
icon: Icon(isSaved ? Icons.bookmark : Icons.bookmark_border),
onPressed: () => SavedStudyStore.toggle(study.number),
);
},
),
],
),
body: ListView(
padding: const EdgeInsets.all(20),
children: [
Container(
padding: const EdgeInsets.all(20),
decoration: BoxDecoration(
color: navy,
borderRadius: BorderRadius.circular(18),
),
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Text(
'ESTUDIO ${study.number}',
style: const TextStyle(
color: gold,
fontWeight: FontWeight.bold,
letterSpacing: 1.2,
),
),
const SizedBox(height: 10),
Text(
study.title,
style: const TextStyle(
color: Colors.white,
fontSize: 25,
fontWeight: FontWeight.bold,
),
),
const SizedBox(height: 8),
Text(
study.subtitle,
style: const TextStyle(color: Colors.white70),
),
],
),
),
const SizedBox(height: 22),
const Text(
'INTRODUCCIÓN',
style: TextStyle(
color: navy,
fontWeight: FontWeight.bold,
letterSpacing: 1,
),
),
const SizedBox(height: 8),
Text(
study.introduction,
style: const TextStyle(fontSize: 16, height: 1.65),
),
const SizedBox(height: 24),
for (final section in study.sections) ...[
Text(
section.title,
style: const TextStyle(
color: navy,
fontSize: 19,
fontWeight: FontWeight.bold,
),
),
const SizedBox(height: 9),
Text(
section.content,
style: const TextStyle(fontSize: 16, height: 1.65),
),
const SizedBox(height: 12),
Container(
padding: const EdgeInsets.all(12),
decoration: BoxDecoration(
color: const Color(0xFFEFE9DC),
borderRadius: BorderRadius.circular(10),
),
child: Row(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
const Icon(Icons.menu_book, color: navy),
const SizedBox(width: 9),
Expanded(
child: Text(
'Referencias bíblicas: ${section.references}',
style: const TextStyle(
color: navy,
fontWeight: FontWeight.w600,
),
),
),
],
),
),
const SizedBox(height: 24),
],
const Divider(),
const Text(
'CONCLUSIÓN',
style: TextStyle(
color: navy,
fontWeight: FontWeight.bold,
letterSpacing: 1,
),
),
const SizedBox(height: 8),
Text(
study.conclusion,
style: const TextStyle(fontSize: 16, height: 1.65),
),
const SizedBox(height: 30),
const Center(
child: Text(
'LA SANA DOCTRINA · CONOCIENDO MÁS DE DIOS',
textAlign: TextAlign.center,
style: TextStyle(
color: Colors.black54,
fontSize: 11,
fontWeight: FontWeight.bold,
letterSpacing: 1,
),
),
),const SizedBox(height: 20),
],
),
);
}
}

String _dictionarySortKey(String value) => value.toLowerCase().replaceAll(RegExp('[áàä]'), 'a').replaceAll(RegExp('[éèë]'), 'e').replaceAll(RegExp('[íìï]'), 'i').replaceAll(RegExp('[óòö]'), 'o').replaceAll(RegExp('[úùü]'), 'u').replaceAll('ñ', 'n~');

class DictionaryTerm {
  final String term;
  final String definition;
  final String category;
  final String references;
  final String context;

  const DictionaryTerm(
    this.term,
    this.definition,
    this.category,
    this.references, {
    this.context = '',
  });
}

final List<DictionaryTerm> dictionaryTerms = [
  DictionaryTerm('Adopción', 'Acto de gracia por el que Dios recibe como hijos a quienes están unidos a Cristo.', 'Salvación', 'Romanos 8:15-17; Gálatas 4:4-7'),
  DictionaryTerm('Adoración', 'Respuesta reverente de amor, honra y obediencia que se dirige a Dios.', 'Vida cristiana', 'Juan 4:23-24; Romanos 12:1'),
  DictionaryTerm('Atributo divino', 'Perfección propia del ser y carácter de Dios, como su santidad, amor y eternidad.', 'Teología', 'Éxodo 34:6-7; Salmo 90:2'),
  DictionaryTerm('Bautismo', 'Ordenanza de Cristo que expresa públicamente la fe y la identificación del creyente con Él.', 'Iglesia', 'Mateo 28:19; Romanos 6:3-4'),
  DictionaryTerm('Biblia', 'Conjunto de los escritos del Antiguo y Nuevo Testamento recibidos por la Iglesia como Escritura inspirada.', 'Escritura', '2 Timoteo 3:16-17; 2 Pedro 1:20-21'),
  DictionaryTerm('Canon bíblico', 'Conjunto de libros reconocidos como parte de las Sagradas Escrituras.', 'Escritura', 'Lucas 24:44; 2 Timoteo 3:16'),
  DictionaryTerm('Cristo', 'Título que significa Ungido y designa a Jesús como el Mesías prometido.', 'Cristología', 'Mateo 16:16; Hechos 2:36'),
  DictionaryTerm('Deidad', 'Naturaleza divina; la Escritura afirma que el Hijo posee plenamente la naturaleza de Dios.', 'Trinidad', 'Juan 1:1; Colosenses 2:9'),
  DictionaryTerm('Dios', 'El único Creador y Señor eterno, infinito, santo y soberano sobre todo lo creado.', 'Teología', 'Deuteronomio 6:4; Isaías 45:5'),
  DictionaryTerm('Doctrina', 'Enseñanza que debe formularse y evaluarse conforme al testimonio completo de las Escrituras.', 'Teología', 'Tito 2:1; 2 Timoteo 3:16'),
  DictionaryTerm('Encarnación', 'Acto por el cual el Hijo eterno asumió verdadera naturaleza humana sin dejar de ser divino.', 'Cristología', 'Juan 1:14; Filipenses 2:6-8'),
  DictionaryTerm('Espíritu Santo', 'Tercera persona divina, quien enseña, santifica, consuela y glorifica al Hijo.', 'Trinidad', 'Juan 14:16-17,26; Hechos 5:3-4'),
  DictionaryTerm('Exégesis', 'Estudio cuidadoso de un pasaje para establecer su sentido según su contexto y lenguaje.', 'Hermenéutica', 'Nehemías 8:8; 2 Timoteo 2:15'),
  DictionaryTerm('Fe', 'Confianza en Dios y en su promesa, que recibe a Cristo y se expresa en obediencia.', 'Salvación', 'Romanos 3:28; Hebreos 11:1,6'),
  DictionaryTerm('Gracia', 'Favor inmerecido de Dios, manifestado en la salvación que concede por medio de Jesucristo.', 'Salvación', 'Efesios 2:8-9; Tito 2:11'),
  DictionaryTerm('Herejía', 'Enseñanza que se aparta de la verdad apostólica y contradice el testimonio bíblico.', 'Doctrina', 'Gálatas 1:8-9; 2 Pedro 2:1'),
  DictionaryTerm('Hijo de Dios', 'Designación bíblica de Jesucristo que expresa su relación única con el Padre y su identidad divina.', 'Trinidad', 'Juan 1:18; Juan 5:18-23'),
  DictionaryTerm('Hermenéutica', 'Principios y métodos para interpretar responsablemente los textos bíblicos.', 'Hermenéutica', 'Lucas 24:27; 2 Pedro 3:16'),
  DictionaryTerm('Inspiración', 'Obra del Espíritu por la que las Escrituras fueron dadas mediante autores humanos.', 'Escritura', '2 Timoteo 3:16; 2 Pedro 1:21'),
  DictionaryTerm('Justificación', 'Declaración de Dios por la que considera justo al pecador que recibe a Cristo por la fe.', 'Salvación', 'Romanos 3:24-28; 5:1'),
  DictionaryTerm('Logos', 'Término griego traducido como Verbo o Palabra, aplicado a Jesucristo en Juan 1.', 'Cristología', 'Juan 1:1-3,14'),
  DictionaryTerm('Monoteísmo', 'Confesión de que existe un solo Dios verdadero.', 'Teología', 'Deuteronomio 6:4; Isaías 44:6'),
  DictionaryTerm('Omnipotencia', 'Perfección divina por la que Dios puede realizar todo lo que corresponde a su voluntad santa.', 'Teología', 'Génesis 18:14; Lucas 1:37'),
  DictionaryTerm('Omnipresencia', 'Perfección divina por la que Dios está presente en todo lugar y no está limitado por el espacio.', 'Teología', 'Salmo 139:7-10; Jeremías 23:23-24'),
  DictionaryTerm('Omnisciencia', 'Conocimiento perfecto y completo que Dios posee de todas las cosas.', 'Teología', 'Salmo 147:5; Hebreos 4:13'),
  DictionaryTerm('Padre', 'Primera persona de la Trinidad, distinta del Hijo y del Espíritu Santo, y plenamente Dios.', 'Trinidad', 'Mateo 3:16-17; Juan 17:1-5'),
  DictionaryTerm('Pecado', 'Rebelión y transgresión contra Dios que afecta la relación humana con Él.', 'Salvación', 'Romanos 3:23; 1 Juan 3:4'),
  DictionaryTerm('Persona divina', 'Distinción personal real en el único ser de Dios; Padre, Hijo y Espíritu Santo no son la misma persona.', 'Trinidad', 'Mateo 28:19; Juan 14:16-17'),
  DictionaryTerm('Propiciación', 'Obra de Cristo que satisface la justicia divina y trata con el pecado mediante su sacrificio.', 'Salvación', 'Romanos 3:25; 1 Juan 2:2'),
  DictionaryTerm('Redención', 'Liberación del pecado mediante el precio de la obra sacrificial de Jesucristo.', 'Salvación', 'Efesios 1:7; 1 Pedro 1:18-19'),
  DictionaryTerm('Regeneración', 'Obra del Espíritu Santo por la que Dios da nueva vida al pecador.', 'Salvación', 'Juan 3:5-8; Tito 3:5'),
  DictionaryTerm('Revelación', 'Acción por la que Dios se da a conocer mediante sus obras y, de manera culminante, en Jesucristo.', 'Escritura', 'Hebreos 1:1-3; Juan 1:18'),
  DictionaryTerm('Santificación', 'Obra de Dios por la que el creyente es apartado para Él y crece en una vida conforme a Cristo.', 'Salvación', '1 Tesalonicenses 4:3; 5:23'),
  DictionaryTerm('Soberanía', 'Autoridad suprema de Dios sobre la creación y la historia, ejercida con justicia y sabiduría.', 'Teología', 'Salmo 103:19; Daniel 4:35'),
  DictionaryTerm('Trinidad', 'Doctrina bíblica que confiesa un solo Dios en tres personas distintas: Padre, Hijo y Espíritu Santo.', 'Trinidad', 'Mateo 28:19; 2 Corintios 13:14'),
  DictionaryTerm('Unidad divina', 'Verdad de que Dios es uno en esencia y no existen tres dioses.', 'Trinidad', 'Deuteronomio 6:4; Isaías 45:5'),
  DictionaryTerm('Verbo', 'Nombre con el que Juan presenta al Hijo eterno, quien estaba con Dios y era Dios.', 'Cristología', 'Juan 1:1-3,14'),
  DictionaryTerm('Verdad', 'Aquello que corresponde plenamente a la realidad y al carácter de Dios; su Palabra es verdad.', 'Escritura', 'Juan 14:6; 17:17'),
  DictionaryTerm('Vida eterna', 'Vida que procede de Dios y consiste en conocerle por medio de Jesucristo.', 'Salvación', 'Juan 17:3; 1 Juan 5:11-12'),
  DictionaryTerm('Comunión', 'Participación y relación compartida entre Dios y los creyentes, y entre los miembros de la Iglesia.', 'Iglesia', '1 Corintios 1:9; 1 Juan 1:3'),
  DictionaryTerm('Concupiscencia', 'Deseo desordenado que puede conducir al pecado cuando gobierna la voluntad.', 'Ética bíblica', 'Santiago 1:14-15; 1 Juan 2:16'),
  DictionaryTerm('Discernimiento', 'Capacidad de evaluar enseñanzas y conductas a la luz de la verdad revelada.', 'Doctrina', 'Hebreos 5:14; 1 Juan 4:1'),
  DictionaryTerm('Elección', 'Propósito soberano de Dios al escoger en Cristo conforme a su voluntad y gracia.', 'Salvación', 'Efesios 1:4-5; Romanos 8:29-30'),
  DictionaryTerm('Evangelio', 'Buena noticia de la obra salvadora de Dios en la muerte y resurrección de Jesucristo.', 'Salvación', '1 Corintios 15:1-4; Romanos 1:16'),
  DictionaryTerm('Expiación', 'Obra sacrificial de Cristo por la que se trata con el pecado y se abre el camino de reconciliación.', 'Salvación', 'Hebreos 9:26; 1 Pedro 2:24'),
  DictionaryTerm('Fe apostólica', 'Contenido del evangelio entregado por los apóstoles y recibido por la Iglesia.', 'Doctrina', 'Judas 3; Hechos 2:42'),
  DictionaryTerm('Glorificación', 'Consumación de la salvación cuando los creyentes serán transformados plenamente a semejanza de Cristo.', 'Salvación', 'Romanos 8:30; Filipenses 3:20-21'),
  DictionaryTerm('Imputación', 'Atribución o reconocimiento legal; Pablo explica que la justicia es contada al que cree.', 'Salvación', 'Romanos 4:3-8; 2 Corintios 5:21'),
  DictionaryTerm('Mediador', 'Aquel que interviene para reconciliar; Jesucristo es el único mediador entre Dios y los seres humanos.', 'Cristología', '1 Timoteo 2:5; Hebreos 8:6'),
  DictionaryTerm('Mesías', 'Título de origen hebreo equivalente a Cristo: el Ungido prometido por Dios.', 'Cristología', 'Salmo 2:2; Juan 1:41'),
  DictionaryTerm('Pacto', 'Compromiso establecido por Dios que expresa su relación y promesas hacia su pueblo.', 'Teología bíblica', 'Génesis 17:7; Lucas 22:20'),
  DictionaryTerm('Presciencia', 'Conocimiento previo de Dios; debe interpretarse atendiendo al uso de cada pasaje.', 'Teología', 'Hechos 2:23; 1 Pedro 1:2'),
  DictionaryTerm('Reconciliación', 'Restablecimiento de la relación con Dios por medio de la muerte de Jesucristo.', 'Salvación', 'Romanos 5:10-11; 2 Corintios 5:18-19'),
  DictionaryTerm('Resurrección', 'Levantamiento de entre los muertos; Jesucristo resucitó corporalmente y es primicia de los creyentes.', 'Cristología', 'Lucas 24:39; 1 Corintios 15:20-22'),
  DictionaryTerm('Unigénito', 'Término bíblico que expresa la singularidad de la relación del Hijo con el Padre.', 'Cristología', 'Juan 1:14,18; 3:16'),
  DictionaryTerm('Paráclito', 'Término griego usado para el Consolador o Ayudador prometido por Jesús, referido al Espíritu Santo.', 'Trinidad', 'Juan 14:16,26; 15:26'),

  ...additionalDictionaryEntries.map((entry) => DictionaryTerm(
        entry['term']!,
        entry['definition']!,
        entry['category']!,
        entry['references']!,
        context: entry['context']!,
      )),
  ...dictionaryTranche02.map((entry) => DictionaryTerm(
        entry['term']!,
        entry['definition']!,
        entry['category']!,
        entry['references']!,
        context: entry['context']!,
      )),
  ...dictionaryTranche03.map((entry) => DictionaryTerm(
        entry['term']!,
        entry['definition']!,
        entry['category']!,
        entry['references']!,
        context: entry['context']!,
      )),
  ...dictionaryTranche04.map((entry) => DictionaryTerm(
        entry['term']!,
        entry['definition']!,
        entry['category']!,
        entry['references']!,
        context: entry['context']!,
      )),
  ...dictionaryTranche05.map((entry) => DictionaryTerm(
        entry['term']!,
        entry['definition']!,
        entry['category']!,
        entry['references']!,
        context: entry['context']!,
      )),
  ...dictionaryTranche06.map((entry) => DictionaryTerm(
        entry['term']!,
        entry['definition']!,
        entry['category']!,
        entry['references']!,
        context: entry['context']!,
      )),
  ...dictionaryTranche07.map((entry) => DictionaryTerm(
        entry['term']!,
        entry['definition']!,
        entry['category']!,
        entry['references']!,
        context: entry['context']!,
      )),
  ...dictionaryTranche08.map((entry) => DictionaryTerm(
        entry['term']!,
        entry['definition']!,
        entry['category']!,
        entry['references']!,
        context: entry['context']!,
      )),
];

class DiccionarioTab extends StatefulWidget {
  const DiccionarioTab({super.key});

  @override
  State<DiccionarioTab> createState() => _DiccionarioTabState();
}

class _DiccionarioTabState extends State<DiccionarioTab> {
  String query = '';
  String category = 'Todas';

  List<String> get categories {
    final values = dictionaryTerms.map((term) => term.category).toSet().toList()
      ..sort();
    return ['Todas', ...values];
  }

  @override
  Widget build(BuildContext context) {
    final normalized = _dictionarySortKey(query.trim());
    final filtered = dictionaryTerms.where((term) {
      final matchesCategory = category == 'Todas' || term.category == category;
      final searchableText = _dictionarySortKey([
        term.term,
        term.definition,
        term.references,
        term.context,
        baseDictionaryContexts[term.term] ?? '',
      ].join(' '));
      final matchesQuery = normalized.isEmpty || searchableText.contains(normalized);
      return matchesCategory && matchesQuery;
    }).toList()
      ..sort((a, b) => _dictionarySortKey(a.term).compareTo(_dictionarySortKey(b.term)));

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const Text(
          'Diccionario teológico',
          style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 5),
        Text(
          normalized.isEmpty
              ? '${dictionaryTerms.length} términos disponibles'
              : '${filtered.length} resultados de ${dictionaryTerms.length} términos',
          style: const TextStyle(color: Colors.black54),
        ),
        const SizedBox(height: 14),
        TextField(
          onChanged: (value) => setState(() => query = value),
          decoration: InputDecoration(
            hintText: 'Buscar término, concepto o referencia...',
            prefixIcon: const Icon(Icons.search),
            suffixIcon: query.isEmpty
                ? null
                : IconButton(
                    tooltip: 'Limpiar búsqueda',
                    icon: const Icon(Icons.close),
                    onPressed: () => setState(() => query = ''),
                  ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
            ),
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 42,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            separatorBuilder: (_, __) => const SizedBox(width: 7),
            itemBuilder: (context, index) {
              final item = categories[index];
              return ChoiceChip(
                label: Text(item),
                selected: category == item,
                onSelected: (_) => setState(() => category = item),
              );
            },
          ),
        ),
        const SizedBox(height: 10),
        if (filtered.isEmpty)
          const Padding(
            padding: EdgeInsets.all(28),
            child: Center(child: Text('No se encontraron términos.')),
          )
        else
          for (final term in filtered)
            Card(
              margin: const EdgeInsets.only(bottom: 8),
              child: ExpansionTile(
                title: Text(
                  term.term,
                  style: const TextStyle(fontWeight: FontWeight.w700),
                ),
                subtitle: Text(term.category),
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(term.definition),
                        if (term.context.isNotEmpty || baseDictionaryContexts.containsKey(term.term)) ...[
                          const SizedBox(height: 10),
                          const Text(
                            'Contexto en los estudios',
                            style: TextStyle(fontWeight: FontWeight.w700),
                          ),
                          const SizedBox(height: 4),
                          Text(term.context.isNotEmpty ? term.context : baseDictionaryContexts[term.term]!),
                        ],
                        const SizedBox(height: 9),
                        Text(
                          'Referencias bíblicas: ' + term.references,
                          style: const TextStyle(
                            color: Color(0xFF14243A),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
      ],
    );
  }
}

// Banco de evaluaciones separado para mantener este archivo principal modular.
class DefensaDoc {
  final String id;
  final String title;
  final String file;
  final String content;
  const DefensaDoc({required this.id, required this.title, required this.file, required this.content});
}

class DefensaRepository {
  static Future<List<DefensaDoc>>? _cached;
  static Future<List<DefensaDoc>> loadAll() => _cached ??= _loadAll();

  static Future<List<DefensaDoc>> _loadAll() async {
    final raw = await rootBundle.loadString('assets/defensa_doctrinal/indice.json');
    final entries = (jsonDecode(raw) as List).cast<Map<String, dynamic>>();
    if (entries.length != 100) {
      throw StateError('Se esperaban 100 estudios de Defensa y se encontraron ${entries.length}.');
    }
    final docs = await Future.wait(entries.map((entry) async {
      final file = entry['file'] as String;
      final id = entry['id'] as String;
      final content = await rootBundle.loadString('assets/defensa_doctrinal/$file');
      final firstLine = content.split('\n').first.trim();
      final title = firstLine.replaceFirst(RegExp(r'^#\s*(?:Estudio\s+\d+[.:]?\s*|D-\d{3}[.:]?\s*)', caseSensitive: false), '').trim();
      return DefensaDoc(id: id, title: title.isEmpty ? file : title, file: file, content: content);
    }));
    docs.sort((a,b) => a.id.compareTo(b.id));
    return docs;
  }
}

class DefensaDoctrinalPage extends StatefulWidget {
  const DefensaDoctrinalPage({super.key});
  @override
  State<DefensaDoctrinalPage> createState() => _DefensaDoctrinalPageState();
}

class _DefensaDoctrinalPageState extends State<DefensaDoctrinalPage> {
  final _search = TextEditingController();
  late final Future<List<DefensaDoc>> _docs = DefensaRepository.loadAll();
  @override
  void dispose() { _search.dispose(); super.dispose(); }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Defensa de la doctrina')),
    body: FutureBuilder<List<DefensaDoc>>(
      future: _docs,
      builder: (context, snapshot) {
        if (snapshot.hasError) return const Center(child: Padding(
          padding: EdgeInsets.all(24), child: Text('No se pudieron cargar los estudios. Comprueba los recursos de la aplicación.')));
        if (!snapshot.hasData) return const Center(child: CircularProgressIndicator());
        final all = snapshot.data!;
        final q = _dictionarySortKey(_search.text.trim());
        final results = all.where((doc) => q.isEmpty ||
          _dictionarySortKey(doc.id).contains(q) ||
          _dictionarySortKey(doc.title).contains(q) ||
          _dictionarySortKey(doc.content).contains(q)).toList();
        return Column(children: [
          Container(
            margin: const EdgeInsets.fromLTRB(16,16,16,12),
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(color: const Color(0xFF14243A), borderRadius: BorderRadius.circular(18)),
            child: const Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Icon(Icons.shield_outlined, color: Color(0xFFD5B46A), size: 32),
              SizedBox(width: 12),
              Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text('100 ESTUDIOS DE DEFENSA', style: TextStyle(color: Color(0xFFD5B46A), fontWeight: FontWeight.bold, letterSpacing: .7)),
                SizedBox(height: 6),
                Text('Investigación bíblica, histórica y respuesta doctrinal.', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600)),
              ])),
            ]),
          ),
          Padding(padding: const EdgeInsets.fromLTRB(16,0,16,10), child: TextField(
            controller: _search, onChanged: (_) => setState(() {}),
            decoration: InputDecoration(hintText: 'Buscar en los 100 estudios...',
              prefixIcon: const Icon(Icons.search),
              suffixIcon: _search.text.isEmpty ? null : IconButton(
                onPressed: () { _search.clear(); setState(() {}); }, icon: const Icon(Icons.close)),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(14))),
          )),
          Padding(padding: const EdgeInsets.fromLTRB(18,0,18,8), child: Align(
            alignment: Alignment.centerLeft, child: Text(results.length.toString() + ' de 100 estudios',
              style: const TextStyle(color: Color(0xFF526174), fontWeight: FontWeight.w600)))),
          Expanded(child: results.isEmpty
            ? const Center(child: Padding(
              padding: EdgeInsets.all(24),
              child: Text('No encontramos ese estudio. Prueba con otra palabra o número.',
                textAlign: TextAlign.center),
            ))
            : ListView.separated(
              padding: const EdgeInsets.fromLTRB(16,0,16,20), itemCount: results.length,
              separatorBuilder: (_,__) => const SizedBox(height: 7),
              itemBuilder: (context,i) {
                final doc = results[i];
                return Card(child: ListTile(
                  leading: CircleAvatar(backgroundColor: const Color(0xFFE9DFC8),
                    foregroundColor: const Color(0xFF14243A),
                    child: Text(doc.id.substring(2))),
                  title: Text(doc.title, maxLines: 2, overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontWeight: FontWeight.w700)),
                  subtitle: const Text('Estudio de Defensa de la doctrina'),
                  trailing: ValueListenableBuilder<Set<String>>(
                    valueListenable: SavedStudyStore.saved,
                    builder: (context,saved,_) {
                      final active = saved.contains(doc.id);
                      return IconButton(
                        tooltip: active ? 'Quitar de guardados' : 'Guardar estudio',
                        onPressed: () => SavedStudyStore.toggle(doc.id),
                        icon: Icon(active ? Icons.bookmark : Icons.bookmark_border,
                          color: active ? const Color(0xFF14243A) : Colors.black54));
                    }),
                  onTap: () => Navigator.push(context, MaterialPageRoute(
                    builder: (_) => DefensaStudyDetailPage(doc: doc))),
                ));
              },
            )),
        ]);
      },
    ),
  );
}

class DefensaStudyDetailPage extends StatelessWidget {
  final DefensaDoc doc;
  const DefensaStudyDetailPage({super.key, required this.doc});

  List<Widget> _renderContent() {
    final lines = doc.content.split('\n');
    final widgets = <Widget>[];
    for (final raw in lines) {
      final line = raw.trim();
      if (line.isEmpty) { widgets.add(const SizedBox(height: 7)); continue; }
      if (line.startsWith('#')) {
        final heading = line.replaceFirst(RegExp(r'^#+\s*'), '').replaceAll('**','');
        widgets.add(Padding(padding: const EdgeInsets.only(top: 12,bottom: 5),
          child: Text(heading, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold,
            color: Color(0xFF14243A)))));
      } else {
        final paragraph = line.replaceAll('**','').replaceAll(RegExp(r'^[-*]\s+'), '• ');
        widgets.add(SelectableText(paragraph, style: const TextStyle(fontSize: 15, height: 1.6)));
      }
    }
    return widgets;
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: Text(doc.title, maxLines: 1, overflow: TextOverflow.ellipsis),
      actions: [ValueListenableBuilder<Set<String>>(
        valueListenable: SavedStudyStore.saved,
        builder: (context,saved,_) {
          final active = saved.contains(doc.id);
          return IconButton(tooltip: active ? 'Quitar de guardados' : 'Guardar estudio',
            onPressed: () => SavedStudyStore.toggle(doc.id),
            icon: Icon(active ? Icons.bookmark : Icons.bookmark_border,
              color: active ? const Color(0xFFD5B46A) : null));
        })]),
    body: ListView(padding: const EdgeInsets.all(20), children: [
      Container(padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(color: const Color(0xFF14243A), borderRadius: BorderRadius.circular(16)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('DEFENSA DOCTRINAL · ESTUDIO ' + doc.id.substring(2),
            style: const TextStyle(color: Color(0xFFD5B46A), fontWeight: FontWeight.bold, letterSpacing: .6)),
          const SizedBox(height: 8),
          Text(doc.title, style: const TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
        ])),
      const SizedBox(height: 14),
      ..._renderContent(),
    ]),
  );
}

class CuestionariosTab extends StatefulWidget {
  const CuestionariosTab({super.key});

  @override
  State<CuestionariosTab> createState() => _CuestionariosTabState();
}

class _CuestionariosTabState extends State<CuestionariosTab> {
  QuizPack? selectedPack;
  int questionIndex = 0;
  int? selectedAnswer;
  int correctAnswers = 0;
  bool answered = false;
  bool showReview = false;
  List<int?> answerHistory = [];

  void _start(QuizPack pack) {
    // Segunda barrera en tiempo de ejecución: ninguna evaluación puede
    // presentar dos veces la misma pregunta, aunque el origen tenga duplicados.
    final questions = uniqueQuizQuestions(pack.questions);
    final safePack = QuizPack(
      title: pack.title,
      description: pack.description,
      questions: questions,
      difficulty: pack.difficulty,
      source: pack.source,
    );

    setState(() {
      selectedPack = safePack;
      questionIndex = 0;
      selectedAnswer = null;
      correctAnswers = 0;
      answered = false;
      showReview = false;
      answerHistory = List<int?>.filled(questions.length, null);
    });
  }

  void _choose(int index) {
    if (answered) return;
    setState(() {
      selectedAnswer = index;
      answered = true;
      answerHistory[questionIndex] = index;
      if (index == selectedPack!.questions[questionIndex].correctIndex) {
        correctAnswers++;
      }
    });
  }

  void _next() {
    if (questionIndex + 1 >= selectedPack!.questions.length) {
      setState(() {
        questionIndex = selectedPack!.questions.length;
      });
    } else {
      setState(() {
        questionIndex++;
        selectedAnswer = null;
        answered = false;
      });
    }
  }

  Widget _buildReviewCard(QuizPack pack, int index) {
    final question = pack.questions[index];
    final selected = answerHistory[index];
    final selectedText = selected == null
        ? 'Sin responder'
        : question.options[selected];
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Pregunta ${index + 1}: ${question.question}',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text('Tu respuesta: $selectedText'),
            Text('Respuesta correcta: ${question.options[question.correctIndex]}'),
            const SizedBox(height: 8),
            Text(question.explanation),
            const SizedBox(height: 6),
            Text(
              'Lee: ${question.references}',
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                color: Color(0xFF14243A),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final pack = selectedPack;
    if (pack == null) {
      return ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text('Evaluaciones bíblicas', style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold)),
          const SizedBox(height: 6),
          const Text('Selecciona una evaluación. Cada respuesta incluye explicación y referencias bíblicas.'),
          const SizedBox(height: 16),
          for (final item in quizPacks)
            Card(
              child: ListTile(
                leading: const CircleAvatar(
                  backgroundColor: Color(0xFFE9DFC8),
                  child: Icon(Icons.quiz, color: Color(0xFF14243A)),
                ),
                title: Text(item.title, style: const TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text(item.description + '\n' + item.questions.length.toString() + ' preguntas · ' + item.difficulty + '\n' + item.source),
                isThreeLine: true,
                trailing: const Icon(Icons.chevron_right),
                onTap: () => _start(item),
              ),
            ),
        ],
      );
    }

    if (questionIndex >= pack.questions.length) {
      final percent = (correctAnswers / pack.questions.length * 100).round();
      return CustomScrollView(
        key: PageStorageKey<String>('quiz-result-${pack.title}'),
        primary: true,
        physics: const AlwaysScrollableScrollPhysics(),
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(24, 24, 24, 8),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                const SizedBox(height: 12),
                const Icon(Icons.emoji_events_outlined, size: 64, color: Color(0xFFD5B46A)),
                const SizedBox(height: 12),
                const Text(
                  'Evaluación completada',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(pack.title, textAlign: TextAlign.center),
                const SizedBox(height: 16),
                Text(
                  correctAnswers.toString() + ' de ' + pack.questions.length.toString() + ' respuestas correctas',
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                ),
                Center(child: Text('Resultado: ' + percent.toString() + '%')),
                Center(
                  child: TextButton(
                    onPressed: () => setState(() => showReview = !showReview),
                    child: Text(showReview ? 'Ocultar respuestas' : 'Ver respuestas'),
                  ),
                ),
              ]),
            ),
          ),
          if (showReview)
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) => _buildReviewCard(pack, index),
                  childCount: pack.questions.length,
                ),
              ),
            ),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(24, 8, 24, 32),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                const SizedBox(height: 12),
                FilledButton(
                  onPressed: () => _start(pack),
                  child: const Text('Repetir evaluación'),
                ),
                Center(
                  child: TextButton(
                    onPressed: () => setState(() => selectedPack = null),
                    child: const Text('Volver a evaluaciones'),
                  ),
                ),
              ]),
            ),
          ),
        ],
      );
    }

    final question = pack.questions[questionIndex];
    final isCorrect = selectedAnswer == question.correctIndex;
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Row(
          children: [
            Expanded(child: Text(pack.title, style: const TextStyle(fontWeight: FontWeight.bold))),
            Text((questionIndex + 1).toString() + '/' + pack.questions.length.toString()),
          ],
        ),
        const SizedBox(height: 10),
        LinearProgressIndicator(value: (questionIndex + 1) / pack.questions.length),
        const SizedBox(height: 20),
        Text('Pregunta ' + (questionIndex + 1).toString(), style: const TextStyle(color: Color(0xFF8A6B32), fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        Text(question.question, style: const TextStyle(fontSize: 19, fontWeight: FontWeight.bold)),
        const SizedBox(height: 16),
        for (var i = 0; i < question.options.length; i++)
          Card(
            color: answered && i == question.correctIndex
                ? const Color(0xFFE3F2E5)
                : answered && i == selectedAnswer && !isCorrect
                    ? const Color(0xFFFCE8E6)
                    : null,
            child: ListTile(
              leading: CircleAvatar(child: Text(String.fromCharCode(65 + i))),
              title: Text(question.options[i]),
              trailing: answered && i == question.correctIndex
                  ? const Icon(Icons.check_circle, color: Colors.green)
                  : answered && i == selectedAnswer
                      ? const Icon(Icons.cancel, color: Colors.red)
                      : null,
              onTap: answered ? null : () => _choose(i),
            ),
          ),
        if (answered) ...[
          const SizedBox(height: 12),
          Card(
            color: const Color(0xFFEFE9DC),
            child: Padding(
              padding: const EdgeInsets.all(14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(isCorrect ? '¡Respuesta correcta!' : 'Respuesta incorrecta', style: const TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 6),
                  Text(question.explanation),
                  const SizedBox(height: 8),
                  Text('Lee: ' + question.references, style: const TextStyle(fontWeight: FontWeight.w600, color: Color(0xFF14243A))),
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),
          FilledButton(
            key: const ValueKey('quiz-next-button'),
            onPressed: _next,
            child: Text(questionIndex + 1 == pack.questions.length ? 'Ver resultado' : 'Siguiente pregunta'),
          ),
        ],
        TextButton(onPressed: () => setState(() => selectedPack = null), child: const Text('Salir de la evaluación')),
      ],
    );
  }
}

class GuardadosTab extends StatelessWidget {
  const GuardadosTab({super.key});

  @override
  Widget build(BuildContext context) => ValueListenableBuilder<Set<String>>(
    valueListenable: SavedStudyStore.saved,
    builder: (context, saved, _) {
      final mainItems = EstudiosTab.studies
          .where((study) => saved.contains(study.number))
          .toList();
      final defenseIds = saved.where((id) => id.startsWith('D-')).toSet();

      if (saved.isEmpty) {
        return const Center(
          child: Padding(
            padding: EdgeInsets.all(28),
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              Icon(Icons.bookmark_border, size: 58, color: Color(0xFF14243A)),
              SizedBox(height: 14),
              Text('Todavía no tienes estudios guardados',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center),
              SizedBox(height: 8),
              Text('Abre cualquier estudio y pulsa el marcador para añadirlo aquí.',
                textAlign: TextAlign.center),
            ]),
          ),
        );
      }

      final defenseFuture = defenseIds.isEmpty
          ? Future<List<DefensaDoc>>.value(<DefensaDoc>[])
          : DefensaRepository.loadAll();

      return FutureBuilder<List<DefensaDoc>>(
        future: defenseFuture,
        builder: (context, snapshot) {
          final defenseItems = snapshot.data
                  ?.where((doc) => defenseIds.contains(doc.id))
                  .toList() ??
              <DefensaDoc>[];
          final loadingDefense = defenseIds.isNotEmpty &&
              !snapshot.hasData && !snapshot.hasError;

          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              if (mainItems.isNotEmpty) ...[
                const Text('ESTUDIOS BÍBLICOS',
                  style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF14243A))),
                const SizedBox(height: 8),
                for (final study in mainItems)
                  Card(child: ListTile(
                    leading: CircleAvatar(child: Text(study.number)),
                    title: Text(study.title, maxLines: 2, overflow: TextOverflow.ellipsis),
                    subtitle: Text(study.subtitle, maxLines: 2, overflow: TextOverflow.ellipsis),
                    onTap: () => Navigator.push(context, MaterialPageRoute(
                      builder: (_) => StudyDetailPage(study: study))),
                    trailing: IconButton(
                      tooltip: 'Quitar de guardados',
                      onPressed: () => SavedStudyStore.toggle(study.number),
                      icon: const Icon(Icons.bookmark_remove_outlined)),
                  )),
              ],
              if (defenseIds.isNotEmpty) ...[
                const SizedBox(height: 14),
                const Text('DEFENSA DE LA DOCTRINA',
                  style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF14243A))),
                const SizedBox(height: 8),
                if (loadingDefense)
                  const Padding(padding: EdgeInsets.all(16),
                    child: Center(child: CircularProgressIndicator())),
                if (snapshot.hasError)
                  const Padding(padding: EdgeInsets.all(12),
                    child: Text('No se pudieron cargar los estudios guardados de Defensa.')),
                for (final doc in defenseItems)
                  Card(child: ListTile(
                    leading: CircleAvatar(child: Text(doc.id.substring(2))),
                    title: Text(doc.title, maxLines: 2, overflow: TextOverflow.ellipsis),
                    subtitle: const Text('Estudio de Defensa de la doctrina'),
                    onTap: () => Navigator.push(context, MaterialPageRoute(
                      builder: (_) => DefensaStudyDetailPage(doc: doc))),
                    trailing: IconButton(
                      tooltip: 'Quitar de guardados',
                      onPressed: () => SavedStudyStore.toggle(doc.id),
                      icon: const Icon(Icons.bookmark_remove_outlined)),
                  )),
              ],
              if (mainItems.isEmpty && defenseItems.isEmpty && !loadingDefense &&
                  !snapshot.hasError)
                const Padding(padding: EdgeInsets.all(20),
                  child: Text('No hay estudios disponibles en esta lista.')),
            ],
          );
        },
      );
    },
  );
}

class FeatureTile extends StatelessWidget {
const FeatureTile({
super.key,
required this.icon,
required this.title,
required this.subtitle,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

@override
Widget build(BuildContext context) {
return Card(
child: ListTile(
      onTap: onTap,
      leading: Icon(
icon,
color: const Color(0xFF14243A),
size: 28,
),
title: Text(
title,
style: const TextStyle(fontWeight: FontWeight.w600),
),
subtitle: Text(subtitle),
trailing: const Icon(Icons.arrow_forward_ios, size: 15),
),
);
}
}

class SectionHeading extends StatelessWidget {
const SectionHeading(this.title, {super.key});

final String title;

@override
Widget build(BuildContext context) => Text(
title,
style: const TextStyle(
fontSize: 19,
fontWeight: FontWeight.bold,
),
);
}

class HomeBannerAd extends StatefulWidget {
const HomeBannerAd({super.key});

@override
State<HomeBannerAd> createState() => _HomeBannerAdState();
}

class _HomeBannerAdState extends State<HomeBannerAd> {
BannerAd? _bannerAd;
bool _isLoaded = false;

// Producción usa la unidad real. Las compilaciones debug conservan el ID
// de prueba oficial para evitar tráfico publicitario inválido durante el desarrollo.
// La cuenta de AdMob y los pagos deben estar a nombre de un adulto responsable.
static const String _bannerAdUnitId = kReleaseMode
    ? 'ca-app-pub-3642704038738168/1480914570'
    : 'ca-app-pub-3940256099942544/6300978111';

Future<void> _loadBanner() async {
  final initialized = await _initializeAdsSafely();
  if (!initialized || !mounted) return;

  try {
    final banner = BannerAd(
      adUnitId: _bannerAdUnitId,
      size: AdSize.banner,
      request: const AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          if (!mounted) {
            ad.dispose();
            return;
          }
          setState(() {
            _bannerAd = ad as BannerAd;
            _isLoaded = true;
          });
        },
        onAdFailedToLoad: (ad, error) {
          ad.dispose();
          if (identical(_bannerAd, ad)) {
            _bannerAd = null;
            _isLoaded = false;
          }
          debugPrint('No se pudo cargar el anuncio: $error');
        },
      ),
    );

    _bannerAd = banner;
    await banner.load();
  } catch (error, stackTrace) {
    _bannerAd?.dispose();
    _bannerAd = null;
    _isLoaded = false;
    debugPrint('Se omitió el banner por un error de inicialización: $error');
    debugPrintStack(stackTrace: stackTrace);
  }
}

@override
void initState() {
super.initState();
_loadBanner();
}

@override
void dispose() {
_bannerAd?.dispose();
super.dispose();
}

@override
Widget build(BuildContext context) {
if (!_isLoaded || _bannerAd == null) {
return const SizedBox.shrink();
}

return Container(
alignment: Alignment.center,
width: double.infinity,
height: _bannerAd!.size.height.toDouble(),
child: AdWidget(ad: _bannerAd!),
);
}
}