part of '../../main.dart';

class GuardadosTab extends StatelessWidget {
const GuardadosTab({super.key});

@override
Widget build(BuildContext context) {
return const Center(
child: Padding(
padding: EdgeInsets.all(28),
child: Column(
mainAxisSize: MainAxisSize.min,
children: [
Icon(
Icons.bookmark_border,
size: 58,
color: Color(0xFF14243A),
),
SizedBox(height: 14),
Text(
'Tus estudios guardados',
style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
),
SizedBox(height: 8),
Text(
'Aquí aparecerán los estudios y versículos que marques como favoritos.',
textAlign: TextAlign.center,
),
],
),
),
);
}
}
