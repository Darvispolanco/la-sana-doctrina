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

  static const studies = <Study>[
    Study(
      number: '01',
      title: 'La naturaleza de Dios',
      subtitle: 'Conociendo su existencia, esencia y atributos.',
      introduction:
          'La Biblia presenta a Dios como el Creador, sustentador y Señor de todo lo que existe. Conocer quién es Dios constituye una base fundamental para comprender la fe cristiana.',
      sections: [
        StudySection(
          title: '1. Dios es eterno',
          content:
              'Dios no tiene principio ni final. No depende de la creación para existir. Su eternidad significa que siempre ha sido y siempre será. La existencia de todo lo creado depende de Él.',
          references: 'Salmos 90:2; Apocalipsis 1:8.',
        ),
        StudySection(
          title: '2. Dios es creador',
          content:
              'El universo no es presentado en las Escrituras como resultado de una obra independiente de Dios. Él es el origen de todas las cosas visibles e invisibles. La creación manifiesta su poder y sabiduría.',
          references: 'Génesis 1:1; Colosenses 1:16.',
        ),
        StudySection(
          title: '3. Los atributos de Dios',
          content:
              'Entre los atributos que la Biblia revela están su santidad, amor, justicia, misericordia, sabiduría y fidelidad. Estos atributos no son cualidades separadas de su ser: describen quién es Dios.',
          references: 'Isaías 6:3; 1 Juan 4:8; Salmos 89:14.',
        ),
      ],
      conclusion:
          'Conocer a Dios no consiste solamente en aprender conceptos. También implica reconocer su grandeza, confiar en su carácter y vivir conforme a su voluntad.',
    ),
    Study(
      number: '02',
      title: 'La doctrina de la Trinidad',
      subtitle: 'El Padre, el Hijo y el Espíritu Santo.',
      introduction:
          'La doctrina de la Trinidad enseña que existe un solo Dios y que el Padre, el Hijo y el Espíritu Santo son distinguidos personalmente en las Escrituras. No enseña tres dioses, sino un solo Dios.',
      sections: [
        StudySection(
          title: '1. Un solo Dios',
          content:
              'La fe bíblica afirma la unicidad de Dios. La doctrina cristiana de la Trinidad no contradice esta verdad, sino que procura comprenderla junto con la distinción entre el Padre, el Hijo y el Espíritu Santo.',
          references: 'Deuteronomio 6:4; Isaías 45:5.',
        ),
        StudySection(
          title: '2. El Padre, el Hijo y el Espíritu Santo',
          content:
              'En el bautismo de Jesús aparecen el Hijo siendo bautizado, el Espíritu descendiendo y la voz del Padre desde los cielos. El pasaje permite observar una distinción real entre ellos.',
          references: 'Mateo 3:16-17.',
        ),
        StudySection(
          title: '3. La fórmula bautismal',
          content:
              'Jesús mandó hacer discípulos y bautizarlos en el nombre del Padre, del Hijo y del Espíritu Santo. Este pasaje es uno de los textos fundamentales para el estudio trinitario.',
          references: 'Mateo 28:19; 2 Corintios 13:14.',
        ),
      ],
      conclusion:
          'La doctrina de la Trinidad debe estudiarse considerando el testimonio completo de las Escrituras, sin negar la existencia de un solo Dios ni confundir al Padre, al Hijo y al Espíritu Santo.',
    ),
    Study(
      number: '03',
      title: 'La persona de Jesucristo',
      subtitle: 'Su identidad, humanidad, divinidad y obra.',
      introduction:
          'Jesucristo ocupa el centro de la fe cristiana. Las Escrituras presentan su nacimiento, ministerio, muerte, resurrección y exaltación como acontecimientos fundamentales para la salvación.',
      sections: [
        StudySection(
          title: '1. El Verbo hecho carne',
          content:
              'El Evangelio de Juan enseña que el Verbo existía desde el principio y que se hizo carne. Jesucristo asumió verdadera humanidad sin dejar de ser quien es.',
          references: 'Juan 1:1-3, 14.',
        ),
        StudySection(
          title: '2. Jesús y su ministerio',
          content:
              'Jesús anunció el reino de Dios, enseñó con autoridad, mostró compasión y llamó a las personas al arrepentimiento y a la fe. Su ministerio revela el carácter y la misión que recibió del Padre.',
          references: 'Marcos 1:14-15; Lucas 4:18-19.',
        ),
        StudySection(
          title: '3. Su muerte y resurrección',
          content:
              'La muerte de Cristo y su resurrección constituyen el centro del anuncio apostólico. La esperanza cristiana descansa en que Jesús venció la muerte y vive.',
          references: '1 Corintios 15:3-4, 20-22.',
        ),
      ],
      conclusion:
          'Conocer a Jesucristo implica reconocer su identidad, confiar en su obra y seguir sus enseñanzas.',
    ),
    Study(
      number: '04',
      title: 'La salvación',
      subtitle: 'Gracia, arrepentimiento, fe y justificación.',
      introduction:
          'La salvación es la obra de Dios por la cual el ser humano recibe reconciliación con Él mediante Jesucristo. Las Escrituras enseñan que no se obtiene como recompensa por méritos humanos.',
      sections: [
        StudySection(
          title: '1. La necesidad de salvación',
          content:
              'El pecado afecta la relación del ser humano con Dios. La Biblia enseña que todos necesitan la gracia divina y que nadie puede justificarse delante de Dios por sus propios méritos.',
          references: 'Romanos 3:23; Romanos 6:23.',
        ),
        StudySection(
          title: '2. La salvación por gracia',
          content:
              'La salvación tiene su fundamento en la gracia de Dios. Se recibe mediante la fe y no como resultado de obras humanas que puedan comprar el favor divino.',
          references: 'Efesios 2:8-9; Tito 3:5.',
        ),
        StudySection(
          title: '3. Arrepentimiento y fe',
          content:
              'El arrepentimiento implica un cambio de mente y dirección respecto al pecado y a Dios. La fe es confiar en Jesucristo y en su obra salvadora.',
          references: 'Marcos 1:15; Hechos 3:19.',
        ),
      ],
      conclusion:
          'La salvación es un regalo de Dios que transforma la vida y conduce al creyente a vivir en obediencia y gratitud.',
    ),
    Study(
      number: '05',
      title: 'El Espíritu Santo',
      subtitle: 'Su persona, obra, dones y fruto.',
      introduction:
          'El Espíritu Santo es presentado en las Escrituras como quien guía, enseña, consuela y capacita al pueblo de Dios para vivir y servir conforme a su voluntad.',
      sections: [
        StudySection(
          title: '1. El Espíritu Santo es persona',
          content:
              'La Biblia atribuye al Espíritu Santo acciones personales: enseña, guía, habla e intercede. Por eso no debe reducirse a una simple fuerza impersonal.',
          references: 'Juan 14:26; Juan 16:13; Romanos 8:26.',
        ),
        StudySection(
          title: '2. Su obra en el creyente',
          content:
              'El Espíritu Santo convence de pecado, dirige a la verdad y fortalece al creyente para vivir una vida que agrade a Dios.',
          references: 'Juan 16:8; Romanos 8:14.',
        ),
        StudySection(
          title: '3. Dones y fruto',
          content:
              'Los dones capacitan para el servicio y la edificación de la iglesia. El fruto del Espíritu describe el carácter que debe manifestarse en la vida del creyente.',
          references: '1 Corintios 12:4-11; Gálatas 5:22-23.',
        ),
      ],
      conclusion:
          'La vida cristiana debe depender de la dirección del Espíritu Santo y reflejar su fruto en el carácter y en el servicio.',
    ),
    Study(
      number: '06',
      title: 'La santidad cristiana',
      subtitle: 'Una vida apartada para Dios.',
      introduction:
          'La santidad es una enseñanza central de las Escrituras. Dios llama a su pueblo a vivir de manera diferente, reflejando su carácter mediante una conducta obediente y consagrada.',
      sections: [
        StudySection(
          title: '1. Dios es santo',
          content:
              'La santidad de Dios expresa su pureza y absoluta separación del pecado. El llamado a la santidad del creyente tiene su fundamento en el carácter de Dios.',
          references: 'Levítico 19:2; 1 Pedro 1:15-16.',
        ),
        StudySection(
          title: '2. La santidad en la vida diaria',
          content:
              'La santidad no se limita a una apariencia exterior. Comprende pensamientos, palabras, decisiones, relaciones y acciones que buscan agradar a Dios.',
          references: 'Romanos 12:1-2; 1 Tesalonicenses 4:3-7.',
        ),
        StudySection(
          title: '3. Una vida de crecimiento',
          content:
              'El crecimiento cristiano requiere permanecer en Cristo, escuchar su Palabra y permitir que Dios transforme progresivamente el carácter y la conducta.',
          references: 'Juan 15:4-5; 2 Corintios 3:18.',
        ),
      ],
      conclusion:
          'La santidad es una respuesta de amor y obediencia a Dios. El creyente está llamado a crecer continuamente en una vida que le honre.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
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

class Study {
  final String number;
  final String title;
  final String subtitle;
  final String introduction;
  final List<StudySection> sections;
  final String conclusion;

  const Study({
    required this.number,
    required this.title,
    required this.subtitle,
    required this.introduction,
    required this.sections,
    required this.conclusion,
  });
}

class StudySection {
  final String title;
  final String content;
  final String references;

  const StudySection({
    required this.title,
    required this.content,
    required this.references,
  });
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
          ),
          const SizedBox(height: 20),
        ],
      ),
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
