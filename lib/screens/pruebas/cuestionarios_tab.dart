part of '../../main.dart';

class CuestionariosTab extends StatelessWidget {
const CuestionariosTab({super.key});

@override
Widget build(BuildContext context) {
return Center(
child: Padding(
padding: const EdgeInsets.all(28),
child: Column(
mainAxisSize: MainAxisSize.min,
children: [
const Icon(
Icons.quiz_outlined,
size: 58,
color: Color(0xFF14243A),
),
const SizedBox(height: 14),
const Text(
'Evaluaciones bíblicas',
style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
),
const SizedBox(height: 8),
const Text(
'Aquí estarán los cuestionarios por tema, con preguntas, respuestas y explicación bíblica.',
textAlign: TextAlign.center,
),
const SizedBox(height: 16),
FilledButton(
onPressed: () => _showComingSoon(context, 'Cuestionarios'),
child: const Text('Próximamente'),
),
],
),
),
);
}
}
