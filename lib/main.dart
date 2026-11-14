import 'package:flutter/material.dart';

void main() {
  runApp(const SanaDoctrinaApp());
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

  static const pages = <Widget>[
    InicioTab(),
    EstudiosTab(),
    DiccionarioTab(),
    CuestionariosTab(),
    GuardadosTab(),
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
        title: Text(titles[selectedIndex],
            style: const TextStyle(fontWeight: FontWeight.w700)),
      ),
      body: SafeArea(child: pages[selectedIndex]),
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        onDestinationSelected: (value) =>
            setState(() => selectedIndex = value),
        destinations: const [
          NavigationDestination(
              icon: Icon(Icons.home_outlined),
              selectedIcon: Icon(Icons.home),
              label: 'Inicio'),
          NavigationDestination(
              icon: Icon(Icons.menu_book_outlined),
              selectedIcon: Icon(Icons.menu_book),
              label: 'Estudios'),
          NavigationDestination(
              icon: Icon(Icons.auto_stories_outlined),
              selectedIcon: Icon(Icons.auto_stories),
              label: 'Diccionario'),
          NavigationDestination(
              icon: Icon(Icons.quiz_outlined),
              selectedIcon: Icon(Icons.quiz),
              label: 'Pruebas'),
          NavigationDestination(
              icon: Icon(Icons.bookmark_border),
              selectedIcon: Icon(Icons.bookmark),
              label: 'Guardados'),
        ],
      ),
    );
  }
}

class InicioTab extends StatelessWidget {
  const InicioTab({super.key});

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
              Text('CONOCIENDO MÁS DE DIOS',
                  style: TextStyle(
                      color: Color(0xFFD5B46A),
                      fontSize: 12,
                      letterSpacing: 1.3,
                      fontWeight: FontWeight.bold)),
              SizedBox(height: 8),
              Text('Crecer en la verdad de las Escrituras.',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 23,
                      fontWeight: FontWeight.bold)),
              SizedBox(height: 12),
              Text(
                '“Pero tú habla lo que está de acuerdo con la sana doctrina”.',
                style: TextStyle(
                    color: Colors.white70, fontStyle: FontStyle.italic),
              ),
              SizedBox(height: 5),
              Text('Tito 2:1',
                  style: TextStyle(
                      color: Color(0xFFD5B46A),
                      fontWeight: FontWeight.bold)),
            ],
          ),
        ),
        const SizedBox(height: 22),
        const SectionHeading('Explora la aplicación'),
        const SizedBox(height: 10),
        const FeatureTile(
          icon: Icons.menu_book,
          title: 'Estudios bíblicos',
          subtitle: 'Aprende doctrina paso a paso.',
        ),
        const FeatureTile(
          icon: Icons.search,
          title: 'Diccionario teológico',
          subtitle: 'Consulta términos y conceptos bíblicos.',
        ),
        const FeatureTile(
          icon: Icons.quiz,
          title: 'Cuestionarios',
          subtitle: 'Repasa lo aprendido.',
        ),
        const FeatureTile(
          icon: Icons.headphones,
          title: 'Enseñanzas en audio',
          subtitle: 'Escucha lecciones cuando estén disponibles.',
        ),
        const SizedBox(height: 12),
        const Text(
          'Versión inicial de desarrollo · El contenido se incorporará por etapas.',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.black54, fontSize: 12),
        ),
      ],
    );
  }
}

class EstudiosTab extends StatelessWidget {
  const EstudiosTab({super.key});

  @override
  Widget build(BuildContext context) {
    const topics = [
      ('01', 'La naturaleza de Dios', 'La existencia, esencia y atributos de Dios.'),
      ('02', 'La doctrina de la Trinidad', 'Padre, Hijo y Espíritu Santo a la luz de la Biblia.'),
      ('03', 'La persona de Jesucristo', 'La divinidad, humanidad y obra de Cristo.'),
      ('04', 'La salvación', 'Gracia, fe, arrepentimiento y justificación.'),
      ('05', 'El Espíritu Santo', 'Su persona, obra, dones y fruto.'),
      ('06', 'La santidad cristiana', 'La vida transformada conforme a las Escrituras.'),
    ];
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const Text('Biblioteca de formación bíblica',
            style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold)),
        const SizedBox(height: 12),
        for (final topic in topics)
          Card(
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: const Color(0xFFE9DFC8),
                child: Text(topic.$1,
                    style: const TextStyle(
                        color: Color(0xFF14243A),
                        fontWeight: FontWeight.bold)),
              ),
              title: Text(topic.$2,
                  style: const TextStyle(fontWeight: FontWeight.w600)),
              subtitle: Text(topic.$3),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => _showComingSoon(context, topic.$2),
            ),
          ),
      ],
    );
  }
}

class DiccionarioTab extends StatelessWidget {
  const DiccionarioTab({super.key});

  @override
  Widget build(BuildContext context) {
    const terms = [
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
        const Text('Términos teológicos',
            style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold)),
        const SizedBox(height: 12),
        for (final term in terms)
          Card(
            child: ExpansionTile(
              title: Text(term.$1,
                  style: const TextStyle(fontWeight: FontWeight.w600)),
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                  child: Align(
                      alignment: Alignment.centerLeft, child: Text(term.$2)),
                )
              ],
            ),
          ),
      ],
    );
  }
}

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
            const Icon(Icons.quiz_outlined, size: 58, color: Color(0xFF14243A)),
            const SizedBox(height: 14),
            const Text('Evaluaciones bíblicas',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
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
            Icon(Icons.bookmark_border, size: 58, color: Color(0xFF14243A)),
            SizedBox(height: 14),
            Text('Tus estudios guardados',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text('Aquí aparecerán los estudios y versículos que marques como favoritos.',
                textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}

class FeatureTile extends StatelessWidget {
  const FeatureTile({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  final IconData icon;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(icon, color: const Color(0xFF14243A), size: 28),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
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
        style: const TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
      );
}

void _showComingSoon(BuildContext context, String feature) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text('$feature: módulo en desarrollo.')),
  );
}
