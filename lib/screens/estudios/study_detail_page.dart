part of '../../main.dart';

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
