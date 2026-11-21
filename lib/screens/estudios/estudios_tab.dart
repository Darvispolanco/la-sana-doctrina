part of '../../main.dart';

class EstudiosTab extends StatelessWidget {
const EstudiosTab({super.key});

static const studies = studyCatalog;

@override
Widget build(BuildContext context) {
return ListView(
padding: const EdgeInsets.all(16),
children: [
const Text(
'150 estudios bíblicos',
style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
),
const SizedBox(height: 6),
const Text(
'Catálogo principal de 150 estudios bíblicos. La defensa doctrinal y los 100 temas apologéticos se encuentran en su apartado independiente.',
),
const SizedBox(height: 14),
for (final study in studies)
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
trailing: const Icon(Icons.chevron_right),
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
