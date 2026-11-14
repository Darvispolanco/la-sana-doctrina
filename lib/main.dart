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
      
     Study(
      number: '01',
      title: 'La importancia de conocer verdaderamente a Dios',
      subtitle: 'El fundamento para comprender la revelación divina y la Trinidad.',
      introduction: '''
Conocer a Dios constituye uno de los fundamentos esenciales de la fe cristiana. Las Escrituras no presentan este conocimiento como una simple acumulación de información religiosa, sino como una comprensión de quién es Dios a partir de su propia revelación.

Una persona puede conocer numerosos relatos bíblicos, memorizar versículos y estar familiarizada con las prácticas religiosas, sin haber comprendido profundamente la identidad y el carácter de Dios.

Por esta razón, la Biblia llama al ser humano a buscar un conocimiento verdadero, fundamentado en la Palabra y acompañado de fe, obediencia y comunión con el Señor.

Este conocimiento es indispensable para comprender la doctrina de la Trinidad. Antes de estudiar la identidad del Padre, del Hijo y del Espíritu Santo, debemos comprender la enseñanza bíblica de que existe un solo Dios.

El propósito de este estudio es establecer las bases bíblicas y teológicas necesarias para desarrollar una comprensión responsable de la naturaleza divina.
''' ,
      sections: [
        StudySection(
          title: '1. El conocimiento de Dios es fundamental para la fe',
          content: '''
Jeremías 9:23-24 enseña que el ser humano no debe fundamentar su gloria en la sabiduría, las riquezas o el poder, sino en comprender y conocer al Señor, quien hace misericordia, juicio y justicia en la tierra.

Este pasaje muestra que conocer a Dios tiene una importancia superior a los logros humanos. No se trata únicamente de aprender información religiosa, sino de reconocer quién es Dios y comprender su carácter.

En Juan 17:3, Jesucristo relaciona la vida eterna con conocer al único Dios verdadero y a Jesucristo, a quien el Padre envió.

Este texto debe examinarse cuidadosamente: Jesús distingue al Padre, a quien se dirige, de sí mismo, a quien identifica como el enviado. La doctrina trinitaria estudia esta relación junto con los demás pasajes que presentan la divinidad del Hijo.

Por tanto, conocer a Dios implica estudiar su identidad, su carácter, sus obras y su voluntad.
''' ,
          references: 'Jeremías 9:23-24; Juan 17:3; Oseas 6:6; Filipenses 3:8-10.',
        ),
        StudySection(
          title: '2. Dios es quien se da a conocer',
          content: '''
El conocimiento verdadero de Dios comienza con la iniciativa divina. El ser humano no puede descubrir por sus propios medios todos los aspectos de la naturaleza de Dios.

Hebreos 1:1-2 explica que Dios habló antiguamente por medio de los profetas y que en estos últimos tiempos ha hablado por medio del Hijo.

La revelación divina puede observarse en la creación, en las obras de Dios a través de la historia y, de manera especial, en las Escrituras y en Jesucristo.

Romanos 1:19-20 enseña que la creación manifiesta aspectos del poder y la naturaleza de Dios. Sin embargo, para conocer el mensaje de salvación y comprender la identidad del Padre, del Hijo y del Espíritu Santo, debemos estudiar el testimonio bíblico.

No debemos fundamentar nuestras doctrinas exclusivamente en experiencias, opiniones personales o razonamientos humanos. Toda enseñanza debe examinarse a la luz de la Palabra.
'''  ,
          references: 'Hebreos 1:1-2; Romanos 1:19-20; Salmos 19:1-4; 2 Timoteo 3:16-17.',
        ),
        StudySection(
          title: '3. Las Escrituras son el fundamento del conocimiento doctrinal',
          content: '''
La Biblia es la autoridad fundamental para conocer aquello que Dios ha querido revelar acerca de sí mismo.

En Juan 5:39-40, Jesús confrontó a quienes examinaban las Escrituras, pero no acudían a Él para recibir vida. Esto demuestra que el conocimiento de los textos bíblicos debe conducir a comprender correctamente el mensaje de Dios.

No basta con reunir versículos aislados. Es necesario estudiar quién habla, a quién se dirige, qué situación se está tratando y cómo se relaciona el pasaje con el resto de las Escrituras.

Deuteronomio 29:29 distingue entre las cosas secretas que pertenecen a Dios y las cosas reveladas que nos corresponden.

Este principio nos enseña a estudiar con humildad. Debemos afirmar lo que Dios ha revelado, sin inventar explicaciones sobre aquello que no ha dado a conocer.

La Trinidad debe estudiarse siguiendo este mismo principio: considerando el testimonio completo de las Escrituras.
''' ,
          references: 'Juan 5:39-40; Deuteronomio 29:29; Hechos 17:11; 2 Timoteo 2:15.',
        ),
        StudySection(
          title: '4. Conocer información acerca de Dios no equivale a conocerlo verdaderamente',
          content: '''
Existe una diferencia entre conocer datos acerca de Dios y vivir reconociendo quién es Él.

Santiago 2:19 advierte que la simple aceptación intelectual de que Dios existe no constituye por sí sola una fe obediente.

En 1 Juan 2:3-6, el conocimiento de Dios se relaciona con guardar sus mandamientos y caminar como Jesucristo caminó.

Esto no significa que las obras humanas compren la salvación. La obediencia es una expresión de la fe genuina y no el precio con el que se obtiene la gracia divina.

El conocimiento bíblico debe producir una transformación en nuestra manera de pensar, hablar, actuar y relacionarnos con los demás.

Una doctrina correctamente comprendida debe conducir a una vida que honre a Dios.
''' ,
          references: 'Santiago 2:19; 1 Juan 2:3-6; Juan 14:21; Santiago 1:22-25.',
        ),
        StudySection(
          title: '5. Jesucristo revela al Padre',
          content: '''
El conocimiento cristiano de Dios está inseparablemente relacionado con Jesucristo.

Juan 1:18 presenta al Hijo como aquel que ha dado a conocer al Padre. Juan 14:6-9 enseña que Jesús es el camino al Padre y muestra la relación única que existe entre ambos.

Colosenses 1:15 presenta a Cristo como la imagen del Dios invisible. Hebreos 1:3 lo describe como el resplandor de la gloria divina y la expresión exacta de su ser.

Estos pasajes deben interpretarse junto con los textos que distinguen al Padre del Hijo. Jesús revela al Padre, pero no por eso debemos confundir sus personas.

La doctrina trinitaria reconoce que el Hijo comparte la naturaleza divina y, al mismo tiempo, mantiene una relación personal real con el Padre.

Por eso, conocer a Dios exige estudiar la preexistencia de Jesucristo, su encarnación, su divinidad, su humanidad y su relación con el Padre.
''' ,
          references: 'Juan 1:1-3, 18; Juan 14:6-11; Colosenses 1:15-20; Hebreos 1:1-3.',
        ),
        StudySection(
          title: '6. El conocimiento de Dios y la doctrina de la Trinidad',
          content: '''
La doctrina de la Trinidad procura reunir varias afirmaciones presentes en las Escrituras.

Primero, la Biblia enseña que existe un solo Dios. Deuteronomio 6:4 y 1 Corintios 8:4-6 son textos fundamentales para comprender el monoteísmo bíblico.

Segundo, el Padre es identificado como Dios. Esto se observa, entre otros pasajes, en Efesios 1:3 y 1 Pedro 1:2.

Tercero, el Hijo recibe identificación y atributos divinos. Juan 1:1, Juan 20:28, Colosenses 2:9 y Hebreos 1:8 son pasajes fundamentales para este estudio.

Cuarto, el Espíritu Santo es presentado con identidad personal y atributos divinos. Hechos 5:3-4, 1 Corintios 2:10-11 y 1 Corintios 3:16-17 son textos relevantes.

Además, Mateo 28:19 menciona conjuntamente al Padre, al Hijo y al Espíritu Santo en la fórmula bautismal. En 2 Corintios 13:14 aparecen relacionados en una bendición apostólica.

La formulación doctrinal trinitaria sostiene que existe un solo Dios en tres personas distintas: Padre, Hijo y Espíritu Santo. No son tres dioses independientes, ni tres partes de Dios, ni una sola persona que cambia de nombre o manifestación.

Esta doctrina deberá examinarse progresivamente mediante el análisis de los textos bíblicos y de sus contextos.
''' ,
          references: 'Deuteronomio 6:4; 1 Corintios 8:4-6; Mateo 28:19; Juan 1:1; Juan 20:28; Hechos 5:3-4; 2 Corintios 13:14.',
        ),
        StudySection(
          title: '7. La humildad necesaria para estudiar la naturaleza divina',
          content: '''
Dios supera la capacidad limitada de comprensión del ser humano. Esto no significa que sea imposible conocerlo, sino que nuestro conocimiento depende de su revelación y nunca agota todo lo que Él es.

Job 11:7-9 presenta la grandeza de Dios por encima de la capacidad humana. Romanos 11:33-36 expresa la profundidad de su sabiduría y conocimiento.

La humildad teológica exige reconocer la diferencia entre lo que la Biblia afirma claramente, lo que podemos concluir mediante una interpretación responsable y aquello que permanece como misterio.

No debemos inventar explicaciones para resolver artificialmente todas las preguntas. Tampoco debemos rechazar una enseñanza bíblica simplemente porque supera nuestra comprensión.

En el estudio de la Trinidad podemos afirmar lo que las Escrituras revelan sobre Dios sin pretender explicar completamente el misterio de su existencia.
''' ,
          references: 'Job 11:7-9; Romanos 11:33-36; Isaías 55:8-9; Salmos 145:3.',
        ),
        StudySection(
          title: '8. Errores que debemos evitar al estudiar a Dios',
          content: '''
Al estudiar la doctrina de Dios debemos evitar varios errores.

El primero es convertir nuestras experiencias personales en una autoridad superior a las Escrituras.

El segundo es utilizar versículos aislados sin considerar su contexto.

El tercero es el triteísmo, que interpreta al Padre, al Hijo y al Espíritu Santo como tres dioses independientes.

El cuarto es el modalismo, que confunde la distinción personal del Padre, del Hijo y del Espíritu Santo, como si fueran simplemente tres nombres o manifestaciones de una misma persona.

El quinto es utilizar comparaciones humanas como si explicaran completamente la naturaleza divina.

El estudio responsable debe distinguir entre lo que un pasaje afirma expresamente, lo que se deduce de su contexto y las formulaciones teológicas que resumen la enseñanza bíblica.

La meta no es defender una idea mediante argumentos forzados, sino comprender fielmente la revelación de Dios.
''' ,
          references: 'Hechos 17:11; 2 Timoteo 2:15; 1 Corintios 8:4-6; Mateo 28:19; 1 Juan 4:1.',
        ),
      ],
      conclusion: '''
Conocer verdaderamente a Dios es el fundamento de la vida cristiana y el punto de partida para comprender su revelación.

Las Escrituras enseñan que Dios se ha dado a conocer, que Jesucristo revela al Padre y que el conocimiento cristiano de Dios debe tomar en serio el testimonio acerca del Padre, del Hijo y del Espíritu Santo.

La doctrina de la Trinidad no debe construirse sobre un versículo aislado ni sobre razonamientos humanos independientes de la Biblia. Debe comprenderse a partir del conjunto de las Escrituras, respetando la unidad de Dios y la distinción entre las tres personas divinas.

Por eso, estudiar quién es Dios exige fe, humildad, investigación cuidadosa y disposición para obedecer su Palabra.

El verdadero conocimiento de Dios no termina en saber más, sino en reconocerlo, confiar en Él y vivir conforme a su voluntad.
''',
    ),

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
