part of '../../main.dart';

class DiccionarioTab extends StatelessWidget {
const DiccionarioTab({super.key});

@override
Widget build(BuildContext context) {
const List<(String, String)> terms = [
('Atributo', 'Cualidad o perfección que describe el ser y carácter de Dios.'),
('Doctrina', 'Enseñanza o conjunto de enseñanzas que se presentan como verdad.'),
('Exégesis', 'Análisis cuidadoso de un texto para comprender su sentido.'),
('Gracia', 'Favor de Dios que no se obtiene como mérito humano.'),
('Justificación', 'Acto por el cual Dios declara justo al pecador que cree en Cristo.'),
('Revelación', 'Acción por la que Dios se da a conocer.'),
];

return ListView(
padding: const EdgeInsets.all(16),
children: [
const Text(
'Términos teológicos',
style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
),
const SizedBox(height: 12),
for (final term in terms)
Card(
child: ExpansionTile(
title: Text(
term.$1,
style: const TextStyle(fontWeight: FontWeight.w600),
),
children: [
Padding(
padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
child: Align(
alignment: Alignment.centerLeft,
child: Text(term.$2),
),
),
],
),
),
],
);
}
}
