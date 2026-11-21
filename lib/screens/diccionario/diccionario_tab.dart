part of '../../main.dart';

class _DictionaryEntry {
  const _DictionaryEntry({
    required this.term,
    required this.category,
    required this.definition,
    required this.references,
    required this.relationship,
  });

  final String term;
  final String category;
  final String definition;
  final String references;
  final String relationship;
}

class DiccionarioTab extends StatefulWidget {
  const DiccionarioTab({super.key});

  @override
  State<DiccionarioTab> createState() => _DiccionarioTabState();
}

class _DiccionarioTabState extends State<DiccionarioTab> {
  String _query = '';

  static const List<_DictionaryEntry> _entries = [
    _DictionaryEntry(
      term: 'Atributos divinos',
      category: 'Doctrina de Dios',
      definition:
          'Perfecciones que la Escritura revela acerca del ser y el carácter de Dios, como su santidad, eternidad, amor, justicia, poder y conocimiento.',
      references: 'Éxodo 34:6-7; Salmo 90:2; Isaías 6:3; 1 Juan 4:8.',
      relationship:
          'Los atributos no describen a tres dioses distintos. Padre, Hijo y Espíritu Santo son presentados en la Escritura dentro de la única identidad divina. Al estudiar cada atributo deben compararse los pasajes que lo atribuyen a Dios y los que lo relacionan con el Hijo y el Espíritu.',
    ),
    _DictionaryEntry(
      term: 'Doctrina',
      category: 'Estudio bíblico',
      definition:
          'Enseñanza que se formula a partir del testimonio de la Escritura y que debe examinarse en su contexto y en relación con el conjunto de la revelación bíblica.',
      references: 'Hechos 17:11; 2 Timoteo 3:16-17; Tito 2:1.',
      relationship:
          'Una formulación doctrinal no debe depender de una frase aislada. Se comparan autor, destinatarios, contexto histórico, propósito y pasajes paralelos antes de establecer una conclusión.',
    ),
    _DictionaryEntry(
      term: 'Exégesis',
      category: 'Estudio bíblico',
      definition:
          'Análisis cuidadoso de un pasaje para identificar lo que comunica en su contexto literario, histórico y gramatical.',
      references: 'Nehemías 8:8; Lucas 24:27; 2 Timoteo 2:15.',
      relationship:
          'La exégesis evita imponer al texto una idea previa. En los pasajes trinitarios, por ejemplo, se debe leer la conversación completa y observar quién habla, a quién se dirige y qué afirma cada pasaje.',
    ),
    _DictionaryEntry(
      term: 'Gracia',
      category: 'Salvación',
      definition:
          'Favor inmerecido de Dios, por el cual salva y sostiene al creyente; no es una recompensa que se obtiene por méritos humanos.',
      references: 'Efesios 2:8-10; Romanos 3:23-24; Tito 2:11-14.',
      relationship:
          'Efesios 1:3-14 presenta la obra salvadora con referencias al Padre, al Hijo y al Espíritu Santo. Efesios 2:8-10 explica que la salvación es por gracia mediante la fe y que las buenas obras son resultado, no la causa, de esa salvación.',
    ),
    _DictionaryEntry(
      term: 'Justificación',
      category: 'Salvación',
      definition:
          'Acto de Dios por el cual declara justo al pecador que recibe por la fe a Jesucristo; no significa que la persona haya ganado ese veredicto por sus obras.',
      references: 'Romanos 3:21-28; Romanos 5:1; Gálatas 2:16.',
      relationship:
          'Romanos 3 explica la necesidad universal de la gracia y el fundamento en Cristo. Romanos 5 muestra el resultado de la justificación: paz para con Dios por medio de nuestro Señor Jesucristo.',
    ),
    _DictionaryEntry(
      term: 'Revelación',
      category: 'Doctrina de Dios',
      definition:
          'Acción por la que Dios se da a conocer. La Escritura presenta su revelación en la creación, en sus actos y palabras, y de manera culminante en Jesucristo.',
      references: 'Salmo 19:1-4; Hebreos 1:1-3; Juan 1:18.',
      relationship:
          'Hebreos 1:1-3 relaciona la revelación dada anteriormente con la revelación por medio del Hijo. Juan 1:18 enseña que el Hijo da a conocer al Padre; ambos pasajes deben leerse sin confundir al Padre con el Hijo.',
    ),
    _DictionaryEntry(
      term: 'Trinidad',
      category: 'Doctrina trinitaria',
      definition:
          'Enseñanza cristiana según la cual hay un solo Dios y el Padre, el Hijo y el Espíritu Santo son distinguidos personalmente y participan plenamente de la única identidad divina.',
      references: 'Deuteronomio 6:4; Mateo 28:19; Juan 1:1-3; 2 Corintios 13:14.',
      relationship:
          'Deuteronomio 6:4 afirma la unicidad de Dios. Mateo 28:19 reúne al Padre, al Hijo y al Espíritu Santo en una sola fórmula bautismal. Juan 1:1-3 presenta al Verbo en relación con Dios y como Dios. Ninguno de estos textos debe aislarse de los demás.',
    ),
    _DictionaryEntry(
      term: 'Monoteísmo',
      category: 'Doctrina de Dios',
      definition:
          'Confesión de que existe un solo Dios verdadero; excluye la adoración de otros dioses como si fueran divinidades independientes.',
      references: 'Deuteronomio 6:4; Isaías 45:5-6; 1 Corintios 8:4-6.',
      relationship:
          'La fe trinitaria no enseña tres dioses. 1 Corintios 8:4-6 mantiene la confesión de un solo Dios y, en el mismo argumento, menciona al Padre y al Señor Jesucristo. Debe estudiarse junto con los textos que afirman la deidad del Hijo y del Espíritu Santo.',
    ),
    _DictionaryEntry(
      term: 'Padre',
      category: 'Personas divinas',
      definition:
          'Nombre personal con el que la Escritura identifica a Dios Padre, quien se relaciona con el Hijo y envía al Hijo y al Espíritu Santo.',
      references: 'Mateo 3:16-17; Juan 3:16-17; Juan 17:1-5.',
      relationship:
          'En el bautismo de Jesús, el Padre habla desde los cielos mientras el Hijo está siendo bautizado y el Espíritu desciende. En Juan 17, Jesús se dirige al Padre. Estos pasajes muestran una relación real entre el Padre y el Hijo, sin presentar dos dioses.',
    ),
    _DictionaryEntry(
      term: 'Hijo de Dios',
      category: 'Personas divinas',
      definition:
          'Título personal de Jesucristo que expresa su relación única con el Padre. El Hijo no es el Padre; la Escritura los distingue y también atribuye al Hijo naturaleza divina.',
      references: 'Juan 1:1-18; Juan 5:18-23; Hebreos 1:1-8.',
      relationship:
          'Juan 1:1 distingue al Verbo de aquel con quien estaba y afirma que el Verbo era Dios. Juan 1:14 identifica al Verbo hecho carne. Hebreos 1 presenta al Hijo como resplandor de la gloria de Dios y superior a los ángeles.',
    ),
    _DictionaryEntry(
      term: 'Espíritu Santo',
      category: 'Personas divinas',
      definition:
          'El Espíritu Santo es presentado en la Escritura como alguien que habla, enseña, guía y puede ser entristecido; no es simplemente una fuerza impersonal.',
      references: 'Juan 14:16-17, 26; Hechos 5:3-4; Efesios 4:30.',
      relationship:
          'En Juan 14:16-17, el Hijo pide al Padre que envíe otro Consolador. En Hechos 5:3-4, mentir al Espíritu Santo se describe también como mentir a Dios. Estos textos deben leerse juntos para considerar su distinción personal y su deidad.',
    ),
    _DictionaryEntry(
      term: 'Deidad de Cristo',
      category: 'Cristología',
      definition:
          'Enseñanza bíblica de que Jesucristo posee plenamente la naturaleza divina, sin dejar de ser verdaderamente humano en la encarnación.',
      references: 'Juan 1:1; Juan 20:28; Colosenses 2:9; Hebreos 1:8.',
      relationship:
          'Juan 20:28 recoge la confesión de Tomás dirigida a Jesús. Colosenses 2:9 afirma que en Cristo habita corporalmente toda la plenitud de la Deidad. Estos textos se estudian junto con los que distinguen al Hijo del Padre.',
    ),
    _DictionaryEntry(
      term: 'Distinción personal',
      category: 'Doctrina trinitaria',
      definition:
          'Diferencia real de relación entre el Padre, el Hijo y el Espíritu Santo, sin dividir la única naturaleza divina.',
      references: 'Mateo 3:16-17; Juan 14:16-17; Juan 17:1-5.',
      relationship:
          'En Mateo 3:16-17 aparecen simultáneamente el Hijo, el Espíritu y la voz del Padre. En Juan 14:16-17 el Hijo habla al Padre acerca de otro Consolador. El contexto muestra relaciones entre sujetos distintos, no simples nombres intercambiables de una misma persona.',
    ),
    _DictionaryEntry(
      term: 'Esencia divina',
      category: 'Doctrina trinitaria',
      definition:
          'Expresión teológica que se refiere a lo que Dios es: la única naturaleza divina. No es una palabra técnica que la Biblia use como fórmula trinitaria, sino una herramienta para resumir su enseñanza.',
      references: 'Deuteronomio 6:4; Juan 1:1; Colosenses 2:9; Hechos 5:3-4.',
      relationship:
          'La unidad de Dios se afirma en Deuteronomio 6:4. La deidad del Hijo y del Espíritu se examina en Juan 1:1, Colosenses 2:9 y Hechos 5:3-4. La distinción entre las personas se comprueba en pasajes como Mateo 3:16-17.',
    ),
    _DictionaryEntry(
      term: 'Encarnación',
      category: 'Cristología',
      definition:
          'Enseñanza de que el Hijo eterno asumió una naturaleza humana real. Jesucristo es verdaderamente Dios y verdaderamente hombre.',
      references: 'Juan 1:14; Filipenses 2:5-8; Hebreos 2:14-17.',
      relationship:
          'Juan 1:14 identifica al Verbo que se hizo carne. Filipenses 2 describe su humillación y condición de siervo. Hebreos 2 explica que participó de carne y sangre para socorrer y representar a los seres humanos.',
    ),
    _DictionaryEntry(
      term: 'Preexistencia del Hijo',
      category: 'Cristología',
      definition:
          'Enseñanza de que el Hijo existía antes de su nacimiento humano y no comenzó a existir en Belén.',
      references: 'Juan 1:1-3; Juan 17:5; Colosenses 1:16-17.',
      relationship:
          'Juan 1:1-3 sitúa al Verbo antes de la creación. En Juan 17:5 Jesús habla de la gloria que tenía con el Padre antes que el mundo existiera. El contexto distingue al Hijo del Padre y presenta su existencia anterior a la encarnación.',
    ),
    _DictionaryEntry(
      term: 'Bautismo de Jesús',
      category: 'Textos trinitarios',
      definition:
          'Acontecimiento en el que Jesús es bautizado, el Espíritu desciende sobre él y el Padre da testimonio desde los cielos.',
      references: 'Mateo 3:13-17; Marcos 1:9-11; Lucas 3:21-22.',
      relationship:
          'Los relatos presentan acciones simultáneas: el Hijo está en el agua, el Espíritu desciende y el Padre habla. El pasaje debe interpretarse en su contexto como una manifestación de distinción personal, no como tres dioses.',
    ),
    _DictionaryEntry(
      term: 'Fórmula bautismal',
      category: 'Textos trinitarios',
      definition:
          'Mandato de Jesús de bautizar en el nombre del Padre, del Hijo y del Espíritu Santo.',
      references: 'Mateo 28:18-20.',
      relationship:
          'El contexto comienza con la autoridad universal de Jesús y termina con su promesa de estar con sus discípulos. El texto menciona conjuntamente al Padre, al Hijo y al Espíritu Santo bajo el singular «nombre», por lo que debe estudiarse junto con la confesión bíblica de un solo Dios.',
    ),
    _DictionaryEntry(
      term: 'Bendición apostólica',
      category: 'Textos trinitarios',
      definition:
          'Bendición final de 2 Corintios que menciona la gracia del Señor Jesucristo, el amor de Dios y la comunión del Espíritu Santo.',
      references: '2 Corintios 13:11-14.',
      relationship:
          'El versículo 14 no es una lista aislada: cierra una carta en la que Pablo ha hablado de Cristo, de Dios y de la obra del Espíritu. La bendición reúne a los tres en la vida y comunión de la iglesia.',
    ),
    _DictionaryEntry(
      term: 'Salvación',
      category: 'Salvación',
      definition:
          'Obra por la que Dios rescata del pecado y reconcilia consigo a quienes reciben por la fe a Jesucristo.',
      references: 'Efesios 1:3-14; Juan 3:16-17; Tito 3:4-7.',
      relationship:
          'Efesios 1:3-14 presenta al Padre que escoge y adopta, al Hijo por cuya sangre hay redención y al Espíritu como sello de la promesa. El pasaje describe una sola obra salvadora con acciones personales diferenciadas.',
    ),
    _DictionaryEntry(
      term: 'Santificación',
      category: 'Salvación',
      definition:
          'Obra de Dios por la que el creyente es apartado para él y va siendo transformado en una vida de obediencia y semejanza a Cristo.',
      references: '1 Corintios 6:11; 2 Tesalonicenses 2:13; 1 Pedro 1:2.',
      relationship:
          'Los textos relacionan la santificación con Dios, con el Espíritu y con Jesucristo. No debe confundirse el crecimiento en santidad con la base de la justificación: la obediencia es fruto de la gracia.',
    ),
    _DictionaryEntry(
      term: 'Comunión',
      category: 'Vida cristiana',
      definition:
          'Participación y relación compartida con Dios y con los creyentes, fundada en la obra de Jesucristo y sostenida por el Espíritu Santo.',
      references: '2 Corintios 13:14; 1 Juan 1:3-7; Filipenses 2:1-2.',
      relationship:
          '1 Juan 1 conecta la comunión con el Padre y con su Hijo Jesucristo. 2 Corintios 13:14 menciona la comunión del Espíritu Santo. Ambos textos ayudan a comprender la vida cristiana como relación con el Dios trino.',
    ),
    _DictionaryEntry(
      term: 'Unidad de Dios',
      category: 'Doctrina trinitaria',
      definition:
          'Verdad bíblica de que Dios es uno. La doctrina trinitaria mantiene esta unidad y no enseña tres seres divinos separados.',
      references: 'Deuteronomio 6:4; Isaías 45:5; Marcos 12:29; 1 Corintios 8:4-6.',
      relationship:
          'Marcos 12:28-34 muestra a Jesús afirmando el mandamiento de que Dios es uno. 1 Corintios 8:4-6 conserva el monoteísmo al hablar del Padre y de Jesucristo. La unidad divina debe armonizarse con los textos que distinguen al Padre, al Hijo y al Espíritu.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final query = _query.trim().toLowerCase();
    final filtered = _entries.where((entry) {
      return entry.term.toLowerCase().contains(query) ||
          entry.category.toLowerCase().contains(query) ||
          entry.definition.toLowerCase().contains(query) ||
          entry.references.toLowerCase().contains(query);
    }).toList();

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const Text(
          'Diccionario teológico trinitario',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 6),
        Text(
          'Conceptos explicados desde la Escritura y relacionados con el testimonio bíblico sobre el Padre, el Hijo y el Espíritu Santo.',
          style: TextStyle(color: Theme.of(context).colorScheme.onSurfaceVariant),
        ),
        const SizedBox(height: 14),
        TextField(
          onChanged: (value) => setState(() => _query = value),
          decoration: InputDecoration(
            hintText: 'Buscar término, tema o pasaje bíblico',
            prefixIcon: const Icon(Icons.search),
            suffixIcon: _query.isEmpty
                ? null
                : IconButton(
                    tooltip: 'Limpiar búsqueda',
                    icon: const Icon(Icons.close),
                    onPressed: () => setState(() => _query = ''),
                  ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
            ),
            filled: true,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          '${filtered.length} de ${_entries.length} términos',
          style: Theme.of(context).textTheme.labelMedium,
        ),
        const SizedBox(height: 8),
        if (filtered.isEmpty)
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 28),
            child: Center(
              child: Text('No se encontraron términos relacionados.'),
            ),
          ),
        for (final entry in filtered)
          Card(
            margin: const EdgeInsets.only(bottom: 9),
            child: ExpansionTile(
              leading: const Icon(Icons.menu_book_outlined),
              title: Text(
                entry.term,
                style: const TextStyle(fontWeight: FontWeight.w700),
              ),
              subtitle: Text(entry.category),
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Definición',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 4),
                      Text(entry.definition),
                      const SizedBox(height: 12),
                      const Text(
                        'Fundamento bíblico (RVR1960)',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 4),
                      Text(entry.references),
                      const SizedBox(height: 12),
                      const Text(
                        'Relación y contexto de los pasajes',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 4),
                      Text(entry.relationship),
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
