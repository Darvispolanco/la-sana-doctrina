part of '../../main.dart';

class InicioTab extends StatelessWidget {
const InicioTab({super.key, required this.onNavigate});

final ValueChanged<int> onNavigate;

@override
Widget build(BuildContext context) {
return ListView(
padding: const EdgeInsets.all(18),
children: [
Container(
padding: const EdgeInsets.all(22),
decoration: BoxDecoration(
color: const Color(0xFF14243A),
borderRadius: BorderRadius.circular(22),
),
child: const Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Icon(Icons.menu_book, color: Color(0xFFD5B46A), size: 36),
SizedBox(height: 14),
Text(
'CONOCIENDO MÁS DE DIOS',
style: TextStyle(
color: Color(0xFFD5B46A),
fontSize: 12,
letterSpacing: 1.3,
fontWeight: FontWeight.bold,
),
),
SizedBox(height: 8),
Text(
'Crecer en la verdad de las Escrituras.',
style: TextStyle(
color: Colors.white,
fontSize: 23,
fontWeight: FontWeight.bold,
),
),
SizedBox(height: 12),
Text(
'“Pero tú habla lo que está de acuerdo con la sana doctrina”.',
style: TextStyle(
color: Colors.white70,
fontStyle: FontStyle.italic,
),
),
SizedBox(height: 5),
Text(
'Tito 2:1',
style: TextStyle(
color: Color(0xFFD5B46A),
fontWeight: FontWeight.bold,
),
),
],
),
),
const SizedBox(height: 22),
const SectionHeading('Explora la aplicación'),
const SizedBox(height: 10),
FeatureTile(
icon: Icons.menu_book,
title: 'Estudios bíblicos',
subtitle: 'Aprende doctrina paso a paso.',
onTap: () => onNavigate(1),
),
FeatureTile(
icon: Icons.search,
title: 'Diccionario teológico',
subtitle: 'Consulta términos y conceptos bíblicos.',
onTap: () => onNavigate(2),
),
FeatureTile(
icon: Icons.quiz,
title: 'Cuestionarios',
subtitle: 'Repasa lo aprendido.',
onTap: () => onNavigate(3),
),
FeatureTile(
icon: Icons.shield_outlined,
title: 'Defensa de la Sana Doctrina',
subtitle: 'Examina y responde enseñanzas a la luz de las Escrituras.',
onTap: () => Navigator.push(
  context,
  MaterialPageRoute(
    builder: (_) => const DefensaSanaDoctrinaPage(),
  ),
),
),
const SizedBox(height: 12),
const Text(
'Versión inicial de desarrollo · El contenido se incorporará por etapas.',
textAlign: TextAlign.center,
style: TextStyle(color: Colors.black54, fontSize: 12),
),
const SizedBox(height: 16),
const HomeBannerAd(),
],
);
}
}
