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

    _DictionaryEntry(
      term: 'Aseidad divina',
      category: 'Doctrina de Dios',
      definition: 'Enseñanza teológica que expresa que Dios existe por sí mismo y no depende de ninguna causa externa para su existencia.',
      references: 'Éxodo 3:14; Salmo 90:2; Juan 5:26; Hechos 17:24-25.',
      relationship: 'Hechos 17:24-25 enseña que Dios no necesita que los seres humanos le suministren algo. Juan 5:26 habla de la vida en sí mismo y debe leerse dentro de la relación entre el Padre y el Hijo que desarrolla el pasaje. La aseidad no significa que el Hijo sea el Padre, sino que la vida divina no depende de la creación.'
    ),
    _DictionaryEntry(
      term: 'Eternidad de Dios',
      category: 'Doctrina de Dios',
      definition: 'Atributo por el cual Dios no está sujeto al comienzo, la caducidad ni los límites temporales propios de las criaturas.',
      references: 'Salmo 90:2; Isaías 40:28; Juan 1:1-2; Apocalipsis 1:8.',
      relationship: 'El Salmo 90 confiesa que Dios es desde la eternidad y hasta la eternidad. Juan 1 presenta al Verbo ya existente en el principio, antes de la creación. Apocalipsis atribuye al Señor el título de Alfa y Omega; cada pasaje debe interpretarse atendiendo a quién se refiere en su contexto.'
    ),
    _DictionaryEntry(
      term: 'Omnipresencia',
      category: 'Atributos divinos',
      definition: 'Atributo que expresa que Dios está presente en todo lugar y que ninguna región de la creación queda fuera de su conocimiento y autoridad.',
      references: 'Salmo 139:7-10; Jeremías 23:23-24; 1 Reyes 8:27.',
      relationship: 'Salmo 139 afirma que no es posible huir de la presencia de Dios. Jeremías 23 enseña que Dios llena los cielos y la tierra. 1 Reyes 8:27 aclara que ni siquiera los cielos pueden contenerlo; por eso la presencia especial en el templo no limitaba su ser.'
    ),
    _DictionaryEntry(
      term: 'Omnisciencia',
      category: 'Atributos divinos',
      definition: 'Atributo por el cual Dios conoce plenamente todas las cosas: lo visible, lo oculto, el pasado, el presente y aquello que para nosotros todavía es futuro.',
      references: 'Salmo 139:1-6; Isaías 46:9-10; Juan 21:17; 1 Corintios 2:10-11.',
      relationship: 'El Salmo 139 describe el conocimiento perfecto de Dios. En Juan 21:17 Pedro reconoce que el Señor conoce todas las cosas. 1 Corintios 2:10-11 habla de la profundidad que el Espíritu escudriña; el texto debe considerarse junto con el argumento sobre la revelación de Dios por el Espíritu.'
    ),
    _DictionaryEntry(
      term: 'Omnipotencia',
      category: 'Atributos divinos',
      definition: 'Atributo que expresa el poder ilimitado de Dios para realizar todo lo que corresponde a su naturaleza santa y a su voluntad.',
      references: 'Génesis 18:14; Jeremías 32:17; Lucas 1:37; Apocalipsis 19:6.',
      relationship: 'Génesis 18:14 pregunta si hay alguna cosa difícil para Jehová. Lucas 1:37 anuncia el poder de Dios en el contexto de la concepción de Jesús. La omnipotencia no significa que Dios actúe contra su carácter, ni que la criatura pueda exigirle cualquier resultado.'
    ),
    _DictionaryEntry(
      term: 'Inmutabilidad divina',
      category: 'Atributos divinos',
      definition: 'Enseñanza de que Dios no cambia en su ser, perfección, verdad ni fidelidad; sus acciones en la historia no implican inestabilidad moral.',
      references: 'Números 23:19; Malaquías 3:6; Santiago 1:17; Hebreos 13:8.',
      relationship: 'Malaquías 3:6 relaciona la constancia de Dios con la preservación de su pueblo. Santiago 1:17 afirma que en Dios no hay mudanza ni sombra de variación. Hebreos 13:8 habla de Jesucristo en continuidad con esa fidelidad; no debe confundirse la inmutabilidad divina con la ausencia de acciones históricas.'
    ),
    _DictionaryEntry(
      term: 'Mediador',
      category: 'Cristología',
      definition: 'Persona que interviene para establecer o mantener una relación entre partes. En la salvación, Jesucristo es el único mediador entre Dios y los seres humanos.',
      references: '1 Timoteo 2:5-6; Hebreos 8:6; 9:15; 12:24.',
      relationship: '1 Timoteo 2:5 afirma que hay un solo Dios y un solo mediador, Jesucristo hombre. Su mediación no lo convierte en una tercera divinidad ni lo confunde con el Padre; expresa su obra singular como Hijo encarnado que se entregó por todos.'
    ),
    _DictionaryEntry(
      term: 'Intercesión de Cristo',
      category: 'Cristología',
      definition: 'Obra por la cual Jesucristo, resucitado y exaltado, representa a los suyos delante del Padre y asegura la eficacia de su obra salvadora.',
      references: 'Romanos 8:34; Hebreos 7:24-25; 1 Juan 2:1-2.',
      relationship: 'Romanos 8:34 distingue al Cristo que murió, resucitó y está a la diestra de Dios, y afirma que intercede por nosotros. Hebreos 7 relaciona su sacerdocio permanente con su capacidad de salvar. La intercesión presupone la relación entre el Hijo y el Padre.'
    ),
    _DictionaryEntry(
      term: 'Paráclito o Consolador',
      category: 'Personas divinas',
      definition: 'Título aplicado al Espíritu Santo en el discurso de despedida de Jesús; comunica la idea de ayudador, defensor o quien acompaña y asiste.',
      references: 'Juan 14:16-17, 26; Juan 15:26; Juan 16:7-15.',
      relationship: 'Jesús promete pedir al Padre que envíe otro Consolador. El Hijo habla del Padre y del Espíritu como distintos de sí mismo. Juan 15:26 añade que el Espíritu da testimonio de Cristo; estos textos permiten estudiar su distinción personal y su misión.'
    ),
    _DictionaryEntry(
      term: 'Regeneración',
      category: 'Salvación',
      definition: 'Obra de Dios por la que una persona recibe vida nueva y es renovada por el Espíritu Santo; no es simplemente una reforma externa de conducta.',
      references: 'Juan 3:3-8; Tito 3:4-7; 1 Pedro 1:3.',
      relationship: 'En Juan 3, Jesús explica la necesidad de nacer del Espíritu. Tito 3:5 relaciona la regeneración y renovación con el Espíritu Santo y con la misericordia de Dios. La vida nueva es don divino, no logro humano.'
    ),
    _DictionaryEntry(
      term: 'Redención',
      category: 'Salvación',
      definition: 'Liberación obtenida mediante un precio. En el evangelio, los creyentes son redimidos por la obra y la sangre de Jesucristo.',
      references: 'Marcos 10:45; Efesios 1:7; Colosenses 1:13-14; 1 Pedro 1:18-19.',
      relationship: 'Marcos 10:45 presenta al Hijo del Hombre dando su vida en rescate por muchos. Efesios 1:7 identifica la redención con la sangre de Cristo y el perdón. La redención es iniciativa de Dios y se realiza mediante la entrega del Hijo.'
    ),
    _DictionaryEntry(
      term: 'Reconciliación',
      category: 'Salvación',
      definition: 'Restablecimiento de la relación entre Dios y los seres humanos, enemistados por el pecado, mediante la muerte de Jesucristo.',
      references: 'Romanos 5:1, 10-11; 2 Corintios 5:18-21; Colosenses 1:19-22.',
      relationship: '2 Corintios 5 enseña que Dios reconcilia consigo al mundo por Cristo y encomienda el mensaje de reconciliación. Romanos 5 presenta la paz con Dios por medio de Jesucristo. El Padre es quien reconcilia y el Hijo es el medio decisivo de esa obra.'
    ),
    _DictionaryEntry(
      term: 'Propiciación',
      category: 'Salvación',
      definition: 'Término bíblico relacionado con la obra de Cristo que trata justamente el pecado y manifiesta la misericordia de Dios hacia quienes creen.',
      references: 'Romanos 3:23-26; 1 Juan 2:1-2; 1 Juan 4:10.',
      relationship: 'Romanos 3 presenta a Cristo como sacrificio relacionado con la propiciación y muestra que Dios es justo y justificador. 1 Juan 4:10 enseña que el amor comienza en Dios, quien envió a su Hijo. No debe describirse como si Jesús persuadiera a un Padre reacio a amar: el texto atribuye la iniciativa al amor de Dios.'
    ),
    _DictionaryEntry(
      term: 'Adopción',
      category: 'Salvación',
      definition: 'Gracia por la cual quienes están unidos a Cristo reciben la condición de hijos de Dios y participan de una relación filial con el Padre.',
      references: 'Romanos 8:14-17; Gálatas 4:4-7; Efesios 1:3-5.',
      relationship: 'Gálatas 4 afirma que Dios envió a su Hijo y envió a nuestros corazones el Espíritu de su Hijo, por quien clamamos «Abba, Padre». El pasaje distingue al Padre, al Hijo y al Espíritu en una misma obra que concede la adopción.'
    ),
    _DictionaryEntry(
      term: 'Inspiración de la Escritura',
      category: 'Estudio bíblico',
      definition: 'Obra de Dios por la cual las Escrituras fueron dadas mediante autores humanos y son útiles para enseñar, corregir e instruir en justicia.',
      references: '2 Timoteo 3:16-17; 2 Pedro 1:20-21.',
      relationship: '2 Timoteo afirma que toda la Escritura es inspirada por Dios. 2 Pedro explica que los hombres hablaron siendo impulsados por el Espíritu Santo. La autoridad bíblica procede de Dios y el Espíritu intervino en la comunicación profética.'
    ),
    _DictionaryEntry(
      term: 'Pacto',
      category: 'Teología bíblica',
      definition: 'Compromiso establecido por Dios que organiza su relación con las personas y desarrolla sus promesas y propósitos a lo largo de la historia bíblica.',
      references: 'Génesis 12:1-3; Éxodo 24:3-8; Jeremías 31:31-34; Lucas 22:19-20.',
      relationship: 'Los pactos deben leerse dentro de su contexto y desarrollo. Jeremías anuncia un nuevo pacto y Jesús relaciona la copa con el nuevo pacto en su sangre. Hebreos 8–10 explica la relación entre el pacto antiguo y la obra superior de Cristo.'
    ),
    _DictionaryEntry(
      term: 'Sacerdocio de Cristo',
      category: 'Cristología',
      definition: 'Ministerio único y permanente de Jesucristo como sumo sacerdote, quien se ofreció a sí mismo y abre el acceso a Dios.',
      references: 'Hebreos 4:14-16; 7:23-28; 9:11-14.',
      relationship: 'Hebreos contrasta a los sacerdotes mortales y sus sacrificios repetidos con el Hijo, cuyo sacerdocio permanece y cuyo sacrificio es suficiente. Su ministerio se realiza delante de Dios y no debe confundirse con el sacerdocio levítico.'
    ),
    _DictionaryEntry(
      term: 'Glorificación',
      category: 'Salvación',
      definition: 'Consumación de la salvación en la que los creyentes serán plenamente transformados y participarán de la gloria que Dios ha prometido.',
      references: 'Romanos 8:17, 29-30; Filipenses 3:20-21; 1 Juan 3:2.',
      relationship: 'Romanos 8 presenta la glorificación dentro del propósito salvador de Dios y la relaciona con la manifestación de los hijos. Filipenses 3 atribuye a Cristo la transformación final del cuerpo. La esperanza futura depende de la obra de Dios, no del mérito humano.'
    ),
    _DictionaryEntry(
      term: 'Dones del Espíritu',
      category: 'Espíritu Santo y vida cristiana',
      definition: 'Capacidades y manifestaciones concedidas por el Espíritu Santo para la edificación y el servicio de la comunidad cristiana.',
      references: '1 Corintios 12:4-11; Romanos 12:4-8; Efesios 4:11-13.',
      relationship: '1 Corintios 12 distingue diversidad de dones, ministerios y operaciones, y afirma que el mismo Espíritu obra en todos. El propósito no es la exaltación individual, sino el bien común y la edificación del cuerpo de Cristo.'
    ),
    _DictionaryEntry(
      term: 'Fruto del Espíritu',
      category: 'Espíritu Santo y vida cristiana',
      definition: 'Conjunto de virtudes que caracterizan la vida transformada por el Espíritu Santo y que se manifiestan en el carácter del creyente.',
      references: 'Gálatas 5:16-25; Efesios 5:8-10.',
      relationship: 'Gálatas contrasta las obras de la carne con el fruto del Espíritu. El contexto exhorta a andar en el Espíritu y a no usar la libertad como ocasión para satisfacer deseos pecaminosos. El fruto evidencia transformación, no una lista para ganar salvación.'
    ),
    _DictionaryEntry(
      term: 'Adoración en espíritu y en verdad',
      category: 'Vida cristiana',
      definition: 'Adoración que responde a la revelación de Dios y no queda limitada a un lugar geográfico o a una forma externa.',
      references: 'Juan 4:19-24; Filipenses 3:3.',
      relationship: 'En Juan 4 Jesús responde a la discusión entre los lugares de adoración y anuncia una adoración en espíritu y en verdad. El pasaje no autoriza una adoración desligada de la verdad revelada; debe leerse a la luz de la identidad de Jesús y de la obra de Dios.'
    ),
    _DictionaryEntry(
      term: "Abba",
      category: "Doctrina de Dios",
      definition: "Término arameo usado para dirigirse al padre con cercanía y confianza, sin perder el respeto filial.",
      references: "Marcos 14:36; Romanos 8:15; Gálatas 4:6.",
      relationship: "Jesús se dirige al Padre en Getsemaní y Pablo enseña que el Espíritu produce en los creyentes el clamor filial. El uso del término distingue al Padre del Hijo y muestra la relación de adopción por medio de Cristo.",
    ),
    _DictionaryEntry(
      term: "Adán",
      category: "Teología bíblica",
      definition: "Primer hombre presentado en Génesis y figura relevante para comprender el origen de la humanidad y el contraste entre la desobediencia y la obediencia de Cristo.",
      references: "Génesis 2:7; 3:17-19; Romanos 5:12-19; 1 Corintios 15:45.",
      relationship: "Pablo compara a Adán con Cristo: por uno entró el pecado y por el otro viene la justicia y la vida. La comparación debe leerse dentro del argumento sobre el pecado y la resurrección.",
    ),
    _DictionaryEntry(
      term: "Adoración",
      category: "Vida cristiana",
      definition: "Respuesta reverente del ser humano a Dios, expresada mediante alabanza, obediencia, oración y una vida sometida a su verdad.",
      references: "Juan 4:23-24; Romanos 12:1; Apocalipsis 4:10-11.",
      relationship: "Juan 4 relaciona la adoración con la revelación de Dios en Cristo; Romanos 12 amplía su expresión a la vida entera. La adoración bíblica no se reduce a música ni a un lugar.",
    ),
    _DictionaryEntry(
      term: "Ángel del Señor",
      category: "Teología bíblica",
      definition: "Expresión bíblica para un mensajero divino que aparece en determinados relatos del Antiguo Testamento; cada pasaje debe examinarse en su contexto.",
      references: "Génesis 16:7-13; Éxodo 3:2-6; Jueces 6:11-24.",
      relationship: "Algunos relatos muestran al mensajero hablando con autoridad divina, pero no debe imponerse una identificación uniforme sin analizar cada contexto. Éxodo 3 distingue la aparición del ángel y la voz de Dios.",
    ),
    _DictionaryEntry(
      term: "Ángeles",
      category: "Teología bíblica",
      definition: "Seres espirituales creados por Dios para servirle y cumplir las tareas que Él les encomienda.",
      references: "Salmo 103:20-21; Lucas 1:26-38; Hebreos 1:14.",
      relationship: "Hebreos presenta a los ángeles como servidores y contrasta su función con la dignidad única del Hijo. La adoración pertenece a Dios, no a los ángeles.",
    ),
    _DictionaryEntry(
      term: "Anticristo",
      category: "Escatología",
      definition: "Designación bíblica vinculada con la oposición a Cristo y con quienes niegan la verdad acerca del Hijo.",
      references: "1 Juan 2:18-23; 4:1-3; 2 Juan 7.",
      relationship: "Juan relaciona el anticristo con la negación del Padre y del Hijo y advierte sobre los engañadores. El término debe interpretarse desde las cartas de Juan y no mediante especulaciones aisladas.",
    ),
    _DictionaryEntry(
      term: "Apóstol",
      category: "Teología bíblica",
      definition: "Enviado con una comisión; en el Nuevo Testamento identifica especialmente a los testigos escogidos por Cristo para anunciar y establecer el testimonio apostólico.",
      references: "Lucas 6:13; Hechos 1:21-26; Efesios 2:20.",
      relationship: "Los apóstoles dan testimonio autorizado de Jesucristo. Efesios describe el fundamento apostólico y profético, mientras Cristo es la principal piedra del ángulo.",
    ),
    _DictionaryEntry(
      term: "Arrepentimiento",
      category: "Salvación",
      definition: "Cambio de mente y dirección ante el pecado que implica volverse a Dios y se manifiesta en una respuesta concreta de fe y obediencia.",
      references: "Marcos 1:14-15; Hechos 2:37-38; 2 Corintios 7:9-10.",
      relationship: "Los textos relacionan arrepentimiento con el evangelio, el perdón y una tristeza que conduce a cambio. No es una obra que compre la salvación, sino una respuesta a la gracia de Dios.",
    ),
    _DictionaryEntry(
      term: "Ascensión de Cristo",
      category: "Cristología",
      definition: "Acontecimiento en el que Jesucristo resucitado fue elevado al cielo y exaltado a la diestra del Padre.",
      references: "Lucas 24:50-53; Hechos 1:9-11; Efesios 1:20-23.",
      relationship: "Hechos narra la ascensión y anuncia el retorno de Jesús; Efesios explica su exaltación sobre todo poder. El Hijo asciende al Padre, mostrando distinción personal.",
    ),
    _DictionaryEntry(
      term: "Bautismo cristiano",
      category: "Vida cristiana",
      definition: "Ordenanza instituida por Cristo que identifica públicamente al creyente con Él y con la comunidad de discípulos.",
      references: "Mateo 28:19; Hechos 2:38-41; Romanos 6:3-4.",
      relationship: "Mateo presenta la fórmula en el nombre del Padre, del Hijo y del Espíritu Santo. Romanos relaciona el bautismo con la unión con la muerte y resurrección de Cristo.",
    ),
    _DictionaryEntry(
      term: "Bautismo en el Espíritu Santo",
      category: "Espíritu Santo y vida cristiana",
      definition: "Obra del Espíritu Santo relacionada con la promesa de Cristo y el testimonio y servicio de sus discípulos.",
      references: "Mateo 3:11; Hechos 1:4-8; 2:1-4; 1 Corintios 12:13.",
      relationship: "Hechos relaciona la promesa con poder para testificar; 1 Corintios enseña la obra del Espíritu al incorporar a los creyentes en un cuerpo. Los pasajes deben compararse sin convertir una experiencia particular en regla universal no expresada.",
    ),
    _DictionaryEntry(
      term: "Bienaventuranzas",
      category: "Vida cristiana",
      definition: "Declaraciones de Jesús que describen a quienes reciben el favor del reino y muestran el carácter de sus discípulos.",
      references: "Mateo 5:1-12; Lucas 6:20-23.",
      relationship: "El contexto del Sermón del Monte muestra que Jesús describe la vida del reino y la inversión de valores humanos. Las bienaventuranzas no son una fórmula para merecer el favor divino.",
    ),
    _DictionaryEntry(
      term: "Cordero de Dios",
      category: "Cristología",
      definition: "Título aplicado a Jesús que señala su misión redentora y su relación con el sacrificio por el pecado.",
      references: "Juan 1:29, 36; 1 Pedro 1:18-19; Apocalipsis 5:6-10.",
      relationship: "Juan el Bautista señala a Jesús como el Cordero que quita el pecado; Apocalipsis presenta al Cordero digno por su obra redentora. Las imágenes se interpretan a la luz del sacrificio de Cristo.",
    ),
    _DictionaryEntry(
      term: "Canon bíblico",
      category: "Estudio bíblico",
      definition: "Conjunto de libros reconocidos por la comunidad de fe como Escritura inspirada y normativa.",
      references: "Lucas 24:44; 2 Timoteo 3:15-17; 2 Pedro 3:15-16.",
      relationship: "Estos textos muestran la autoridad de las Escrituras y reconocen escritos apostólicos junto con las demás Escrituras. La definición histórica del canon requiere distinguir el testimonio bíblico de los procesos posteriores de reconocimiento.",
    ),
    _DictionaryEntry(
      term: "Carácter de Dios",
      category: "Doctrina de Dios",
      definition: "Conjunto de perfecciones morales y personales que la Escritura revela acerca de quién es Dios.",
      references: "Éxodo 34:6-7; Salmo 145:8-9; 1 Juan 4:8.",
      relationship: "La Biblia presenta a Dios como misericordioso, justo, santo y amoroso. El carácter divino es uno; los textos que hablan del Padre, del Hijo y del Espíritu se estudian sin dividir la naturaleza de Dios.",
    ),
    _DictionaryEntry(
      term: "Cielo",
      category: "Teología bíblica",
      definition: "Realidad de la presencia y el dominio de Dios, y destino de comunión con Él prometido a los redimidos.",
      references: "Mateo 6:9; Juan 14:2-3; Apocalipsis 21:1-4.",
      relationship: "Jesús enseña a orar al Padre que está en los cielos y promete preparar lugar para los suyos. Apocalipsis culmina con la presencia de Dios entre su pueblo en la nueva creación.",
    ),
    _DictionaryEntry(
      term: "Circuncisión del corazón",
      category: "Salvación",
      definition: "Imagen bíblica de la transformación interior por la que la persona deja la dureza y se vuelve a Dios con sinceridad.",
      references: "Deuteronomio 10:16; 30:6; Romanos 2:28-29; Colosenses 2:11-12.",
      relationship: "Deuteronomio llama al pueblo a una fidelidad interior y anuncia la obra de Dios en el corazón. Pablo aplica el lenguaje a la realidad espiritual que se recibe en Cristo.",
    ),
    _DictionaryEntry(
      term: "Confesión de fe",
      category: "Estudio bíblico",
      definition: "Declaración pública de lo que una persona o comunidad cree acerca de Dios y de Jesucristo, que debe concordar con el testimonio bíblico.",
      references: "Mateo 16:16-17; Romanos 10:9-10; 1 Timoteo 3:16.",
      relationship: "Las confesiones apostólicas reconocen a Jesús como Señor y Cristo. Una formulación doctrinal debe evaluarse por su fidelidad al conjunto de las Escrituras.",
    ),
    _DictionaryEntry(
      term: "Conversión",
      category: "Salvación",
      definition: "Respuesta por la que una persona se vuelve a Dios, abandonando su antigua dirección y confiando en el evangelio.",
      references: "Hechos 3:19; 9:35; 1 Tesalonicenses 1:9-10.",
      relationship: "Hechos relaciona la conversión con el arrepentimiento y el perdón; Tesalonicenses describe el abandono de los ídolos para servir al Dios vivo y esperar a su Hijo.",
    ),
    _DictionaryEntry(
      term: "Creación",
      category: "Doctrina de Dios",
      definition: "Obra por la que Dios dio existencia a todas las cosas, sin depender de una materia o poder rival que limite su soberanía.",
      references: "Génesis 1:1; Salmo 33:6-9; Juan 1:1-3; Colosenses 1:16.",
      relationship: "Génesis atribuye la creación a Dios; Juan y Colosenses relacionan la obra creadora con el Verbo o Hijo. Los pasajes se armonizan distinguiendo a las personas sin postular varios dioses.",
    ),
    _DictionaryEntry(
      term: "Cruz de Cristo",
      category: "Cristología",
      definition: "Muerte de Jesús en la cruz, acontecimiento central de la redención y de la reconciliación entre Dios y los pecadores.",
      references: "1 Corintios 1:18; Gálatas 6:14; Colosenses 1:19-22.",
      relationship: "Pablo presenta la cruz como poder y sabiduría de Dios, aunque el mundo la considere debilidad. La reconciliación se realiza por medio de la muerte corporal de Cristo.",
    ),
    _DictionaryEntry(
      term: "Discernimiento espiritual",
      category: "Vida cristiana",
      definition: "Capacidad de examinar enseñanzas, conductas y experiencias a la luz de la verdad revelada por Dios.",
      references: "1 Corintios 2:12-15; 1 Juan 4:1-6; Hebreos 5:14.",
      relationship: "Juan manda probar los espíritus y no aceptar toda afirmación religiosa. El discernimiento requiere comparar la enseñanza con la confesión bíblica de Jesucristo.",
    ),
    _DictionaryEntry(
      term: "Elección divina",
      category: "Salvación",
      definition: "Acto soberano de Dios por el que escoge conforme a su propósito, según el testimonio de las Escrituras.",
      references: "Efesios 1:3-6; Romanos 8:28-30; 1 Pedro 1:1-2.",
      relationship: "Efesios sitúa la elección en Cristo y la relaciona con la adopción; Pedro menciona la presciencia del Padre, la santificación del Espíritu y la obediencia a Jesucristo.",
    ),
    _DictionaryEntry(
      term: "Emanuel",
      category: "Cristología",
      definition: "Nombre profético que significa Dios con nosotros y que Mateo aplica a Jesús en el relato de su nacimiento.",
      references: "Isaías 7:14; Mateo 1:20-23.",
      relationship: "Mateo relaciona la profecía con la identidad y misión de Jesús. El pasaje debe leerse en su contexto de promesa y cumplimiento, sin confundir al Hijo con el Padre.",
    ),
    _DictionaryEntry(
      term: "Escatología",
      category: "Teología bíblica",
      definition: "Estudio de las enseñanzas bíblicas sobre los últimos acontecimientos, la consumación del reino, el juicio y la esperanza futura.",
      references: "Mateo 24:3-14; 1 Corintios 15:20-28; Apocalipsis 21:1-5.",
      relationship: "La esperanza final se centra en el retorno de Cristo, la resurrección y la renovación de todas las cosas. Los textos apocalípticos deben leerse atendiendo a su género y contexto.",
    ),
    _DictionaryEntry(
      term: "Espíritu de adopción",
      category: "Espíritu Santo y vida cristiana",
      definition: "Expresión paulina que describe la obra del Espíritu por la cual los creyentes reconocen a Dios como Padre y viven como hijos adoptados.",
      references: "Romanos 8:14-17; Gálatas 4:4-7.",
      relationship: "Pablo distingue al Padre que adopta, al Hijo enviado para redimir y al Espíritu que da testimonio filial. La adopción no convierte al creyente en divino, sino en hijo por gracia.",
    ),
    _DictionaryEntry(
      term: "Expiación",
      category: "Salvación",
      definition: "Obra por la que el pecado es tratado mediante el sacrificio de Cristo, conforme a la justicia y misericordia de Dios.",
      references: "Romanos 3:23-26; Hebreos 2:17; 1 Juan 2:2.",
      relationship: "Los textos relacionan la muerte de Jesús con el tratamiento del pecado y la manifestación de la justicia divina. La expiación debe estudiarse junto con sacrificio, propiciación y reconciliación.",
    ),
    _DictionaryEntry(
      term: "Fe salvadora",
      category: "Salvación",
      definition: "Confianza en Dios y en Jesucristo que recibe la promesa del evangelio y se expresa en dependencia y fidelidad.",
      references: "Juan 3:16-18; Romanos 4:3-5; Efesios 2:8-10.",
      relationship: "Pablo enseña que la salvación es por gracia mediante la fe y no por obras como mérito. Efesios también afirma que la fe genuina conduce a una vida de buenas obras.",
    ),
    _DictionaryEntry(
      term: "Fidelidad divina",
      category: "Doctrina de Dios",
      definition: "Constancia de Dios en su carácter, sus promesas y sus propósitos, aun cuando las personas sean inconstantes.",
      references: "Deuteronomio 7:9; Lamentaciones 3:22-23; 2 Timoteo 2:13.",
      relationship: "La fidelidad de Dios sostiene sus promesas y no depende de la perfección humana. El contexto de 2 Timoteo advierte que la fidelidad divina no debe usarse para justificar la infidelidad.",
    ),
    _DictionaryEntry(
      term: "Gloria de Dios",
      category: "Doctrina de Dios",
      definition: "Manifestación de la grandeza, santidad y majestad de Dios, que merece reconocimiento y adoración.",
      references: "Éxodo 33:18-23; Isaías 6:1-3; Juan 1:14; 17:1-5.",
      relationship: "Los textos muestran la gloria divina revelada y, en Juan, la gloria del Hijo en relación con el Padre. La distinción personal permanece dentro de la única identidad divina.",
    ),
    _DictionaryEntry(
      term: "Humillación de Cristo",
      category: "Cristología",
      definition: "Estado de obediencia y humildad asumido por el Hijo al encarnarse y entregarse hasta la muerte.",
      references: "Filipenses 2:5-11; 2 Corintios 8:9; Hebreos 2:9-18.",
      relationship: "Filipenses describe el descenso voluntario del Hijo y su posterior exaltación por el Padre. El pasaje no enseña que Cristo dejara de ser divino, sino que asumió condición de siervo.",
    ),
    _DictionaryEntry(
      term: "Iglesia",
      category: "Teología bíblica",
      definition: "Comunidad de personas llamadas por Dios mediante el evangelio, que pertenecen a Cristo y viven por la obra del Espíritu Santo.",
      references: "Mateo 16:18; Hechos 2:41-47; Efesios 1:22-23; 2:19-22.",
      relationship: "La Iglesia es cuerpo de Cristo y templo del Espíritu; se acerca al Padre por medio del Hijo en un mismo Espíritu. Las imágenes describen una comunidad, no un edificio.",
    ),
    _DictionaryEntry(
      term: "Imputación",
      category: "Salvación",
      definition: "Término teológico usado para describir el reconocimiento o atribución de justicia o pecado en el argumento bíblico sobre la salvación.",
      references: "Génesis 15:6; Romanos 4:3-8; 2 Corintios 5:19-21.",
      relationship: "Romanos explica que la fe de Abraham le fue contada por justicia y que Dios no toma en cuenta las transgresiones del creyente. El término debe definirse desde el argumento de Pablo.",
    ),
    _DictionaryEntry(
      term: "Inerrancia bíblica",
      category: "Estudio bíblico",
      definition: "Convicción de que la Escritura, en lo que afirma verdaderamente y entendida según su género e intención, no enseña falsedad.",
      references: "Salmo 12:6; Juan 17:17; Tito 1:2.",
      relationship: "La Biblia presenta la palabra de Dios como verdadera. La interpretación responsable considera lenguaje, género, contexto y propósito antes de afirmar que existe una contradicción.",
    ),
    _DictionaryEntry(
      term: "Israel",
      category: "Teología bíblica",
      definition: "Nombre del patriarca Jacob y del pueblo que desciende de él, central en la historia de los pactos y promesas bíblicas.",
      references: "Génesis 32:28; Éxodo 19:3-6; Romanos 9:4-8; 11:1-5.",
      relationship: "Pablo examina la relación entre Israel, las promesas y la fe en Cristo. Los pasajes deben leerse sin borrar las distinciones históricas ni ignorar el argumento completo de Romanos.",
    ),
    _DictionaryEntry(
      term: "Kenosis",
      category: "Cristología",
      definition: "Término derivado de Filipenses 2 que describe el vaciamiento del Hijo al tomar condición de siervo; su sentido se determina por el contexto.",
      references: "Filipenses 2:5-8; Juan 1:14.",
      relationship: "El texto explica el vaciamiento mediante la humillación y la asunción de forma de siervo, no mediante la pérdida de la naturaleza divina. Debe leerse junto con la exaltación de los versículos siguientes.",
    ),
    _DictionaryEntry(
      term: "Ley de Dios",
      category: "Teología bíblica",
      definition: "Instrucción y mandamientos dados por Dios, cuyo lugar y función deben entenderse dentro de la historia del pacto y del desarrollo bíblico.",
      references: "Éxodo 20:1-17; Mateo 5:17-20; Romanos 7:12; Gálatas 3:19-25.",
      relationship: "Jesús afirma que no vino a abolir sino a cumplir; Pablo explica la función de la ley y sus límites para justificar. Ningún texto debe aislarse del pacto al que pertenece.",
    ),
    _DictionaryEntry(
      term: "Libertad cristiana",
      category: "Vida cristiana",
      definition: "Libertad recibida en Cristo respecto de la condenación y del dominio del pecado, que no debe convertirse en ocasión para hacer el mal.",
      references: "Juan 8:31-36; Romanos 6:15-18; Gálatas 5:1,13.",
      relationship: "La libertad bíblica no es autonomía absoluta: Cristo libera del pecado para servir a Dios y amar al prójimo. Gálatas une libertad con la vida en el Espíritu.",
    ),
    _DictionaryEntry(
      term: "Logos o Verbo",
      category: "Cristología",
      definition: "Designación aplicada al Hijo en el prólogo de Juan, donde se afirma su preexistencia, relación con Dios y naturaleza divina.",
      references: "Juan 1:1-18; 1 Juan 1:1-2; Apocalipsis 19:13.",
      relationship: "Juan 1 distingue al Verbo de aquel con quien estaba y afirma que el Verbo era Dios. El versículo 14 identifica al Verbo con el que se hizo carne: Jesucristo.",
    ),
    _DictionaryEntry(
      term: "Llamamiento divino",
      category: "Salvación",
      definition: "Iniciativa de Dios por la que convoca a las personas a participar de su propósito y responder al evangelio.",
      references: "Romanos 8:28-30; 1 Corintios 1:9; 2 Tesalonicenses 2:13-14.",
      relationship: "Los textos relacionan el llamamiento con la comunión con el Hijo, la santificación del Espíritu y la fe en la verdad. Las distintas expresiones deben compararse en su contexto.",
    ),
    _DictionaryEntry(
      term: "Maranata",
      category: "Teología bíblica",
      definition: "Expresión aramea conservada en el Nuevo Testamento que comunica la esperanza y expectativa de la venida del Señor.",
      references: "1 Corintios 16:22; Apocalipsis 22:20.",
      relationship: "La expresión se entiende en el marco de la esperanza cristiana en el retorno de Jesús. La Iglesia espera al Señor y vive en fidelidad mientras aguarda su venida.",
    ),
    _DictionaryEntry(
      term: "Mesías",
      category: "Cristología",
      definition: "Título que significa Ungido y que identifica a Jesús como el Rey y Salvador prometido en las Escrituras.",
      references: "Salmo 2:1-12; Isaías 9:6-7; Juan 1:41; Hechos 2:36.",
      relationship: "Los evangelios identifican a Jesús como el Mesías esperado; Hechos relaciona su muerte, resurrección y exaltación con su señorío. Las promesas deben leerse en su desarrollo bíblico.",
    ),
    _DictionaryEntry(
      term: "Misericordia divina",
      category: "Doctrina de Dios",
      definition: "Compasión y bondad de Dios hacia quienes necesitan su ayuda, expresada en perdón, paciencia y cuidado.",
      references: "Éxodo 34:6; Salmo 103:8-13; Efesios 2:4-7.",
      relationship: "La misericordia no anula la justicia divina. Efesios la relaciona con el amor del Padre y la vida concedida con Cristo.",
    ),
    _DictionaryEntry(
      term: "Monogenēs",
      category: "Cristología",
      definition: "Término griego usado en el Evangelio de Juan para describir la relación única del Hijo con el Padre; su traducción y matiz deben estudiarse en cada contexto.",
      references: "Juan 1:14,18; 3:16,18; 1 Juan 4:9.",
      relationship: "Los pasajes presentan la singularidad del Hijo y su relación con el Padre. El significado no debe reducirse a una definición aislada sin examinar el uso del término en el Nuevo Testamento.",
    ),
    _DictionaryEntry(
      term: "Nueva creación",
      category: "Salvación",
      definition: "Realidad inaugurada por la obra de Cristo en la que Dios transforma la vida y promete la renovación final de todas las cosas.",
      references: "2 Corintios 5:17; Gálatas 6:15; Apocalipsis 21:1-5.",
      relationship: "Pablo describe una nueva identidad en Cristo; Apocalipsis anuncia la consumación cósmica. La transformación presente anticipa la renovación futura.",
    ),
    _DictionaryEntry(
      term: "Obediencia de Cristo",
      category: "Cristología",
      definition: "Fidelidad perfecta del Hijo al Padre, manifestada en su misión y llevada hasta la muerte en la cruz.",
      references: "Juan 4:34; Romanos 5:18-19; Filipenses 2:8; Hebreos 5:8-9.",
      relationship: "Romanos contrasta la desobediencia de Adán con la obediencia de Cristo. Hebreos relaciona su obediencia sufriente con la obra salvadora que realizó.",
    ),
    _DictionaryEntry(
      term: "Oración",
      category: "Vida cristiana",
      definition: "Comunicación reverente con Dios que incluye adoración, confesión, petición, gratitud e intercesión.",
      references: "Mateo 6:9-13; Juan 16:23-27; Efesios 2:18; Romanos 8:26-27.",
      relationship: "Jesús enseña a dirigirse al Padre; los creyentes se acercan por medio del Hijo y el Espíritu ayuda en su debilidad. Estos textos muestran distinción personal y unidad en la obra divina.",
    ),
    _DictionaryEntry(
      term: "Pascua",
      category: "Teología bíblica",
      definition: "Fiesta que conmemora la liberación de Israel de Egipto y que el Nuevo Testamento relaciona tipológicamente con la obra redentora de Cristo.",
      references: "Éxodo 12:1-14; Lucas 22:7-20; 1 Corintios 5:7.",
      relationship: "La Pascua recuerda la liberación por la sangre del cordero; Pablo llama a Cristo nuestra Pascua. La relación debe respetar el contexto original y su cumplimiento en Jesús.",
    ),
    _DictionaryEntry(
      term: "Perseverancia",
      category: "Salvación",
      definition: "Continuidad en la fe y fidelidad a Cristo, sostenida por la gracia de Dios y expresada en obediencia y esperanza.",
      references: "Mateo 24:13; Juan 15:4-10; Colosenses 1:21-23; Hebreos 3:12-14.",
      relationship: "Las advertencias bíblicas llaman a permanecer en Cristo; las promesas sostienen la confianza en Dios. La seguridad y las exhortaciones deben estudiarse juntas.",
    ),
    _DictionaryEntry(
      term: "Persona divina",
      category: "Doctrina trinitaria",
      definition: "Término teológico usado para distinguir al Padre, al Hijo y al Espíritu Santo sin dividir la única esencia divina.",
      references: "Mateo 3:16-17; 28:19; Juan 14:16-17; 2 Corintios 13:14.",
      relationship: "En el bautismo de Jesús y en las fórmulas apostólicas aparecen relaciones personales diferenciadas. La palabra persona sirve como herramienta doctrinal y debe permanecer subordinada al testimonio bíblico.",
    ),
    _DictionaryEntry(
      term: "Pentecostés",
      category: "Espíritu Santo y vida cristiana",
      definition: "Acontecimiento narrado en Hechos 2 en el que el Espíritu Santo fue derramado sobre los discípulos conforme a la promesa de Cristo.",
      references: "Joel 2:28-32; Hechos 1:4-8; 2:1-21.",
      relationship: "Pedro interpreta el acontecimiento a la luz de Joel y anuncia a Jesús resucitado y exaltado. El Padre cumple su promesa por medio del Hijo y derrama el Espíritu.",
    ),
    _DictionaryEntry(
      term: "Plenitud del Espíritu",
      category: "Espíritu Santo y vida cristiana",
      definition: "Estado de ser lleno del Espíritu Santo, relacionado con la adoración, la gratitud, la edificación y una conducta conforme a Cristo.",
      references: "Hechos 4:31; Efesios 5:18-21.",
      relationship: "Hechos vincula la llenura con valentía para anunciar la palabra; Efesios la relaciona con adoración y vida comunitaria. La llenura no significa que el creyente se vuelva divino.",
    ),
    _DictionaryEntry(
      term: "Predestinación",
      category: "Salvación",
      definition: "Enseñanza bíblica sobre el propósito previo de Dios respecto de quienes están en Cristo y el destino que les ha preparado.",
      references: "Romanos 8:29-30; Efesios 1:4-5,11.",
      relationship: "Efesios sitúa la predestinación en Cristo y la relaciona con adopción y alabanza de la gracia. Romanos la conecta con la conformidad a la imagen del Hijo.",
    ),
    _DictionaryEntry(
      term: "Providencia divina",
      category: "Doctrina de Dios",
      definition: "Gobierno y cuidado por los que Dios sostiene y dirige la creación y la historia conforme a su voluntad sabia.",
      references: "Génesis 50:20; Salmo 104:24-30; Romanos 8:28.",
      relationship: "Los textos muestran que Dios obra incluso en circunstancias humanas complejas sin convertir el mal en bien moral. La providencia debe estudiarse junto con la responsabilidad humana.",
    ),
    _DictionaryEntry(
      term: "Reino de Dios",
      category: "Teología bíblica",
      definition: "Gobierno soberano de Dios, anunciado y manifestado de manera decisiva en el ministerio de Jesucristo y esperado en su consumación.",
      references: "Marcos 1:14-15; Mateo 6:10; Lucas 17:20-21; Apocalipsis 11:15.",
      relationship: "Jesús anuncia la cercanía del reino y enseña a pedir su venida. El Nuevo Testamento presenta una realidad ya inaugurada y todavía esperada en plenitud.",
    ),
    _DictionaryEntry(
      term: "Resurrección de Cristo",
      category: "Cristología",
      definition: "Acontecimiento histórico y fundamento de la fe cristiana por el que Dios levantó a Jesús de entre los muertos.",
      references: "Lucas 24:1-8; Hechos 2:22-36; 1 Corintios 15:3-8,12-20.",
      relationship: "Los apóstoles anuncian que el Padre levantó a Jesús y que su resurrección garantiza la esperanza de los creyentes. La resurrección no es una metáfora de continuidad de ideas.",
    ),
    _DictionaryEntry(
      term: "Sabiduría divina",
      category: "Doctrina de Dios",
      definition: "Perfección por la que Dios conoce y dispone todas las cosas de manera santa, justa y conforme a su propósito.",
      references: "Job 12:13; Romanos 11:33-36; 1 Corintios 1:24,30.",
      relationship: "Pablo contrasta la sabiduría de Dios con los criterios del mundo y presenta a Cristo como sabiduría de Dios para los llamados. La sabiduría divina se revela en la cruz.",
    ),
    _DictionaryEntry(
      term: "Sacrificio de Cristo",
      category: "Cristología",
      definition: "Entrega voluntaria y única de Jesús en favor de los pecadores, que cumple el propósito redentor de Dios.",
      references: "Marcos 10:45; Hebreos 9:24-28; 10:10-14.",
      relationship: "Hebreos insiste en que el sacrificio de Cristo fue ofrecido una vez para siempre. Su suficiencia excluye la idea de repetir su obra redentora.",
    ),
    _DictionaryEntry(
      term: "Sangre de Cristo",
      category: "Cristología",
      definition: "Expresión bíblica que señala la muerte sacrificial de Jesús y sus efectos de redención, perdón y reconciliación.",
      references: "Efesios 1:7; Colosenses 1:20; 1 Pedro 1:18-19.",
      relationship: "La sangre representa la vida entregada en sacrificio. Los pasajes la relacionan con la redención y la paz, y deben leerse dentro del lenguaje sacrificial bíblico.",
    ),
    _DictionaryEntry(
      term: "Señorío de Cristo",
      category: "Cristología",
      definition: "Autoridad y dignidad de Jesucristo como Señor resucitado, a quien pertenece la obediencia y adoración de sus discípulos.",
      references: "Hechos 2:36; Romanos 10:9-13; Filipenses 2:9-11.",
      relationship: "El Padre exalta al Hijo y toda lengua confesará su señorío. Romanos aplica a Jesús un lenguaje del Antiguo Testamento referido al Señor, cuestión central para la cristología.",
    ),
    _DictionaryEntry(
      term: "Soberanía divina",
      category: "Doctrina de Dios",
      definition: "Autoridad suprema de Dios sobre la creación y la historia, ejercida conforme a su carácter justo y santo.",
      references: "Salmo 115:3; Daniel 4:34-35; Efesios 1:11.",
      relationship: "Los textos afirman que Dios obra según su voluntad. Esta soberanía no debe interpretarse como negación de la responsabilidad humana que también enseña la Escritura.",
    ),
    _DictionaryEntry(
      term: "Tabernáculo",
      category: "Teología bíblica",
      definition: "Santuario portátil establecido en Israel como lugar de culto y señal de la presencia de Dios en medio del pueblo.",
      references: "Éxodo 25:8-9; 40:34-38; Juan 1:14; Hebreos 9:1-12.",
      relationship: "El tabernáculo pertenece al pacto mosaico y sus símbolos son retomados en el Nuevo Testamento para explicar la obra de Cristo. Juan presenta al Verbo habitando entre nosotros.",
    ),
    _DictionaryEntry(
      term: "Temor de Dios",
      category: "Vida cristiana",
      definition: "Actitud de reverencia, respeto y obediencia ante la santidad y autoridad de Dios.",
      references: "Proverbios 1:7; Eclesiastés 12:13; Hechos 9:31.",
      relationship: "La Escritura relaciona el temor del Señor con sabiduría y obediencia, no con terror servil permanente. Hechos describe a la Iglesia andando en el temor del Señor y en el consuelo del Espíritu.",
    ),
    _DictionaryEntry(
      term: "Templo del Espíritu",
      category: "Espíritu Santo y vida cristiana",
      definition: "Imagen bíblica que describe a los creyentes y a la comunidad como lugar donde habita el Espíritu Santo.",
      references: "1 Corintios 3:16-17; 6:19-20; Efesios 2:21-22.",
      relationship: "Pablo aplica la imagen al cuerpo comunitario y también al creyente. La presencia del Espíritu exige santidad y muestra su identidad divina en el marco de la obra del Dios trino.",
    ),
    _DictionaryEntry(
      term: "Tentación de Cristo",
      category: "Cristología",
      definition: "Prueba que Jesús enfrentó en el desierto y en su ministerio, permaneciendo fiel al Padre y sin pecar.",
      references: "Mateo 4:1-11; Lucas 4:1-13; Hebreos 4:15.",
      relationship: "Los evangelios presentan a Jesús conducido por el Espíritu y tentado por el diablo. Hebreos afirma que fue probado como nosotros, pero sin pecado.",
    ),
    _DictionaryEntry(
      term: "Testimonio apostólico",
      category: "Teología bíblica",
      definition: "Anuncio autorizado de los apóstoles acerca de la vida, muerte y resurrección de Jesucristo.",
      references: "Hechos 1:8,21-22; 1 Juan 1:1-3; 1 Corintios 15:3-8.",
      relationship: "El testimonio apostólico se apoya en lo que los testigos vieron y recibieron. La doctrina cristiana debe permanecer vinculada a este anuncio.",
    ),
    _DictionaryEntry(
      term: "Verbo",
      category: "Cristología",
      definition: "Traducción tradicional de Logos, título con el que Juan presenta al Hijo eterno que se hizo carne.",
      references: "Juan 1:1-3,14; Apocalipsis 19:13.",
      relationship: "Juan afirma que el Verbo estaba con Dios, era Dios y se hizo carne. El texto distingue al Verbo y a Dios con quien estaba, y afirma la deidad del Verbo.",
    ),
    _DictionaryEntry(
      term: "Vida eterna",
      category: "Salvación",
      definition: "Vida que Dios concede por medio de Jesucristo, iniciada en la relación presente con Él y consumada en la resurrección.",
      references: "Juan 3:16; 5:24; 17:3; 1 Juan 5:11-13.",
      relationship: "Juan 17:3 relaciona la vida eterna con conocer al Padre y a Jesucristo, a quien envió. La vida eterna es comunión con Dios y no solo duración interminable.",
    ),
    _DictionaryEntry(
      term: "Voluntad de Dios",
      category: "Doctrina de Dios",
      definition: "Propósito y disposición de Dios revelados en las Escrituras, que orientan la creación, la salvación y la conducta del creyente.",
      references: "Mateo 6:10; Romanos 12:1-2; Efesios 1:5,9-11.",
      relationship: "Los textos distinguen el propósito soberano de Dios y la obediencia que pide a las personas. La voluntad divina debe discernirse mediante la renovación de la mente y la Palabra.",
    ),
    _DictionaryEntry(
      term: "Yahvé",
      category: "Doctrina de Dios",
      definition: "Forma de representar el nombre personal de Dios revelado a Israel, tradicionalmente vertido como Jehová en la RVR1960.",
      references: "Éxodo 3:13-15; 6:2-3; Isaías 42:8.",
      relationship: "El nombre identifica al Dios del pacto y su fidelidad. Los pasajes del Nuevo Testamento que aplican textos del Señor a Jesús deben analizarse cuidadosamente en su contexto.",
    ),
    _DictionaryEntry(
      term: "Justicia divina",
      category: "Doctrina de Dios",
      definition: "Perfección por la que Dios actúa rectamente, juzga sin parcialidad y mantiene la verdad de sus promesas.",
      references: "Salmo 89:14; Romanos 3:21-26; Apocalipsis 16:5-7.",
      relationship: "Romanos muestra que la justicia de Dios se manifiesta en la obra redentora de Cristo. La misericordia no elimina la justicia, sino que la salvación responde al problema real del pecado.",
    ),
    _DictionaryEntry(
      term: "Santuario",
      category: "Teología bíblica",
      definition: "Lugar apartado para el culto y la presencia simbólica de Dios en la historia de Israel, cuyo lenguaje se desarrolla en el Nuevo Testamento.",
      references: "Éxodo 25:8; Salmo 63:2; Hebreos 8:1-2; 9:11-12.",
      relationship: "Hebreos presenta a Cristo como sumo sacerdote del santuario verdadero. La tipología debe respetar la función del santuario en el pacto antiguo.",
    ),
    _DictionaryEntry(
      term: "Santidad de Dios",
      category: "Doctrina de Dios",
      definition: "Perfección por la que Dios es absolutamente puro, apartado de todo mal y digno de reverencia.",
      references: "Levítico 19:2; Isaías 6:1-5; 1 Pedro 1:15-16.",
      relationship: "La santidad de Dios fundamenta el llamado a la santidad del pueblo. Pedro aplica el mandato del Antiguo Testamento a los creyentes en Cristo.",
    ),
    _DictionaryEntry(
      term: "Unción",
      category: "Teología bíblica",
      definition: "Acto simbólico de consagración para una tarea o ministerio; en el Nuevo Testamento también se usa para hablar de la obra del Espíritu.",
      references: "Éxodo 29:7; 1 Samuel 16:13; Lucas 4:18; 1 Juan 2:20,27.",
      relationship: "Los usos deben distinguirse según su contexto: consagración de personas u objetos, misión mesiánica de Jesús y enseñanza sobre la unción recibida por los creyentes.",
    ),
    _DictionaryEntry(
      term: "Unidad de la Iglesia",
      category: "Teología bíblica",
      definition: "Comunión espiritual del pueblo de Cristo, fundada en un solo Señor, una fe y un Espíritu, que debe expresarse en amor y verdad.",
      references: "Juan 17:20-23; Efesios 4:1-6; 1 Corintios 12:12-13.",
      relationship: "La unidad no elimina la diversidad de dones ni exige uniformidad en asuntos secundarios. Jesús ora por la unidad de sus discípulos y Pablo la fundamenta en la obra del Dios trino.",
    ),
    _DictionaryEntry(
      term: "Verdad",
      category: "Estudio bíblico",
      definition: "Aquello que corresponde a la realidad y a la revelación fiel de Dios, frente al engaño y la falsedad.",
      references: "Juan 14:6; 17:17; Efesios 4:21; 1 Juan 5:6.",
      relationship: "Jesús se identifica como la verdad y pide al Padre que santifique a los discípulos en la verdad. La verdad cristiana está centrada en Cristo y en la Palabra.",
    ),
    _DictionaryEntry(
      term: "Justicia imputada",
      category: "Salvación",
      definition: "Expresión teológica que describe la justicia concedida o contada al creyente en el argumento paulino sobre la justificación.",
      references: "Romanos 4:5-8; 5:17-19; Filipenses 3:9.",
      relationship: "Pablo usa el lenguaje de contar o acreditar justicia y contrasta la obra de Adán con la obediencia de Cristo. Debe estudiarse sin convertir una expresión técnica en sustituto del texto bíblico.",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final query = _query.trim().toLowerCase();
    final filtered = _entries.where((entry) {
      return entry.term.toLowerCase().contains(query) ||
          entry.category.toLowerCase().contains(query) ||
          entry.definition.toLowerCase().contains(query) ||
          entry.references.toLowerCase().contains(query) ||
          entry.relationship.toLowerCase().contains(query);
    }).toList()
      ..sort(
        (a, b) => a.term.toLowerCase().compareTo(b.term.toLowerCase()),
      );

    final dictionaryItems = <Widget>[];
    String? currentLetter;
    for (final entry in filtered) {
      final letter = entry.term.substring(0, 1).toUpperCase();
      if (letter != currentLetter) {
        currentLetter = letter;
        dictionaryItems.add(
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 16, 8, 8),
            child: Text(
              letter,
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      }
      dictionaryItems.add(
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
      );
    }

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
        ...dictionaryItems,
      ],
    );
  }
}
