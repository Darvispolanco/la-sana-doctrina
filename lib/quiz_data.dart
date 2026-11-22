/// Banco de evaluaciones bíblicas y generadores de preguntas.
/// Separado de main.dart para facilitar su mantenimiento y revisión doctrinal.

class QuizQuestion {
  final String question;
  final List<String> options;
  final int correctIndex;
  final String explanation;
  final String references;

  const QuizQuestion({
    required this.question,
    required this.options,
    required this.correctIndex,
    required this.explanation,
    required this.references,
  });
}

class QuizPack {
  final String title;
  final String description;
  final List<QuizQuestion> questions;
  final String difficulty;
  final String source;

  const QuizPack({
    required this.title,
    required this.description,
    required this.questions,
    this.difficulty = 'Intermedio',
    this.source = 'Estudios bíblicos',
  });
}

const List<QuizPack> _baseQuizPacks = [
  QuizPack(
    title: 'La doctrina de la Trinidad',
    description: 'Un solo Dios: Padre, Hijo y Espíritu Santo.',
    questions: [
      QuizQuestion(question: '¿Cuál es la confesión central de la doctrina trinitaria?', options: ['Tres dioses unidos', 'Un solo Dios en tres personas', 'Una persona con tres nombres', 'Tres seres creados'], correctIndex: 1, explanation: 'La fe cristiana confiesa un solo Dios y distingue personalmente al Padre, al Hijo y al Espíritu Santo.', references: 'Deuteronomio 6:4; Mateo 28:19'),
      QuizQuestion(question: 'En el bautismo de Jesús, ¿qué aparece en el relato?', options: ['Solo Jesús', 'Jesús y los discípulos', 'El Hijo, el Espíritu que desciende y la voz del Padre', 'El Padre encarnado como Jesús'], correctIndex: 2, explanation: 'El relato distingue al Hijo bautizado, al Espíritu que desciende y al Padre que habla desde los cielos.', references: 'Mateo 3:16-17'),
      QuizQuestion(question: '¿Qué afirma Juan 1:1 acerca del Verbo?', options: ['Que fue creado después', 'Que era un ángel', 'Que era Dios y estaba con Dios', 'Que era solamente un pensamiento'], correctIndex: 2, explanation: 'Juan afirma tanto la deidad del Verbo como su distinción relacional respecto de Dios.', references: 'Juan 1:1-3'),
      QuizQuestion(question: '¿Qué mandato menciona a las tres personas?', options: ['Bautizar en el nombre del Padre, del Hijo y del Espíritu Santo', 'Orar solamente al Espíritu', 'Bautizar en tres dioses', 'Invocar tres títulos de una persona'], correctIndex: 0, explanation: 'La fórmula bautismal reúne a las tres personas bajo el singular «nombre».', references: 'Mateo 28:19'),
      QuizQuestion(question: '¿Qué enseña 2 Corintios 13:14?', options: ['Que el Hijo es inferior en esencia', 'Una bendición que menciona al Señor Jesucristo, Dios y el Espíritu Santo', 'Que el Espíritu no es personal', 'Que hay tres salvaciones'], correctIndex: 1, explanation: 'La bendición apostólica menciona conjuntamente al Hijo, al Padre y al Espíritu Santo.', references: '2 Corintios 13:14'),
      QuizQuestion(question: '¿Quién envía al Consolador según la promesa de Jesús?', options: ['Los apóstoles', 'El Padre, en el nombre de Jesús', 'Los ángeles', 'La Iglesia'], correctIndex: 1, explanation: 'Jesús promete que el Padre enviará al Consolador en su nombre; el pasaje distingue al Padre, al Hijo y al Espíritu.', references: 'Juan 14:16,26'),
      QuizQuestion(question: '¿Qué afirmación sobre Dios establece Isaías 45:5?', options: ['Jehová declara que no hay otro Dios fuera de Él', 'Existen tres dioses iguales', 'El Padre es el único ser eterno y el Hijo fue creado', 'La creación es divina'], correctIndex: 0, explanation: 'El contexto afirma la exclusividad del único Dios y combate la idolatría.', references: 'Isaías 45:5-6'),
      QuizQuestion(question: '¿Qué afirma Juan 1:1 sobre el Verbo?', options: ['Que era Dios y estaba con Dios', 'Que era un ángel creado', 'Que era una idea sin existencia personal', 'Que comenzó a existir en Belén'], correctIndex: 0, explanation: 'El versículo afirma la deidad del Verbo y, a la vez, su relación con aquel con quien estaba.', references: 'Juan 1:1-3'),
      QuizQuestion(question: '¿Qué confiesa Tomás al dirigirse al Jesús resucitado?', options: ['Mi Señor y mi Dios', 'Mi profeta y mi ángel', 'Mi rey creado', 'Mi maestro solamente'], correctIndex: 0, explanation: 'Juan registra la confesión de Tomás y la presenta como respuesta a la resurrección de Jesús.', references: 'Juan 20:26-29'),
      QuizQuestion(question: '¿Qué título recibe el Padre en Efesios 1:3?', options: ['Dios y Padre de nuestro Señor Jesucristo', 'El Hijo unigénito', 'El Consolador enviado', 'El primogénito de toda creación'], correctIndex: 0, explanation: 'Pablo identifica al Padre como Dios y lo distingue del Señor Jesucristo.', references: 'Efesios 1:3-6'),
      QuizQuestion(question: '¿Qué hace el Espíritu Santo según Juan 14:26?', options: ['Enseña y recuerda a los discípulos lo que Jesús dijo', 'Es presentado como una fuerza sin acción personal', 'Niega las palabras de Jesús', 'Reemplaza al Padre como Hijo'], correctIndex: 0, explanation: 'Jesús atribuye al Espíritu acciones personales de enseñanza y recuerdo.', references: 'Juan 14:26'),
      QuizQuestion(question: '¿Qué relación expresa 1 Pedro 1:2?', options: ['Presciencia del Padre, santificación del Espíritu y obediencia a Jesucristo', 'Tres planes de salvación separados', 'Un solo título repetido tres veces', 'La ausencia del Espíritu en la salvación'], correctIndex: 0, explanation: 'El saludo apostólico reúne la obra del Padre, del Espíritu y de Jesucristo en la vida de los creyentes.', references: '1 Pedro 1:1-2'),
      QuizQuestion(question: '¿Qué enseña Juan 5:23 sobre el honor al Hijo?', options: ['Que todos honren al Hijo como honran al Padre', 'Que el Hijo no debe recibir honra', 'Que el Hijo es una criatura sin autoridad', 'Que el Padre y el Hijo no tienen relación'], correctIndex: 0, explanation: 'Jesús enseña que honrar al Hijo está unido a honrar al Padre que lo envió.', references: 'Juan 5:22-23'),
      QuizQuestion(question: '¿Qué muestra Romanos 8:26-27 acerca del Espíritu?', options: ['Intercede por los creyentes conforme a la voluntad de Dios', 'Es una fuerza que no actúa', 'Es idéntico personalmente al creyente', 'No participa en la vida de oración'], correctIndex: 0, explanation: 'Pablo atribuye al Espíritu una acción de intercesión a favor de los santos.', references: 'Romanos 8:26-27'),
      QuizQuestion(question: '¿Qué dice 1 Corintios 3:16 sobre los creyentes?', options: ['Que son templo de Dios y que el Espíritu de Dios mora en ellos', 'Que el Espíritu es una criatura', 'Que cada creyente es un dios', 'Que el templo reemplaza a Cristo'], correctIndex: 0, explanation: 'Pablo relaciona el templo de Dios con la presencia del Espíritu que habita en la comunidad.', references: '1 Corintios 3:16-17'),
      QuizQuestion(question: '¿Qué afirma Tito 2:13 acerca de Jesucristo?', options: ['Lo presenta como nuestro gran Dios y Salvador Jesucristo', 'Lo describe como un ángel creado', 'Niega su manifestación gloriosa', 'Lo identifica como un profeta más'], correctIndex: 0, explanation: 'El pasaje dirige la esperanza de la Iglesia a la manifestación gloriosa de Jesucristo.', references: 'Tito 2:11-14'),
      QuizQuestion(question: '¿Qué relación entre unidad y distinción evita la doctrina trinitaria?', options: ['Un solo Dios sin confundir las personas ni dividir la esencia', 'Tres dioses separados', 'Una persona que solo cambia de nombre', 'Tres partes incompletas de Dios'], correctIndex: 0, explanation: 'La formulación trinitaria sostiene simultáneamente la unidad divina y las distinciones personales reveladas en la Escritura.', references: 'Deuteronomio 6:4; Mateo 28:19; 2 Corintios 13:14'),
      QuizQuestion(question: '¿Qué significa que el Espíritu sea enviado por el Padre y el Hijo?', options: ['Que existe una relación personal y una misión dentro de la obra divina', 'Que el Espíritu es una criatura sin deidad', 'Que el Padre y el Hijo dejan de existir', 'Que hay tres voluntades divinas enfrentadas'], correctIndex: 0, explanation: 'Los textos de envío describen relaciones y misión; no enseñan inferioridad de naturaleza ni tres dioses.', references: 'Juan 14:26; 15:26; 16:7'),
      QuizQuestion(question: '¿Qué error comete quien utiliza Deuteronomio 6:4 para negar toda distinción personal?', options: ['Aísla un texto y no considera el testimonio completo de la Escritura', 'Afirma correctamente que Dios es uno', 'Reconoce el monoteísmo bíblico', 'Lee el contexto de Isaías'], correctIndex: 0, explanation: 'La unidad de Dios debe afirmarse junto con los pasajes que distinguen al Padre, al Hijo y al Espíritu.', references: 'Deuteronomio 6:4; Mateo 3:16-17; Juan 14:16-17'),
      QuizQuestion(question: '¿Qué función cumple el Espíritu Santo en la obra de salvación según Efesios 1:13-14?', options: ['Sella a quienes creen y es garantía de la herencia', 'Sustituye la obra de Cristo', 'Es un símbolo sin acción divina', 'Hace innecesaria la fe en el evangelio'], correctIndex: 0, explanation: 'Pablo describe al Espíritu como sello y garantía de la herencia de los creyentes, después de oír y creer el evangelio.', references: 'Efesios 1:13-14; 4:30'),
    ],
  ),
  QuizPack(
    title: 'Jesucristo: persona y obra',
    description: 'La identidad del Hijo eterno y su obra salvadora.',
    questions: [
      QuizQuestion(question: '¿Qué enseña Juan 1:14?', options: ['Que el Verbo se hizo carne', 'Que el Verbo dejó de ser Dios', 'Que un ángel tomó apariencia humana', 'Que Jesús comenzó a existir en Belén'], correctIndex: 0, explanation: 'La encarnación significa que el Hijo eterno asumió verdadera humanidad.', references: 'Juan 1:14'),
      QuizQuestion(question: 'Según Colosenses 2:9, ¿qué habita en Cristo?', options: ['Una parte de la divinidad', 'Toda la plenitud de la Deidad corporalmente', 'Solo poder profético', 'La naturaleza de un ángel'], correctIndex: 1, explanation: 'Pablo afirma la plenitud de la Deidad en Cristo.', references: 'Colosenses 2:9'),
      QuizQuestion(question: '¿Cuál es el propósito de la muerte de Cristo según 1 Pedro 2:24?', options: ['Dar únicamente un ejemplo moral', 'Llevar nuestros pecados en su cuerpo sobre el madero', 'Eliminar la necesidad de arrepentimiento', 'Reemplazar la resurrección'], correctIndex: 1, explanation: 'La muerte de Cristo tiene carácter redentor y llama a vivir para la justicia.', references: '1 Pedro 2:24'),
      QuizQuestion(question: '¿Qué ocurrió al tercer día según el evangelio apostólico?', options: ['Los discípulos inventaron una parábola', 'Jesús resucitó', 'Jesús fue creado de nuevo', 'El cuerpo quedó en la tumba'], correctIndex: 1, explanation: 'La resurrección es parte esencial del evangelio anunciado por los apóstoles.', references: '1 Corintios 15:3-4'),
      QuizQuestion(question: '¿Quién es el mediador entre Dios y los seres humanos?', options: ['Moisés', 'Un sacerdote terrenal', 'Jesucristo hombre', 'Un ángel'], correctIndex: 2, explanation: 'La Escritura identifica a Jesucristo como el único mediador.', references: '1 Timoteo 2:5'),
      QuizQuestion(question: '¿Qué relación presenta Jesús con el Padre en Juan 17?', options: ['Que son la misma persona', 'Que el Hijo habla con el Padre y comparte gloria con Él', 'Que el Padre no conoce al Hijo', 'Que existen dos dioses'], correctIndex: 1, explanation: 'La oración muestra distinción personal y comunión eterna entre el Padre y el Hijo.', references: 'Juan 17:1-5'),
      QuizQuestion(question: '¿Qué verdad afirma Deuteronomio 6:4?', options: ['Que Israel debe adorar a muchos dioses', 'Que Jehová es uno', 'Que el Padre es un dios entre otros', 'Que el Hijo comenzó a existir en la creación'], correctIndex: 1, explanation: 'El Shemá establece la confesión monoteísta de Israel. La doctrina trinitaria mantiene esta unidad divina.', references: 'Deuteronomio 6:4-5; Isaías 45:5-6'),
      QuizQuestion(question: 'Según Juan 14:16, ¿qué promete Jesús?', options: ['Que enviará otro Consolador', 'Que dejará de existir', 'Que el Padre y el Hijo son la misma persona', 'Que los discípulos no necesitarán al Espíritu'], correctIndex: 0, explanation: 'Jesús pide al Padre y el Padre dará otro Consolador; el lenguaje distingue a quien pide, a quien da y al que es enviado.', references: 'Juan 14:16-17'),
      QuizQuestion(question: 'En Juan 17:5, ¿qué pide Jesús al Padre?', options: ['Ser creado por primera vez', 'Ser glorificado junto al Padre con la gloria que tenía antes que el mundo fuese', 'Ser reconocido como un ángel', 'Que el Padre deje de ser Dios'], correctIndex: 1, explanation: 'La oración habla de la gloria compartida antes de la existencia del mundo y distingue al Hijo del Padre con quien habla.', references: 'Juan 17:1-5'),
      QuizQuestion(question: '¿Qué muestra Hechos 5:3-4 sobre el Espíritu Santo?', options: ['Que mentir al Espíritu es mentir a Dios', 'Que es una fuerza creada', 'Que es solamente una emoción', 'Que es un título de Pedro'], correctIndex: 0, explanation: 'Pedro relaciona mentir al Espíritu Santo con mentir a Dios, testimonio importante de su deidad.', references: 'Hechos 5:3-4'),
      QuizQuestion(question: '¿Qué acción personal del Espíritu aparece en Hechos 13:2?', options: ['El Espíritu habla y aparta a Bernabé y a Saulo', 'El Espíritu es descrito como una piedra', 'El Espíritu pide ser adorado como criatura', 'El Espíritu niega la misión'], correctIndex: 0, explanation: 'El Espíritu habla y dirige la misión de la Iglesia; el pasaje presenta acción personal.', references: 'Hechos 13:2-4'),
      QuizQuestion(question: '¿Qué enseña 1 Corintios 8:6 en su contexto?', options: ['Que hay muchos dioses verdaderos', 'Que para los creyentes hay un solo Dios, el Padre, y un Señor, Jesucristo', 'Que Jesús es un dios menor creado', 'Que el Padre y Jesús son la misma persona sin distinción'], correctIndex: 1, explanation: 'Pablo reafirma el monoteísmo y menciona al Padre y a Jesucristo de manera diferenciada dentro de la confesión cristiana.', references: '1 Corintios 8:4-6'),
      QuizQuestion(question: '¿Qué relación entre el Padre y el Hijo expresa Juan 3:16?', options: ['El Padre envió a su Hijo unigénito', 'El Hijo se envió a sí mismo como Padre', 'El Padre fue enviado por el Hijo', 'El Hijo es presentado como un ángel'], correctIndex: 0, explanation: 'El texto distingue al Padre que ama y envía del Hijo que es entregado para salvación.', references: 'Juan 3:16-17'),
      QuizQuestion(question: '¿Qué presenta Efesios 2:18?', options: ['Acceso al Padre por medio de Cristo en un mismo Espíritu', 'Acceso a tres dioses separados', 'Acceso al Padre sin Cristo ni el Espíritu', 'Que el Espíritu reemplaza al Padre'], correctIndex: 0, explanation: 'Pablo presenta una estructura trinitaria de acceso: por Cristo, en un mismo Espíritu, al Padre.', references: 'Efesios 2:18'),
      QuizQuestion(question: '¿Qué afirma Colosenses 1:16 acerca del Hijo?', options: ['Que todas las cosas fueron creadas en Él, por medio de Él y para Él', 'Que fue creado junto con los ángeles', 'Que no existía antes de Belén', 'Que solo es un maestro humano'], correctIndex: 0, explanation: 'El pasaje atribuye al Hijo una función creadora universal, coherente con su plena deidad.', references: 'Colosenses 1:15-17; Juan 1:3'),
      QuizQuestion(question: '¿Qué enseña Hebreos 1:8 acerca del Hijo?', options: ['El texto dirige al Hijo la designación «Dios»', 'El Hijo es llamado un profeta creado', 'El Hijo es identificado como un ángel', 'El Hijo no tiene reino'], correctIndex: 0, explanation: 'El autor aplica al Hijo un lenguaje de realeza y deidad al citar el Salmo 45.', references: 'Hebreos 1:8-9; Salmo 45:6-7'),
      QuizQuestion(question: '¿Qué revela Mateo 3:16-17 en el bautismo de Jesús?', options: ['El Hijo es bautizado, el Espíritu desciende y el Padre habla', 'Una sola persona cambia sucesivamente de máscara', 'Tres dioses compiten entre sí', 'El Espíritu no aparece en el relato'], correctIndex: 0, explanation: 'Los tres aparecen en el mismo acontecimiento con acciones diferenciadas, sin que el relato enseñe tres dioses.', references: 'Mateo 3:16-17'),
      QuizQuestion(question: '¿Qué comunica el singular «nombre» en Mateo 28:19?', options: ['Una sola identidad divina asociada al Padre, al Hijo y al Espíritu Santo', 'Tres nombres de tres dioses', 'Que solo debe mencionarse al Padre', 'Que el Hijo y el Espíritu no tienen relación con el bautismo'], correctIndex: 0, explanation: 'La fórmula une al Padre, al Hijo y al Espíritu bajo el singular «nombre» y distingue a cada uno.', references: 'Mateo 28:18-20'),
      QuizQuestion(question: '¿Qué distinción debe mantenerse al hablar de Jesús como Hijo?', options: ['El Hijo es plenamente Dios y es personalmente distinto del Padre', 'El Hijo es el Padre con otro nombre', 'El Hijo es un ser creado', 'El Hijo es menos divino por ser Hijo'], correctIndex: 0, explanation: 'La Escritura afirma tanto la deidad del Hijo como su relación y distinción respecto del Padre.', references: 'Juan 1:1-2; 5:18-23; Colosenses 2:9'),
      QuizQuestion(question: '¿Cuál es una conclusión equilibrada al comparar Deuteronomio 6:4, Juan 1:1 y Mateo 28:19?', options: ['Un solo Dios y distinción del Padre, del Hijo y del Espíritu', 'Tres dioses independientes', 'Una sola persona que solo usa tres títulos', 'Un Dios principal y dos criaturas'], correctIndex: 0, explanation: 'La formulación trinitaria procura respetar conjuntamente el monoteísmo bíblico y los textos que distinguen a las tres personas.', references: 'Deuteronomio 6:4; Juan 1:1-2; Mateo 28:19')
    ],
  ),
  QuizPack(
    title: 'Biblia y salvación',
    description: 'Fundamentos de la Escritura y del evangelio.',
    questions: [
      QuizQuestion(question: '¿Qué afirma 2 Timoteo 3:16?', options: ['Toda Escritura es inspirada por Dios', 'Solo algunos proverbios son inspirados', 'La tradición reemplaza la Escritura', 'La Biblia es una obra sin autoridad'], correctIndex: 0, explanation: 'Pablo enseña el origen divino y la utilidad formativa de la Escritura.', references: '2 Timoteo 3:16-17'),
      QuizQuestion(question: '¿Cómo somos justificados según Romanos 5:1?', options: ['Por obras que compran el favor de Dios', 'Por la fe', 'Por pertenecer a una nación', 'Por conocimiento secreto'], correctIndex: 1, explanation: 'La justificación se recibe por la fe y produce paz con Dios por medio de Jesucristo.', references: 'Romanos 5:1'),
      QuizQuestion(question: '¿Qué enseña Efesios 2:8-9?', options: ['La salvación es por gracia mediante la fe', 'La salvación se gana por méritos', 'La fe no tiene importancia', 'Las obras son la causa de la gracia'], correctIndex: 0, explanation: 'La salvación es don de Dios, no motivo de jactancia humana.', references: 'Efesios 2:8-10'),
      QuizQuestion(question: '¿Qué es el arrepentimiento bíblico?', options: ['Sentir vergüenza sin cambiar', 'Volverse a Dios, reconociendo el pecado', 'Culpar siempre a otros', 'Una emoción pasajera sin fruto'], correctIndex: 1, explanation: 'El arrepentimiento implica un cambio de mente y dirección que se evidencia en frutos.', references: 'Hechos 3:19; Mateo 3:8'),
      QuizQuestion(question: '¿Qué anuncia el evangelio según 1 Corintios 15?', options: ['La prosperidad como centro', 'La muerte de Cristo por nuestros pecados y su resurrección', 'La salvación por genealogía', 'La ausencia de juicio'], correctIndex: 1, explanation: 'La muerte y resurrección de Jesucristo son el núcleo del mensaje apostólico.', references: '1 Corintios 15:1-4'),
      QuizQuestion(question: '¿Qué produce el Espíritu en el creyente según Gálatas 5?', options: ['Orgullo y división', 'El fruto del Espíritu', 'Indiferencia moral', 'Autosuficiencia'], correctIndex: 1, explanation: 'El Espíritu forma carácter conforme a Dios, expresado en amor, gozo, paz y las demás virtudes enumeradas.', references: 'Gálatas 5:22-23'),
      QuizQuestion(question: '¿Qué relación establece Romanos 3:23-24 entre pecado y gracia?', options: ['Todos pecaron y son justificados gratuitamente por gracia mediante la redención en Cristo', 'Algunos no necesitan redención', 'La justificación se compra con obras', 'El pecado no tiene consecuencias'], correctIndex: 0, explanation: 'Pablo presenta la universalidad del pecado y la justificación gratuita por la gracia de Dios mediante Cristo.', references: 'Romanos 3:23-26'),
      QuizQuestion(question: '¿Qué enseña Romanos 6:23?', options: ['La paga del pecado es muerte, pero la dádiva de Dios es vida eterna en Cristo', 'El pecado produce vida eterna', 'La vida eterna se obtiene por riqueza', 'La muerte no se relaciona con el pecado'], correctIndex: 0, explanation: 'El versículo contrasta el resultado del pecado con el regalo gratuito de Dios en Jesucristo.', references: 'Romanos 6:21-23'),
      QuizQuestion(question: 'Según Juan 3:5-8, ¿quién obra el nuevo nacimiento?', options: ['El Espíritu Santo', 'La voluntad humana sin Dios', 'La tradición familiar', 'El esfuerzo intelectual'], correctIndex: 0, explanation: 'Jesús explica que es necesario nacer del agua y del Espíritu y compara la obra del Espíritu con el viento.', references: 'Juan 3:5-8'),
      QuizQuestion(question: '¿Qué enseña Tito 3:5 sobre la salvación?', options: ['Dios salva por su misericordia, no por obras de justicia que hayamos hecho', 'La salvación es salario por buenas obras', 'La regeneración es innecesaria', 'La misericordia no participa en la salvación'], correctIndex: 0, explanation: 'Pablo atribuye la salvación a la misericordia de Dios y menciona el lavamiento de la regeneración y la renovación del Espíritu Santo.', references: 'Tito 3:4-7'),
      QuizQuestion(question: '¿Qué respuesta demanda el evangelio según Marcos 1:15?', options: ['Arrepentirse y creer en el evangelio', 'Confiar en méritos personales', 'Buscar señales sin creer', 'Rechazar el Reino de Dios'], correctIndex: 0, explanation: 'Jesús anuncia que el Reino se ha acercado y llama a arrepentirse y creer.', references: 'Marcos 1:14-15'),
      QuizQuestion(question: '¿Qué enseña Santiago 2:17 sobre la fe?', options: ['La fe sin obras está muerta', 'Las obras compran la gracia', 'La fe verdadera nunca produce fruto', 'La salvación depende de rituales humanos'], correctIndex: 0, explanation: 'Santiago enseña que la fe genuina se evidencia en obras; no contradice que la salvación sea un don de gracia.', references: 'Santiago 2:14-18; Efesios 2:8-10'),
      QuizQuestion(question: '¿Qué función tiene la ley según Romanos 3:20?', options: ['Dar conocimiento del pecado', 'Justificar por sí sola al pecador', 'Hacer innecesaria la gracia', 'Eliminar la necesidad de Cristo'], correctIndex: 0, explanation: 'Pablo explica que por las obras de la ley nadie será justificado y que la ley da conocimiento del pecado.', references: 'Romanos 3:19-24'),
      QuizQuestion(question: '¿Qué significa la justificación en Romanos 5:1?', options: ['Ser declarado justo por la fe y tener paz con Dios por Jesucristo', 'Convertirse en alguien que nunca necesitó perdón', 'Ganar aceptación por linaje', 'Ser justificado por conocimiento secreto'], correctIndex: 0, explanation: 'La justificación es una declaración de Dios recibida por la fe y trae paz con Él por medio de Cristo.', references: 'Romanos 5:1-2'),
      QuizQuestion(question: '¿Qué enseña 1 Juan 1:9 sobre la confesión del pecado?', options: ['Dios es fiel y justo para perdonar y limpiar', 'Confesar el pecado hace innecesaria la cruz', 'El pecado debe ocultarse', 'El perdón depende de negar la culpa'], correctIndex: 0, explanation: 'Juan llama a reconocer el pecado y fundamenta el perdón en la fidelidad y justicia de Dios.', references: '1 Juan 1:7-10'),
      QuizQuestion(question: '¿Qué presenta Efesios 1:7 como fundamento de la redención?', options: ['La sangre de Cristo y las riquezas de la gracia de Dios', 'Los méritos acumulados por los seres humanos', 'La observancia de tradiciones humanas', 'La sabiduría filosófica'], correctIndex: 0, explanation: 'Pablo vincula la redención y el perdón con la sangre de Cristo y la gracia abundante de Dios.', references: 'Efesios 1:7-8'),
      QuizQuestion(question: '¿Qué enseña Romanos 8:1 para quienes están en Cristo Jesús?', options: ['Que no hay condenación', 'Que nunca enfrentan dificultades', 'Que ya no necesitan obedecer', 'Que el pecado es irrelevante'], correctIndex: 0, explanation: 'La ausencia de condenación se encuentra en Cristo y no significa permiso para vivir según la carne.', references: 'Romanos 8:1-4'),
      QuizQuestion(question: '¿Qué relación presenta Juan 10:27-28 entre Jesús y sus ovejas?', options: ['Oyen su voz, le siguen y reciben vida eterna', 'Compran la vida eterna por obras', 'Nunca necesitan escuchar a Cristo', 'Pueden ser salvadas por cualquier voz'], correctIndex: 0, explanation: 'Jesús describe la relación de sus ovejas con Él y su poder para darles vida eterna.', references: 'Juan 10:27-30'),
      QuizQuestion(question: '¿Qué enseña 1 Pedro 1:3 acerca de la esperanza cristiana?', options: ['Dios hizo renacer para una esperanza viva mediante la resurrección de Jesucristo', 'La esperanza depende de la riqueza', 'La resurrección es irrelevante', 'La esperanza se basa en méritos humanos'], correctIndex: 0, explanation: 'Pedro conecta el nuevo nacimiento y la esperanza viva con la resurrección de Jesucristo.', references: '1 Pedro 1:3-5'),
      QuizQuestion(question: '¿Cómo se relacionan Efesios 2:8-10?', options: ['Somos salvos por gracia mediante la fe y creados en Cristo para buenas obras', 'Las buenas obras son el precio de la salvación', 'La gracia elimina toda obra buena', 'La fe y la obediencia son incompatibles'], correctIndex: 0, explanation: 'El pasaje distingue la causa de la salvación, que es la gracia recibida por fe, del propósito de una vida de buenas obras.', references: 'Efesios 2:8-10')
    ],
  ),

  QuizPack(
    title: 'Historia de controversias y defensa doctrinal',
    description: 'Movimientos históricos y evaluación de sus afirmaciones a la luz de la Escritura.',
    questions: [
      QuizQuestion(question: '¿Qué afirmación se asocia históricamente con el arrianismo?', options: ['El Hijo es eterno y plenamente Dios', 'El Hijo no es eterno ni igual al Padre en naturaleza divina', 'El Espíritu Santo es una persona divina', 'La encarnación fue real'], correctIndex: 1, explanation: 'El arrianismo se vinculó con la negación de la eternidad y plena deidad del Hijo. La evaluación bíblica considera textos como Juan 1:1-3 y Colosenses 1:16-17.', references: 'Juan 1:1-3; Colosenses 1:16-17'),
      QuizQuestion(question: '¿Qué sostenía el docetismo acerca de la humanidad de Cristo?', options: ['Que Jesús fue verdaderamente humano', 'Que su humanidad corporal era solo aparente', 'Que Jesús no era el Mesías', 'Que el Hijo resucitó corporalmente'], correctIndex: 1, explanation: 'El docetismo negaba la humanidad real de Cristo; Juan afirma que el Verbo se hizo carne.', references: 'Juan 1:14; 1 Juan 4:2-3'),
      QuizQuestion(question: '¿Qué caracteriza al modalismo?', options: ['Confiesa tres dioses independientes', 'Presenta al Padre, al Hijo y al Espíritu como modos de una sola persona', 'Niega la existencia de Dios', 'Afirma que Cristo no resucitó'], correctIndex: 1, explanation: 'La doctrina trinitaria distingue realmente al Padre, al Hijo y al Espíritu Santo; los textos muestran relaciones personales entre ellos.', references: 'Mateo 3:16-17; Juan 14:16-17'),
      QuizQuestion(question: '¿Qué controversia se relaciona con la negación o disminución de la deidad del Espíritu Santo?', options: ['Macedonianismo', 'Donatismo', 'Catarismo', 'Novacianismo'], correctIndex: 0, explanation: 'El macedonianismo se asocia históricamente con una posición contraria a la plena divinidad del Espíritu Santo.', references: 'Hechos 5:3-4; 1 Corintios 3:16'),
      QuizQuestion(question: 'Al estudiar movimientos antiguos conocidos por fuentes de sus adversarios, ¿qué procedimiento es responsable?', options: ['Repetir toda acusación como hecho', 'Ignorar todas las fuentes', 'Distinguir testimonios, datos verificables y etiquetas polémicas', 'Suponer que todos enseñaban exactamente lo mismo'], correctIndex: 2, explanation: 'La crítica de fuentes evita presentar acusaciones no verificadas como hechos y reconoce los límites de la evidencia histórica.', references: 'Proverbios 18:13,17; 1 Tesalonicenses 5:21'),
      QuizQuestion(question: '¿Qué establece Deuteronomio 6:4 dentro de la enseñanza bíblica?', options: ['Que existen varios dioses', 'Que Jehová es uno', 'Que el Hijo fue creado', 'Que el Espíritu Santo no es divino'], correctIndex: 1, explanation: 'El Shemá establece el monoteísmo bíblico. Debe leerse junto con los pasajes que revelan la distinción del Padre, del Hijo y del Espíritu.', references: 'Deuteronomio 6:4-5; Mateo 28:19'),
      QuizQuestion(question: 'Según 1 Pedro 3:15, ¿cómo debe presentarse la defensa de la esperanza cristiana?', options: ['Con insultos y amenazas', 'Con temor humano', 'Con mansedumbre y reverencia', 'Evitando toda explicación'], correctIndex: 2, explanation: 'La defensa cristiana combina claridad en la verdad con respeto y buena conducta.', references: '1 Pedro 3:15-16'),
      QuizQuestion(question: '¿Cuál es la diferencia bíblica entre obediencia y legalismo?', options: ['La obediencia es fruto de la gracia; el legalismo confía en méritos o reglas humanas como base de aceptación', 'Son exactamente lo mismo', 'La gracia elimina toda obediencia', 'Las obras compran la salvación'], correctIndex: 0, explanation: 'La salvación es por gracia mediante la fe y las buenas obras son fruto de esa salvación, no su precio.', references: 'Efesios 2:8-10; Gálatas 2:16'),
    ],
  ),
  QuizPack(
    title: 'Interpretación bíblica y autoridad de la Escritura',
    description: 'Contexto, género literario, observación y discernimiento doctrinal.',
    questions: [
      QuizQuestion(question: 'En el método de estudio bíblico, ¿qué pregunta corresponde a la observación?', options: ['¿Qué dice el texto?', '¿Qué deseo que diga?', '¿Cómo puedo cambiar su sentido?', '¿Qué tradición debo imponerle?'], correctIndex: 0, explanation: 'La observación reúne los datos presentes en el pasaje antes de formular una explicación o aplicación.', references: 'Nehemías 8:8; Lucas 10:26'),
      QuizQuestion(question: '¿Qué procura establecer la interpretación bíblica?', options: ['La preferencia del lector', 'El sentido del pasaje en su contexto y propósito', 'Una aplicación sin estudiar el texto', 'Una doctrina a partir de una palabra aislada'], correctIndex: 1, explanation: 'La interpretación considera lenguaje, contexto histórico y literario, género y argumento del libro.', references: '2 Timoteo 2:15; 2 Pedro 3:16'),
      QuizQuestion(question: '¿De dónde debe derivarse una aplicación bíblica fiel?', options: ['De una preferencia personal', 'Del sentido del pasaje interpretado correctamente', 'De una frase separada de su contexto', 'De una promesa que el texto no hace'], correctIndex: 1, explanation: 'La aplicación debe seguir al significado del texto y no convertir deseos personales en mandatos bíblicos.', references: 'Santiago 1:22-25; Mateo 7:24-27'),
      QuizQuestion(question: '¿Qué incluye el contexto inmediato?', options: ['Solo el título del libro', 'Los versículos y párrafos que rodean el pasaje', 'Únicamente una definición moderna', 'Cualquier texto sin relación'], correctIndex: 1, explanation: 'Leer lo anterior y lo posterior permite reconocer el argumento y evita aislar una frase.', references: 'Filipenses 4:10-13'),
      QuizQuestion(question: '¿Por qué es importante reconocer el género literario?', options: ['Porque todos los textos usan lenguaje idéntico', 'Porque ayuda a comprender cómo comunica el autor', 'Porque elimina la necesidad del contexto', 'Porque convierte la poesía en historia literal'], correctIndex: 1, explanation: 'Narración, poesía, profecía, parábola y carta emplean recursos distintos que deben considerarse al interpretar.', references: 'Salmo 1; Lucas 15; Romanos 1:1-7'),
      QuizQuestion(question: '¿Qué describe mejor la eiségesis?', options: ['Extraer el sentido del texto', 'Introducir en el pasaje ideas ajenas a su sentido', 'Comparar el contexto', 'Leer el argumento completo'], correctIndex: 1, explanation: 'La eiségesis fuerza el texto para que confirme una idea previa, en lugar de escuchar lo que realmente comunica.', references: '2 Timoteo 2:15; 2 Pedro 3:16'),
      QuizQuestion(question: '¿Qué enseña 2 Timoteo 3:16 acerca de la Escritura?', options: ['Que solo algunas partes son útiles', 'Que toda Escritura es inspirada por Dios y útil para formar', 'Que la experiencia sustituye la Biblia', 'Que la Biblia no corrige la conducta'], correctIndex: 1, explanation: 'Pablo afirma el origen divino y la utilidad de la Escritura para enseñar, corregir e instruir en justicia.', references: '2 Timoteo 3:16-17'),
      QuizQuestion(question: '¿Cómo debe evaluarse una supuesta revelación que contradice el evangelio apostólico?', options: ['Aceptarla por la autoridad de quien la afirma', 'Colocarla por encima de la Escritura', 'Rechazar la contradicción y examinar toda afirmación por la enseñanza apostólica', 'Considerarla automáticamente verdadera si es reciente'], correctIndex: 2, explanation: 'La Iglesia debe probar las afirmaciones y permanecer en el evangelio recibido, sin aceptar otro mensaje contrario.', references: 'Gálatas 1:8-9; 1 Juan 4:1; Judas 3'),
    ],
  ),
  QuizPack(
    title: 'Defensa: discernimiento bíblico',
    description: 'Autoridad de la Escritura, interpretación y evaluación de enseñanzas.',
    difficulty: 'Intermedio',
    source: 'Defensa de la Sana Doctrina · estudios 1–10',
    questions: [
      QuizQuestion(question: '¿Qué afirma 2 Timoteo 3:16-17 sobre la Escritura?', options: ['Toda Escritura es inspirada por Dios y útil para enseñar y corregir', 'Solo algunos proverbios son inspirados', 'La Escritura no tiene autoridad doctrinal', 'La tradición sustituye la Palabra'], correctIndex: 0, explanation: 'Pablo presenta el origen divino y la utilidad formativa de la Escritura.', references: '2 Timoteo 3:14-17'),
      QuizQuestion(question: '¿Cómo examinaron los bereanos la enseñanza de Pablo?', options: ['La aceptaron sin examinar', 'Escudriñaron cada día las Escrituras para comprobarlo', 'La rechazaron por ser nueva', 'Consultaron solo la opinión popular'], correctIndex: 1, explanation: 'Hechos destaca su disposición a escuchar y verificar la enseñanza mediante las Escrituras.', references: 'Hechos 17:10-12'),
      QuizQuestion(question: '¿Toda equivocación interpretativa convierte automáticamente a alguien en falso maestro?', options: ['Sí, cualquier error basta', 'No; debe distinguirse el error involuntario de la enseñanza destructiva persistente', 'Sí, si discrepa de nosotros', 'No importa qué enseñe'], correctIndex: 1, explanation: 'El estudio diferencia una interpretación equivocada de la corrupción grave y persistente del evangelio.', references: '2 Pedro 2:1-3; Judas 3-4; 2 Timoteo 2:24-26'),
      QuizQuestion(question: '¿Qué implica interpretar un pasaje en su contexto?', options: ['Usar solo una frase aislada', 'Considerar párrafo, libro, situación y relación con el resto de la Escritura', 'Ignorar el propósito del autor', 'Elegir el significado más conveniente'], correctIndex: 1, explanation: 'La interpretación responsable observa la unidad literaria y el contexto histórico y canónico.', references: 'Nehemías 8:8; Lucas 24:27; 2 Pedro 3:16'),
      QuizQuestion(question: '¿Cómo debe presentar el creyente defensa de su esperanza?', options: ['Con insultos', 'Con mansedumbre, respeto y buena conciencia', 'Con presión y amenazas', 'Evitando toda explicación'], correctIndex: 1, explanation: 'La defensa cristiana debe conservar el carácter de Cristo y respetar a quien pregunta.', references: '1 Pedro 3:15-16'),
      QuizQuestion(question: '¿Qué cuidado requiere el estudio de movimientos históricos?', options: ['Repetir toda acusación de sus adversarios', 'Distinguir fuentes, contexto, diversidad interna y datos comprobables', 'Atribuirles siempre una doctrina uniforme', 'Ignorar las fuentes primarias'], correctIndex: 1, explanation: 'Las fuentes históricas deben evaluarse críticamente, especialmente cuando proceden de opositores.', references: 'Proverbios 18:13,17; 1 Tesalonicenses 5:21'),
    ],
  ),
  QuizPack(
    title: 'Controversias doctrinales e historia',
    description: 'Identificación de errores históricos y evaluación bíblica de sus afirmaciones.',
    difficulty: 'Avanzado',
    source: 'Defensa de la Sana Doctrina · estudios 11–80',
    questions: [
      QuizQuestion(question: '¿Qué cuestión central estuvo en la controversia nestoriana?', options: ['Cómo expresar la unidad personal de Cristo y la relación entre su divinidad y humanidad', 'Si Jesús fue un ángel', 'Si la Iglesia debía abandonar el Antiguo Testamento', 'Si la resurrección fue simbólica'], correctIndex: 0, explanation: 'La controversia se centró en cómo confesar que el único sujeto de la encarnación es el Hijo, sin confundir ni separar su humanidad y divinidad.', references: 'Juan 1:14; Colosenses 2:9; Hebreos 2:14-18'),
      QuizQuestion(question: '¿Qué riesgo se asocia con el eutiquianismo?', options: ['Que la humanidad de Cristo quede absorbida o anulada después de la encarnación', 'Que Cristo sea considerado un profeta solamente', 'Que el Hijo sea presentado como un ángel', 'Que se niegue la existencia del Padre'], correctIndex: 0, explanation: 'La fe cristiana afirma que el Hijo es plenamente divino y verdaderamente humano; su humanidad no desaparece ni queda absorbida.', references: 'Juan 1:14; Filipenses 2:5-11; Hebreos 2:14-18'),
      QuizQuestion(question: '¿Qué expresa el término homoousios utilizado en el Concilio de Nicea?', options: ['Que el Hijo es de la misma esencia que el Padre', 'Que el Hijo es una criatura superior', 'Que el Padre y el Hijo son la misma persona', 'Que existen tres esencias divinas'], correctIndex: 0, explanation: 'El término griego fue empleado para confesar que el Hijo comparte plenamente la esencia divina y no pertenece al orden de las criaturas.', references: 'Juan 1:1-3; Colosenses 2:9; Hebreos 1:1-12'),
      QuizQuestion(question: '¿Qué buscaba afirmar históricamente el título Theotokos aplicado a María?', options: ['Que María originó la naturaleza divina', 'Que quien nació de María es la persona del Hijo encarnado', 'Que María es una cuarta persona divina', 'Que Jesús comenzó a existir en Belén'], correctIndex: 1, explanation: 'El título se utilizó para proteger la unidad personal de Jesucristo; no significa que María sea el origen de la divinidad del Hijo.', references: 'Lucas 1:35; Juan 1:14; Gálatas 4:4'),
      QuizQuestion(question: '¿Qué afirmaba el marcionismo sobre el Dios del Antiguo Testamento y el Padre anunciado por Jesús?', options: ['Que son el mismo Dios revelado en una sola historia', 'Que debían oponerse radicalmente', 'Que el Antiguo Testamento contiene toda la revelación', 'Que Jesús rechazó las Escrituras de Israel'], correctIndex: 1, explanation: 'El movimiento de Marción estableció una oposición radical que debe evaluarse frente al uso que Jesús y los apóstoles hacen de las Escrituras de Israel.', references: 'Lucas 24:25-27,44; 2 Timoteo 3:16-17'),
      QuizQuestion(question: '¿Qué enseña la Biblia frente al dualismo radical?', options: ['Que existen dos principios eternos equivalentes', 'Que solo Dios es el Creador y todo lo creado depende de Él', 'Que Satanás es eterno como Dios', 'Que la materia es intrínsecamente mala'], correctIndex: 1, explanation: 'La Escritura afirma la soberanía del único Dios y la creación de todas las cosas por medio de Cristo.', references: 'Isaías 45:5-7; Colosenses 1:16-17'),
    ],
  ),

  QuizPack(
    title: 'Persona y obra del Espíritu Santo',
    description: 'Personalidad, deidad, misión y fruto del Espíritu.',
    difficulty: 'Intermedio',
    source: 'Estudios sobre el Espíritu Santo',
    questions: [
      QuizQuestion(question: '¿Qué muestra Hechos 13:2 acerca del Espíritu Santo?', options: ['Que es una fuerza sin voluntad', 'Que habla y aparta personas para una misión', 'Que no participa en la misión', 'Que es un ángel creado'], correctIndex: 1, explanation: 'El Espíritu habla y dirige la misión de la Iglesia, mostrando acción personal.', references: 'Hechos 13:2-4'),
      QuizQuestion(question: '¿Qué relación establece Hechos 5:3-4?', options: ['Mentir al Espíritu es mentir a Dios', 'El Espíritu es un mensajero humano', 'El Espíritu es una criatura', 'El Espíritu no conoce el pecado'], correctIndex: 0, explanation: 'Pedro relaciona directamente al Espíritu Santo con Dios, afirmando su deidad.', references: 'Hechos 5:3-4'),
      QuizQuestion(question: '¿Quién enseña y recuerda las palabras de Jesús según Juan 14?', options: ['Un ángel', 'El Espíritu Santo', 'Un gobernante', 'La tradición civil'], correctIndex: 1, explanation: 'Jesús promete que el Padre enviará al Consolador, quien enseñará y recordará sus palabras.', references: 'Juan 14:16,26'),
      QuizQuestion(question: '¿Qué hace el Espíritu según Juan 16:14?', options: ['Se glorifica a sí mismo sin relación con Cristo', 'Glorifica al Hijo', 'Niega la enseñanza de Jesús', 'Reemplaza al Padre'], correctIndex: 1, explanation: 'El Espíritu toma de lo que pertenece al Hijo y lo comunica, glorificándolo.', references: 'Juan 16:13-15'),
      QuizQuestion(question: '¿Qué enseña Gálatas 5:22-23?', options: ['El fruto del Espíritu', 'La salvación por riqueza', 'La superioridad de algunos creyentes', 'La inutilidad de la santidad'], correctIndex: 0, explanation: 'El Espíritu produce un carácter visible en amor, gozo, paz y las demás virtudes enumeradas.', references: 'Gálatas 5:22-23'),
      QuizQuestion(question: '¿Qué significa contristar al Espíritu?', options: ['Que el Espíritu es impersonal', 'Entristecerlo mediante una conducta contraria a la vida nueva', 'Que el Espíritu deja de ser Dios', 'Que la Iglesia no necesita obedecer'], correctIndex: 1, explanation: 'Pablo utiliza lenguaje personal y llama a abandonar amargura, ira, malicia y mentira.', references: 'Efesios 4:25-32'),
      QuizQuestion(question: '¿Para qué se conceden los dones espirituales?', options: ['Para competir por prestigio', 'Para el bien común y edificación', 'Para crear jerarquías de valor', 'Para evitar el servicio'], correctIndex: 1, explanation: 'El Espíritu distribuye los dones para provecho y edificación de la comunidad.', references: '1 Corintios 12:4-11'),
      QuizQuestion(question: '¿Qué orden da Pablo sobre las profecías?', options: ['Aceptar toda afirmación sin examen', 'Prohibir todo discernimiento', 'Evaluarlas y retener lo bueno', 'Considerarlas superiores a la Escritura'], correctIndex: 2, explanation: 'La Iglesia debe examinar las afirmaciones y conservar lo que es bueno.', references: '1 Tesalonicenses 5:19-22; 1 Corintios 14:29'),
    ],
  ),
  QuizPack(
    title: 'La Iglesia y sus ordenanzas',
    description: 'Identidad, comunión, bautismo y Cena del Señor.',
    difficulty: 'Intermedio',
    source: 'Estudios sobre la Iglesia',
    questions: [
      QuizQuestion(question: '¿Quién es la cabeza de la Iglesia?', options: ['Un apóstol actual', 'Un gobernante civil', 'Jesucristo', 'Una institución humana'], correctIndex: 2, explanation: 'El Nuevo Testamento presenta a Cristo como cabeza y autoridad de la Iglesia.', references: 'Efesios 1:22-23; Colosenses 1:18'),
      QuizQuestion(question: '¿Qué perseveraba en la iglesia de Jerusalén?', options: ['Solo en reuniones sociales', 'En doctrina apostólica, comunión, partimiento del pan y oraciones', 'En tradiciones paganas', 'En la búsqueda de prestigio'], correctIndex: 1, explanation: 'Hechos describe una comunidad formada por enseñanza, comunión, adoración y oración.', references: 'Hechos 2:42-47'),
      QuizQuestion(question: '¿Qué mandato dio Jesús sobre el bautismo?', options: ['Bautizar en el nombre del Padre, del Hijo y del Espíritu Santo', 'Bautizar en tres dioses', 'Bautizar sin hacer discípulos', 'Reemplazar la enseñanza por el rito'], correctIndex: 0, explanation: 'El bautismo está unido a hacer discípulos y enseñar a obedecer lo que Jesús mandó.', references: 'Mateo 28:18-20'),
      QuizQuestion(question: '¿Qué recuerda y proclama la Cena del Señor?', options: ['La muerte de Cristo hasta que Él venga', 'La repetición de la crucifixión', 'La superioridad de una congregación', 'La compra de la salvación'], correctIndex: 0, explanation: 'Pablo enseña que la Cena anuncia la muerte del Señor y mantiene la esperanza de su regreso.', references: '1 Corintios 11:23-26'),
      QuizQuestion(question: '¿Qué significa ser un cuerpo con muchos miembros?', options: ['Que todos cumplen exactamente la misma función', 'Que hay diversidad de miembros y unidad en Cristo', 'Que algunos miembros no importan', 'Que la Iglesia no necesita amor'], correctIndex: 1, explanation: 'La diversidad de funciones sirve al bien común y no elimina la unidad del cuerpo.', references: '1 Corintios 12:12-27'),
      QuizQuestion(question: '¿Cómo debe ejercerse el liderazgo pastoral?', options: ['Dominando al rebaño', 'Por interés económico', 'Como ejemplo y servicio, no como dominio', 'Sin rendir cuentas'], correctIndex: 2, explanation: 'Pedro llama a pastorear voluntariamente y siendo ejemplo del rebaño.', references: '1 Pedro 5:1-4'),
      QuizQuestion(question: '¿Qué propósito tiene la disciplina eclesial?', options: ['Vengarse de quien falla', 'Procurar corrección, protección y restauración', 'Humillar públicamente', 'Imponer preferencias personales'], correctIndex: 1, explanation: 'La corrección bíblica busca ganar al hermano y restaurarlo con mansedumbre.', references: 'Mateo 18:15-17; Gálatas 6:1'),
      QuizQuestion(question: '¿Qué une a los creyentes según Efesios 4:4-6?', options: ['Una misma cultura', 'Un solo cuerpo, Espíritu, Señor, fe, bautismo y Dios y Padre', 'Una misma profesión', 'Un solo dirigente humano'], correctIndex: 1, explanation: 'Pablo fundamenta la unidad de la Iglesia en las realidades compartidas de la fe.', references: 'Efesios 4:1-6'),
    ],
  ),
  QuizPack(
    title: 'Vida cristiana y santidad',
    description: 'Obediencia, carácter, libertad y fruto de la gracia.',
    difficulty: 'Básico',
    source: 'Estudios sobre salvación y santidad',
    questions: [
      QuizQuestion(question: '¿Cuál es la base de la salvación según Efesios 2:8-9?', options: ['Méritos humanos', 'Gracia mediante la fe', 'Riqueza material', 'Linaje familiar'], correctIndex: 1, explanation: 'La salvación es don de Dios y no motivo de jactancia humana.', references: 'Efesios 2:8-10'),
      QuizQuestion(question: '¿Qué lugar tienen las buenas obras en Efesios 2:10?', options: ['Son la causa de la gracia', 'Son el fruto para el que Dios creó a los creyentes en Cristo', 'No tienen ninguna importancia', 'Reemplazan la fe'], correctIndex: 1, explanation: 'Las obras no compran la salvación; son el resultado de la nueva vida recibida.', references: 'Efesios 2:8-10'),
      QuizQuestion(question: '¿Qué significa andar en el Espíritu?', options: ['Vivir bajo su dirección y producir fruto', 'Seguir cualquier impulso personal', 'Ignorar la Escritura', 'Buscar reconocimiento'], correctIndex: 0, explanation: 'Pablo contrasta la vida guiada por el Espíritu con las obras de la carne.', references: 'Gálatas 5:16-25'),
      QuizQuestion(question: '¿Qué enseña Romanos 12:1-2 sobre la vida cristiana?', options: ['Conformarse al mundo', 'Presentar la vida a Dios y renovar la mente', 'Buscar solo apariencia externa', 'Evitar toda responsabilidad'], correctIndex: 1, explanation: 'La respuesta a la misericordia de Dios es una vida consagrada y una mente renovada.', references: 'Romanos 12:1-2'),
      QuizQuestion(question: '¿Qué es la libertad cristiana?', options: ['Permiso para pecar', 'Liberación para servir en amor', 'Ausencia de toda responsabilidad', 'Rechazo de los mandamientos de Cristo'], correctIndex: 1, explanation: 'Pablo enseña que la libertad no debe usarse como ocasión para la carne, sino para servir por amor.', references: 'Gálatas 5:1,13-14'),
      QuizQuestion(question: '¿Qué debe caracterizar el arrepentimiento?', options: ['Solo remordimiento', 'Volverse a Dios con una dirección nueva', 'Culpar a otros', 'Una emoción sin fruto'], correctIndex: 1, explanation: 'El arrepentimiento bíblico se evidencia en frutos y en una respuesta real a Dios.', references: 'Hechos 3:19; Mateo 3:8'),
      QuizQuestion(question: '¿Qué enseña Jesús sobre la grandeza en el reino?', options: ['Dominar a los demás', 'Servir siguiendo su ejemplo', 'Buscar títulos', 'Acumular prestigio'], correctIndex: 1, explanation: 'Jesús presenta el servicio como modelo de liderazgo y señala su propia entrega.', references: 'Marcos 10:42-45'),
      QuizQuestion(question: '¿Qué significa la santidad cristiana?', options: ['Apariencia religiosa', 'Ser apartado para Dios y vivir en obediencia', 'No necesitar gracia', 'Despreciar a otras personas'], correctIndex: 1, explanation: 'El llamado a la santidad se fundamenta en el carácter santo de Dios y se vive por su gracia.', references: '1 Pedro 1:15-16; 1 Tesalonicenses 4:3'),
    ],
  ),
  QuizPack(
    title: 'Escatología y esperanza cristiana',
    description: 'Resurrección, regreso de Cristo, juicio y nueva creación.',
    difficulty: 'Avanzado',
    source: 'Estudios sobre esperanza futura',
    questions: [
      QuizQuestion(question: '¿Qué afirma 1 Corintios 15 acerca de la resurrección?', options: ['Que es solo una metáfora', 'Que Cristo resucitó y es primicia de los que durmieron', 'Que el cuerpo no importa', 'Que la muerte no será vencida'], correctIndex: 1, explanation: 'La resurrección de Cristo es fundamento de la esperanza y garantía de la resurrección de los suyos.', references: '1 Corintios 15:12-23'),
      QuizQuestion(question: '¿Qué enseña Hechos 1:11?', options: ['Que Jesús no regresará', 'Que Jesús volverá de la manera en que fue recibido en el cielo', 'Que los discípulos conocen la fecha', 'Que la Iglesia debe fijar calendarios'], correctIndex: 1, explanation: 'Los ángeles anuncian el regreso de Jesús y llaman a la esperanza, no al cálculo de fechas.', references: 'Hechos 1:9-11'),
      QuizQuestion(question: '¿Quién conoce el día y la hora de la venida?', options: ['Los intérpretes modernos', 'Los discípulos', 'Solo el Padre', 'Los gobiernos'], correctIndex: 2, explanation: 'Jesús enseña que nadie conoce el día ni la hora; por eso llama a velar.', references: 'Mateo 24:36,42'),
      QuizQuestion(question: '¿Qué describe Apocalipsis 21:1-5?', options: ['La nueva creación y Dios habitando con su pueblo', 'La desaparición de toda esperanza', 'La creación de varios dioses', 'Una fecha para el regreso de Cristo'], correctIndex: 0, explanation: 'La esperanza final incluye nueva creación, comunión con Dios y el fin de la muerte y el dolor.', references: 'Apocalipsis 21:1-5'),
      QuizQuestion(question: '¿Qué es el juicio final?', options: ['Una opinión humana', 'La manifestación definitiva de la justicia de Dios', 'Un evento sin relación con la conducta', 'Una oportunidad para fijar fechas'], correctIndex: 1, explanation: 'La Escritura enseña que Dios juzgará con justicia y que todos darán cuenta delante de Él.', references: 'Romanos 2:5-11; Apocalipsis 20:11-15'),
      QuizQuestion(question: '¿Qué significa perseverar en la esperanza?', options: ['Negar las dificultades', 'Permanecer fiel a Cristo mientras se espera su promesa', 'Abandonar la comunidad', 'Confiar en fechas humanas'], correctIndex: 1, explanation: 'La esperanza cristiana produce firmeza, santidad y fidelidad durante la espera.', references: 'Tito 2:11-14; Hebreos 10:23-25'),
      QuizQuestion(question: '¿Qué significa la segunda muerte en Apocalipsis?', options: ['La muerte física de todos', 'La imagen del juicio final', 'La primera resurrección', 'La ascensión de Cristo'], correctIndex: 1, explanation: 'Apocalipsis utiliza la expresión para describir el destino final bajo el juicio de Dios.', references: 'Apocalipsis 20:14; 21:8'),
      QuizQuestion(question: '¿Qué efecto debe producir la esperanza del regreso de Cristo?', options: ['Especulación constante', 'Vigilancia, consuelo y vida santa', 'Desinterés por el prójimo', 'Abandono de la misión'], correctIndex: 1, explanation: 'La esperanza bíblica anima a vivir con sobriedad, amor y fidelidad.', references: '1 Tesalonicenses 4:13-18; 5:6-11'),
    ],
  ),
  QuizPack(
    title: 'Pactos y teología bíblica',
    description: 'La continuidad de las promesas de Dios y su cumplimiento en Cristo.',
    difficulty: 'Avanzado',
    source: 'Estudios sobre pactos y promesas',
    questions: [
      QuizQuestion(question: '¿Qué promesa central recibió Abraham?', options: ['Que no tendría descendencia', 'Que en él serían benditas las familias de la tierra', 'Que Israel nunca enfrentaría pruebas', 'Que la ley mosaica ya había sido entregada'], correctIndex: 1, explanation: 'La promesa abrahámica incluye descendencia y bendición para las naciones.', references: 'Génesis 12:1-3; Gálatas 3:8'),
      QuizQuestion(question: '¿Qué relación tiene el pacto davídico con Jesucristo?', options: ['Ninguna relación', 'Jesús es el heredero mesiánico del trono prometido a David', 'David es el mediador del nuevo pacto', 'El pacto terminó toda esperanza mesiánica'], correctIndex: 1, explanation: 'Los relatos del nacimiento presentan a Jesús como heredero del trono de David.', references: '2 Samuel 7:12-16; Lucas 1:32-33'),
      QuizQuestion(question: '¿Dónde anuncia Jeremías el nuevo pacto?', options: ['Jeremías 31:31-34', 'Génesis 1:1', 'Jueces 2:1-5', 'Proverbios 31:10'], correctIndex: 0, explanation: 'Jeremías anuncia perdón, ley escrita en el corazón y conocimiento de Dios.', references: 'Jeremías 31:31-34; Hebreos 8:6-13'),
      QuizQuestion(question: '¿Qué establece Jesús al hablar de la copa en la última cena?', options: ['Un nuevo pacto en su sangre', 'La abolición de toda esperanza', 'Un pacto con los imperios', 'La repetición del sacrificio levítico'], correctIndex: 0, explanation: 'Jesús relaciona la copa con el nuevo pacto y su entrega sacrificial.', references: 'Lucas 22:19-20; 1 Corintios 11:25'),
      QuizQuestion(question: '¿Qué diferencia debe mantenerse entre los pactos bíblicos?', options: ['Todos son idénticos en destinatarios y condiciones', 'Cada pacto debe leerse en su contexto y lugar en la historia redentora', 'Ninguno tiene relación con Cristo', 'Los pactos son simples metáforas sin historia'], correctIndex: 1, explanation: 'La teología bíblica reconoce continuidad y diferencias entre los pactos y sigue su desarrollo hacia Cristo.', references: 'Génesis 17:1-8; Éxodo 19:3-6; Hebreos 8:6-13'),
      QuizQuestion(question: '¿Qué hace la tipología bíblica?', options: ['Inventa conexiones por semejanza superficial', 'Reconoce patrones históricos que la Escritura relaciona con cumplimientos posteriores', 'Niega el sentido histórico', 'Convierte toda narración en alegoría'], correctIndex: 1, explanation: 'Las conexiones tipológicas deben sostenerse en el texto y respetar la realidad histórica de los acontecimientos.', references: 'Romanos 5:14; 1 Corintios 10:1-11'),
      QuizQuestion(question: '¿Qué significa que Cristo es el mediador del nuevo pacto?', options: ['Que reemplaza al Padre', 'Que establece y garantiza el nuevo pacto por su obra', 'Que es un sacerdote levítico más', 'Que la salvación depende de méritos humanos'], correctIndex: 1, explanation: 'Hebreos presenta a Jesús como mediador superior por su sacrificio y ministerio sacerdotal.', references: 'Hebreos 8:6; 9:15; 12:24'),
      QuizQuestion(question: '¿Qué enseña Gálatas 3 acerca de la promesa a Abraham?', options: ['Que la ley anuló la promesa', 'Que la promesa encuentra su cumplimiento en Cristo', 'Que los gentiles quedan excluidos', 'Que la bendición depende de genealogía'], correctIndex: 1, explanation: 'Pablo explica que la promesa precede a la ley y se cumple en Cristo, extendiendo la bendición a los que creen.', references: 'Gálatas 3:16-29'),
    ],
  ),
];

// Preguntas con enfoques distintos: afirmación, contexto, relación canónica,
// límites de interpretación, distinciones doctrinales y aplicación.
const List<String> _evaluationFrames = [
  '¿Qué afirmación resume con mayor precisión «{t}»?',
  'Al leer el pasaje principal en su párrafo completo, ¿qué debe conservarse?',
  '¿Qué conclusión está respaldada por las referencias bíblicas de «{t}»?',
  '¿Cómo debe relacionarse el pasaje principal con los demás textos citados?',
  '¿Cuál interpretación evita añadir al texto una idea que no expresa?',
  '¿Qué aspecto doctrinal no debe perderse al explicar «{t}»?',
  '¿Qué afirmación respeta tanto el contexto inmediato como el contexto bíblico general?',
  'Si dos pasajes parecen usar expresiones distintas, ¿qué principio ayuda a estudiarlos?',
  '¿Cuál conclusión distingue lo que el texto afirma de lo que solo podría suponerse?',
  '¿Qué criterio permite evaluar una enseñanza sobre «{t}»?',
  '¿Qué lectura toma en cuenta quién habla, a quién se dirige y con qué propósito?',
  '¿Cuál afirmación evita confundir conceptos que la Escritura mantiene diferenciados?',
  '¿Qué respuesta se mantiene dentro de los límites de la evidencia bíblica citada?',
  '¿Qué debe hacer el estudiante antes de formular una conclusión doctrinal sobre «{t}»?',
  '¿Qué opción armoniza el pasaje con el testimonio completo de la Escritura?',
  '¿Cuál es la mejor manera de responder a una objeción basada en un versículo aislado?',
  '¿Qué conclusión puede enseñarse sin omitir los textos que complementan el tema?',
  '¿Qué práctica fortalece una defensa bíblica responsable de «{t}»?',
  '¿Cuál afirmación diferencia una explicación del texto de una opinión personal?',
  'Después de comparar las referencias, ¿qué conclusión central debe retenerse?',
];

const List<String> _evaluationExplanations = [
  'La respuesta identifica la proposición central del tema. No debe confundirse la síntesis doctrinal con una frase aislada.',
  'El párrafo y el argumento del capítulo delimitan el sentido de las palabras; leer solo una frase puede alterar el significado.',
  'Una conclusión doctrinal debe poder sostenerse con los pasajes indicados y no depender de una premisa externa.',
  'Los textos relacionados se interpretan de manera complementaria, atendiendo al propósito y al contexto de cada autor.',
  'La interpretación responsable distingue entre lo que el pasaje declara y las inferencias que no demuestra.',
  'Una explicación fiel conserva el énfasis doctrinal del tema y evita reducirlo a una formulación incompleta.',
  'El contexto inmediato y el conjunto de la Biblia deben considerarse juntos, sin forzar contradicciones artificiales.',
  'Las diferencias de expresión deben estudiarse atendiendo al género, audiencia y propósito de cada pasaje.',
  'No se debe presentar como enseñanza explícita aquello que el texto no afirma; las inferencias requieren fundamento.',
  'Toda enseñanza debe examinarse mediante el contexto, la comparación de pasajes y la coherencia con el evangelio.',
  'Identificar emisor, destinatario y propósito ayuda a evitar aplicaciones fuera del sentido original.',
  'La precisión doctrinal exige mantener las distinciones que los propios pasajes presentan.',
  'La conclusión correcta no puede ir más allá de la evidencia ni ignorar referencias relevantes.',
  'Primero se observa el texto, después se interpreta en contexto y finalmente se formula la conclusión.',
  'La armonía bíblica no consiste en borrar diferencias, sino en comprender cómo cada pasaje contribuye al tema.',
  'Un versículo aislado no debe separarse del argumento del capítulo ni del testimonio bíblico relacionado.',
  'Una enseñanza completa considera los textos que amplían, precisan o complementan el tema.',
  'La defensa bíblica requiere leer, comparar, explicar y responder con respeto y fidelidad al texto.',
  'Las opiniones personales no tienen la misma autoridad que la enseñanza demostrable de la Escritura.',
  'La conclusión central debe reflejar el contenido de las referencias y permanecer fiel al contexto de cada una.',
];

const List<String> _evaluationDistractors = [
  'Debe interpretarse separado del argumento del capítulo para evitar que otros textos influyan.',
  'Una palabra aislada basta para establecer la doctrina, aunque el contexto indique otra cosa.',
  'La conclusión puede sostenerse aunque el pasaje no presente evidencia para ella.',
  'La tradición interpretativa debe sustituir el sentido que se obtiene del contexto.',
  'Los textos que parecen distintos deben considerarse contradictorios sin intentar compararlos.',
  'El género literario, los destinatarios y el propósito del autor no afectan la interpretación.',
  'Una explicación doctrinal es válida aunque omita referencias bíblicas relevantes.',
  'La opinión del lector tiene prioridad cuando el texto resulta difícil.',
  'Solo debe considerarse el versículo citado, nunca el párrafo ni el libro completo.',
  'Una inferencia posible debe tratarse como si fuera una afirmación explícita del pasaje.',
];

List<QuizQuestion> _generateEvaluationQuestions(
  String topic, String truth, String references,
) => List<QuizQuestion>.generate(20, (index) {
  final correct = index % 4;
  final options = <String>[];
  for (var slot = 0; slot < 4; slot++) {
    options.add(slot == correct
      ? truth
      : _evaluationDistractors[(index * 3 + slot + index ~/ 2) % _evaluationDistractors.length]);
  }
  return QuizQuestion(
    question: _evaluationFrames[index].replaceAll('{t}', topic),
    options: options,
    correctIndex: correct,
    explanation: '${_evaluationExplanations[index]} ${truth} Referencias para comprobarlo: ${references}.',
    references: references,
  );
});

QuizPack _expandEvaluation(QuizPack pack) {
  if (pack.questions.length >= 20) {
    return QuizPack(
      title: pack.title, description: pack.description,
      questions: pack.questions.take(20).toList(),
      difficulty: pack.difficulty, source: pack.source,
    );
  }
  final refs = pack.questions.isEmpty
    ? '2 Timoteo 3:16-17; Hechos 17:11'
    : pack.questions.first.references;
  final generated = _generateEvaluationQuestions(pack.title, pack.description, refs);
  return QuizPack(
    title: pack.title, description: pack.description,
    questions: <QuizQuestion>[
      ...pack.questions,
      ...generated.take(20 - pack.questions.length),
    ],
    difficulty: pack.difficulty, source: pack.source,
  );
}


QuizQuestion _curatedQuestion(
  String question,
  List<String> options,
  int correctIndex,
  String explanation,
  String references,
) => QuizQuestion(
  question: question,
  options: options,
  correctIndex: correctIndex,
  explanation: explanation,
  references: references,
);

List<QuizQuestion>? _doctrinalQuestionsFor(String title) {
  switch (title) {
    case 'El Padre':
      return [
        _curatedQuestion('En el bautismo de Jesús, ¿quién habla desde los cielos?', ['Jesús dirigiéndose a sí mismo', 'El Padre dando testimonio del Hijo', 'Juan el Bautista', 'Un ángel'], 1, 'Mateo distingue al Hijo que es bautizado, al Espíritu que desciende y al Padre que habla desde los cielos.', 'Mateo 3:16-17; Marcos 1:9-11'),
        _curatedQuestion('En Juan 17:1-5, ¿a quién dirige Jesús su oración?', ['Al Padre', 'Al Espíritu Santo', 'A los discípulos', 'A los ángeles'], 0, 'La oración muestra una relación personal real entre el Hijo y el Padre, anterior a la encarnación.', 'Juan 17:1-5'),
        _curatedQuestion('Según Efesios 1:3-6, ¿qué hace el Padre en el plan de salvación?', ['Es presentado como quien adopta a los creyentes por medio de Jesucristo', 'Es identificado como el apóstol Pablo', 'Es quien reemplaza la obra del Hijo', 'Es descrito como una criatura'], 0, 'Pablo atribuye al Padre la elección y adopción, y señala que estas bendiciones llegan por medio de Jesucristo.', 'Efesios 1:3-6'),
        _curatedQuestion('¿Qué demuestra la expresión «mi Hijo amado» en Mateo 3:17?', ['Que Padre e Hijo son la misma persona sin distinción', 'Que el Padre identifica al Hijo y expresa su complacencia en él', 'Que Jesús es un profeta más', 'Que el Espíritu no estaba presente'], 1, 'La voz identifica al Hijo como objeto del testimonio del Padre; la escena presenta distinción personal.', 'Mateo 3:16-17'),
        _curatedQuestion('En Juan 5:19-23, ¿qué relación presenta Jesús entre el Padre y el Hijo?', ['El Hijo actúa en perfecta relación con el Padre y recibe honra correspondiente', 'El Padre y el Hijo son adversarios', 'El Hijo desconoce al Padre', 'El Padre deja de ser Dios'], 0, 'El pasaje presenta la obra y la honra del Hijo en relación con el Padre, sin confundir sus personas.', 'Juan 5:19-23'),
      ];
    case 'Divinidad del Hijo':
      return [
        _curatedQuestion('¿Qué afirma Juan 1:1 acerca del Verbo?', ['Que era una criatura', 'Que estaba con Dios y era Dios', 'Que comenzó a existir en Belén', 'Que era solamente una idea'], 1, 'Juan afirma tanto la distinción relacional del Verbo respecto de Dios como su plena deidad.', 'Juan 1:1-3'),
        _curatedQuestion('¿Cómo responde Tomás al encontrarse con el Cristo resucitado?', ['«Mi Señor y mi Dios»', '«Mi maestro y profeta»', '«Mi rey terrenal»', '«Mi ángel»'], 0, 'Tomás dirige a Jesús una confesión explícita de señorío y deidad, que Jesús no rechaza.', 'Juan 20:26-29'),
        _curatedQuestion('¿Qué tratamiento recibe el Hijo en Hebreos 1:8?', ['Es llamado Dios en el argumento sobre su superioridad', 'Es llamado un ángel creado', 'Es presentado como inferior a los ángeles por naturaleza', 'Es identificado como el Espíritu Santo'], 0, 'Hebreos aplica al Hijo un lenguaje de realeza y deidad para mostrar su superioridad sobre los ángeles.', 'Hebreos 1:5-9'),
        _curatedQuestion('Según Colosenses 1:16-17, ¿qué papel tiene el Hijo respecto de la creación?', ['Todas las cosas fueron creadas por medio de él y para él', 'Él fue creado junto con los astros', 'Solo apareció después de la creación', 'No tiene relación con el universo'], 0, 'Pablo atribuye al Hijo la mediación de la creación y su sustentación, no un lugar entre las criaturas.', 'Colosenses 1:15-17'),
        _curatedQuestion('¿Qué enseña Filipenses 2:6-8 sobre Cristo?', ['Existiendo en forma de Dios, tomó condición de siervo y se humilló', 'Dejó de ser divino al encarnarse', 'Fue elevado a la divinidad por primera vez', 'Solo aparentó ser humano'], 0, 'El movimiento del pasaje va de la condición divina a la humillación voluntaria y a la obediencia hasta la muerte.', 'Filipenses 2:5-11'),
      ];
    case 'Persona del Espíritu Santo':
      return [
        _curatedQuestion('¿Qué hace el Espíritu Santo según Juan 14:26?', ['Enseña y recuerda a los discípulos las palabras de Jesús', 'Es presentado como una fuerza sin acción personal', 'Sustituye las palabras de Jesús', 'Niega la enseñanza apostólica'], 0, 'Jesús atribuye al Espíritu acciones personales de enseñanza y recordatorio.', 'Juan 14:25-26'),
        _curatedQuestion('En Hechos 13:2, ¿cómo se expresa el Espíritu Santo?', ['Habla y aparta a Bernabé y Saulo para una obra', 'Es descrito como un objeto del templo', 'Permanece sin intervenir', 'Es confundido con Herodes'], 0, 'El Espíritu habla en la comunidad y dirige una misión concreta.', 'Hechos 13:1-4'),
        _curatedQuestion('¿Qué advierte Pablo en Efesios 4:30?', ['Que no se entristezca al Espíritu Santo', 'Que el Espíritu no conoce a la Iglesia', 'Que el Espíritu es una emoción humana', 'Que los creyentes deben ignorarlo'], 0, 'La exhortación presupone una relación personal con el Espíritu, a quien se puede entristecer.', 'Efesios 4:25-32'),
        _curatedQuestion('¿Qué conclusión presenta Hechos 5:3-4 al comparar mentir al Espíritu con mentir a Dios?', ['El Espíritu Santo es presentado con identidad divina', 'El Espíritu es un ángel creado', 'El Espíritu es solo una metáfora', 'Pedro niega la existencia de Dios'], 0, 'Pedro identifica la mentira al Espíritu con mentir a Dios, un dato central para la doctrina de su deidad.', 'Hechos 5:3-4'),
        _curatedQuestion('Según 1 Corintios 12:11, ¿quién distribuye los dones como quiere?', ['El mismo Espíritu', 'Los creyentes según popularidad', 'Los gobernantes civiles', 'Los ángeles por iniciativa propia'], 0, 'La distribución soberana de los dones se atribuye al Espíritu, mostrando voluntad y acción personal.', '1 Corintios 12:4-11'),
      ];
    case 'Relaciones trinitarias':
      return [
        _curatedQuestion('¿Qué distingue la escena de Mateo 3:16-17?', ['Al Hijo bautizado, al Espíritu descendiendo y al Padre hablando', 'Tres dioses que compiten', 'Una sola persona cambiando de apariencia en momentos sucesivos', 'La ausencia del Espíritu'], 0, 'Los tres aparecen simultáneamente en relaciones diferenciadas dentro de una misma escena.', 'Mateo 3:16-17'),
        _curatedQuestion('¿Qué estructura aparece en 2 Corintios 13:14?', ['La gracia de Cristo, el amor de Dios y la comunión del Espíritu', 'Una lista de tres ángeles', 'Tres caminos independientes de salvación', 'Una negación de la unidad divina'], 0, 'La bendición apostólica coordina a Cristo, Dios y el Espíritu en la vida de la Iglesia.', '2 Corintios 13:14'),
        _curatedQuestion('¿Qué muestra 1 Pedro 1:2 sobre la obra trinitaria?', ['Presciencia del Padre, santificación del Espíritu y obediencia a Jesucristo', 'Tres salvaciones distintas', 'Que el Espíritu es una criatura', 'Que el Hijo no participa en la redención'], 0, 'Pedro distingue las acciones relacionadas del Padre, el Espíritu y Jesucristo en la salvación.', '1 Pedro 1:1-2'),
        _curatedQuestion('¿Qué debe afirmarse al relacionar unidad divina y distinción personal?', ['Un solo Dios sin confundir al Padre, al Hijo y al Espíritu', 'Tres dioses separados', 'Una persona con tres nombres intercambiables', 'Tres partes incompletas de Dios'], 0, 'La enseñanza trinitaria conserva simultáneamente el monoteísmo y las distinciones personales del testimonio bíblico.', 'Deuteronomio 6:4; Mateo 28:19; 2 Corintios 13:14'),
        _curatedQuestion('En Juan 14:16-17, ¿qué relación anuncia Jesús?', ['El Hijo pide al Padre y el Padre da otro Consolador', 'Jesús afirma que él es el Padre que se enviará a sí mismo', 'El Espíritu reemplaza al Padre', 'Los discípulos crean al Espíritu'], 0, 'El lenguaje de pedir, dar y enviar presenta relaciones personales diferenciadas.', 'Juan 14:16-17'),
      ];
    case 'Bautismo de Jesús':
      return [
        _curatedQuestion('¿Quién bautiza a Jesús en el Jordán?', ['Juan el Bautista', 'Pedro', 'El apóstol Juan', 'Moisés'], 0, 'Mateo narra que Jesús acude a Juan para ser bautizado y que Juan finalmente lo bautiza.', 'Mateo 3:13-16'),
        _curatedQuestion('¿Qué sucede con el Espíritu cuando Jesús sale del agua?', ['Desciende sobre él como paloma', 'Se convierte en agua', 'Desaparece de la escena', 'Habla desde el templo'], 0, 'Los evangelios describen el descenso del Espíritu sobre Jesús en el momento de su bautismo.', 'Mateo 3:16; Marcos 1:10; Lucas 3:22'),
        _curatedQuestion('¿Desde dónde se oye la voz que identifica al Hijo amado?', ['Desde los cielos', 'Desde Jerusalén', 'Desde el desierto', 'Desde la multitud'], 0, 'La voz celestial identifica a Jesús como el Hijo amado en quien el Padre se complace.', 'Mateo 3:17'),
        _curatedQuestion('¿Por qué esta escena es relevante para estudiar la Trinidad?', ['Porque presenta simultáneamente al Padre, al Hijo y al Espíritu', 'Porque enseña tres dioses rivales', 'Porque omite toda distinción personal', 'Porque niega la identidad de Jesús'], 0, 'La simultaneidad de las acciones impide reducir la escena a una sucesión de papeles de una sola persona.', 'Mateo 3:16-17'),
        _curatedQuestion('¿Qué añade Lucas 3:21-22 al relato?', ['Sitúa el descenso del Espíritu después del bautismo de Jesús mientras él ora', 'Afirma que Jesús no fue bautizado', 'Identifica al Espíritu con Juan', 'Elimina la voz celestial'], 0, 'Lucas conserva el bautismo, la oración de Jesús, el descenso del Espíritu y la voz celestial.', 'Lucas 3:21-22'),
      ];
    default:
      return null;
  }
}

List<QuizQuestion>? _curatedQuestionsFor(String title) {
  List<QuizQuestion> focusedQuestions;
  switch (title) {
    case 'El Padre':
      focusedQuestions = [
        _curatedQuestion('En Mateo 3:16-17, ¿quién habla desde los cielos mientras Jesús es bautizado?', ['Juan el Bautista', 'El Padre', 'El Espíritu Santo', 'Un ángel'], 1, 'La voz celestial identifica al Hijo amado y distingue al Padre que habla del Hijo que está siendo bautizado.', 'Mateo 3:13-17'),
        _curatedQuestion('Según Juan 17:1-5, ¿qué hace Jesús al comenzar su oración?', ['Se dirige al Padre y pide que el Hijo sea glorificado', 'Se dirige a Pedro como Padre', 'Declara que nunca existió junto al Padre', 'Pide ser enviado por el Espíritu como profeta'], 0, 'El capítulo presenta una relación real entre Jesús y el Padre: el Hijo ora al Padre y habla de la gloria que compartían antes de la creación.', 'Juan 17:1-5'),
        _curatedQuestion('En Efesios 1:3-6, ¿qué acción se atribuye al Padre?', ['Ser enviado por el Hijo al mundo', 'Elegir y adoptar a los creyentes por medio de Jesucristo', 'Ser derramado en Pentecostés', 'Morir en la cruz'], 1, 'Pablo presenta al Padre como quien bendice y adopta a los creyentes por medio de Jesucristo.', 'Efesios 1:3-6'),
        _curatedQuestion('¿Qué relación muestra Juan 5:19-23 entre el Padre y el Hijo?', ['El Hijo actúa independientemente y sin relación con el Padre', 'El Padre y el Hijo son la misma persona sin distinción', 'El Hijo obra en perfecta relación con el Padre y recibe honra correspondiente', 'El Padre deja de ser Dios cuando envía al Hijo'], 2, 'El pasaje distingue al Padre del Hijo y, a la vez, presenta una relación única en sus obras y en la honra debida al Hijo.', 'Juan 5:19-23'),
        _curatedQuestion('En la oración modelo de Mateo 6:9, ¿a quién enseña Jesús a dirigir la oración?', ['Al Padre', 'A los ángeles', 'A los apóstoles', 'A una fuerza impersonal'], 0, 'Jesús enseña a sus discípulos a orar al Padre, mostrando la relación filial que caracteriza la oración cristiana.', 'Mateo 6:9-13'),
        ..._generateEvaluationQuestions('El Padre', 'El Padre es una persona divina y no otro nombre del Hijo.', 'Mateo 3:16-17; Juan 5:19-23; Efesios 1:3-6').skip(5),
      ];
      return focusedQuestions;
    case 'Divinidad del Hijo':
      focusedQuestions = [
        _curatedQuestion('¿Qué afirma Juan 1:1 acerca del Verbo?', ['Que comenzó a existir cuando nació en Belén', 'Que era Dios y estaba con Dios', 'Que era un ángel creado', 'Que era solamente una idea de Dios'], 1, 'Juan distingue al Verbo de aquel con quien estaba y afirma su naturaleza divina; el versículo 3 añade que todo lo creado llegó a existir por medio de él.', 'Juan 1:1-3'),
        _curatedQuestion('¿Qué confesión hace Tomás al encontrarse con el Resucitado?', ['Mi maestro y profeta', 'Mi Señor y mi Dios', 'El hijo de José', 'El ángel del Señor'], 1, 'En Juan 20:28 Tomás se dirige directamente a Jesús y lo confiesa como Señor y Dios.', 'Juan 20:24-29'),
        _curatedQuestion('¿Qué declara Colosenses 2:9 sobre Cristo?', ['Que solo recibió una parte de la divinidad', 'Que en él habita corporalmente toda la plenitud de la Deidad', 'Que dejó de ser divino al encarnarse', 'Que fue creado antes de los ángeles'], 1, 'Pablo afirma la plenitud de la Deidad en Cristo; el contexto exhorta a permanecer arraigados en él.', 'Colosenses 2:8-10'),
        _curatedQuestion('En Hebreos 1:8, ¿cómo se dirige el texto al Hijo?', ['Como a un ser humano común', 'Como a un ángel principal', 'Con la expresión «Tu trono, oh Dios»', 'Como a un profeta adoptado'], 2, 'El argumento de Hebreos contrasta la superioridad del Hijo con los ángeles y aplica al Hijo lenguaje de realeza divina.', 'Hebreos 1:5-9'),
        _curatedQuestion('¿Qué enseña Juan 1:3 sobre la participación del Verbo en la creación?', ['Que fue creado junto con todas las cosas', 'Que todas las cosas por él fueron hechas', 'Que solo creó a los seres humanos', 'Que no tuvo relación con la creación'], 1, 'El prólogo atribuye al Verbo la mediación de toda la creación y excluye que pertenezca al conjunto de las cosas creadas.', 'Juan 1:1-3'),
        ..._generateEvaluationQuestions('Divinidad del Hijo', 'El Hijo es Dios y comparte la naturaleza divina, sin ser la persona del Padre.', 'Juan 1:1-3; Juan 20:28; Hebreos 1:8').skip(5),
      ];
      return focusedQuestions;
    case 'Persona del Espíritu Santo':
      focusedQuestions = [
        _curatedQuestion('En Juan 14:26, ¿qué obra atribuye Jesús al Espíritu Santo?', ['Enseñar y recordar a los discípulos lo que Jesús dijo', 'Ser una energía sin voluntad', 'Reemplazar la enseñanza de Jesús', 'Hablar únicamente por medio de los ángeles'], 0, 'Jesús presenta al Espíritu como el Consolador que el Padre enviará en su nombre y que enseñará y recordará sus palabras.', 'Juan 14:25-27'),
        _curatedQuestion('¿Qué acción personal del Espíritu aparece en Hechos 13:2?', ['Es descrito como quien habla y llama a Bernabé y Saulo', 'Es presentado como una piedra del templo', 'Es identificado con una emoción humana', 'Permanece completamente inactivo'], 0, 'El Espíritu habla y aparta a personas para la obra misionera; el relato lo presenta actuando personalmente en la comunidad.', 'Hechos 13:1-4'),
        _curatedQuestion('Según Efesios 4:30, ¿qué actitud hacia el Espíritu se prohíbe?', ['Entristecerlo', 'Obedecer la Palabra', 'Orar unos por otros', 'Practicar la verdad'], 0, 'La exhortación a no entristecer al Espíritu presupone una relación personal, no una fuerza impersonal.', 'Efesios 4:25-32'),
        _curatedQuestion('¿Qué pecado denuncia Pedro en Hechos 5:3-4?', ['Mentir al Espíritu Santo, lo que el texto relaciona con mentir a Dios', 'No cumplir una tradición humana', 'No viajar a Jerusalén', 'No comprender una parábola'], 0, 'Pedro identifica la mentira contra el Espíritu Santo y afirma que no se ha mentido a los hombres, sino a Dios.', 'Hechos 5:1-4'),
        _curatedQuestion('En 1 Corintios 12:11, ¿cómo distribuye el Espíritu los dones?', ['Según la decisión soberana del propio Espíritu', 'Por sorteo humano', 'Solo según la edad del creyente', 'De manera idéntica a todos'], 0, 'Pablo atribuye al Espíritu voluntad en la distribución de los dones, según quiere, para el bien común.', '1 Corintios 12:4-11'),
        ..._generateEvaluationQuestions('Persona del Espíritu Santo', 'El Espíritu habla, enseña, guía y puede ser entristecido; no es una fuerza impersonal.', 'Juan 14:16-17,26; Hechos 5:3-4; Efesios 4:30').skip(5),
      ];
      return focusedQuestions;
    case 'Bautismo de Jesús':
      focusedQuestions = [
        _curatedQuestion('¿Quién desciende sobre Jesús después de su bautismo?', ['El Espíritu de Dios', 'Moisés', 'Juan el Bautista', 'Un querubín'], 0, 'Mateo describe al Espíritu de Dios descendiendo como paloma sobre Jesús.', 'Mateo 3:13-17'),
        _curatedQuestion('¿Desde dónde se escucha la voz que declara a Jesús como Hijo amado?', ['Desde el templo', 'Desde los cielos', 'Desde el río por medio de Juan', 'Desde una multitud'], 1, 'La voz procede de los cielos y distingue al Padre que habla del Hijo presente en el Jordán.', 'Mateo 3:16-17'),
        _curatedQuestion('¿Qué muestra la escena del bautismo respecto a las personas divinas?', ['Que Padre, Hijo y Espíritu aparecen simultáneamente y diferenciados', 'Que Jesús es el Padre hablando desde el cielo', 'Que el Espíritu no participa', 'Que solo aparece un mensajero creado'], 0, 'El Hijo es bautizado, el Espíritu desciende y el Padre habla; el relato no presenta una sola persona desempeñando tres papeles sucesivos.', 'Mateo 3:13-17; Marcos 1:9-11'),
        _curatedQuestion('¿Qué propósito cumple la voz celestial en el relato?', ['Identificar y afirmar al Hijo amado', 'Corregir a Juan por bautizar', 'Anunciar el nacimiento de Moisés', 'Negar la misión de Jesús'], 0, 'La declaración del Padre identifica a Jesús y expresa su complacencia en el Hijo.', 'Mateo 3:16-17'),
        _curatedQuestion('¿Qué error de interpretación evita leer Mateo 3:16-17 en su secuencia narrativa?', ['Confundir al Padre que habla con el Hijo que está en el agua', 'Reconocer el descenso del Espíritu', 'Observar el bautismo de Jesús', 'Comparar el relato con Marcos'], 0, 'La secuencia y los sujetos del relato distinguen al Padre, al Hijo y al Espíritu en una misma escena.', 'Mateo 3:13-17; Lucas 3:21-22'),
        ..._generateEvaluationQuestions('Bautismo de Jesús', 'El Hijo es bautizado, el Espíritu desciende y el Padre habla desde los cielos.', 'Mateo 3:13-17; Marcos 1:9-11; Lucas 3:21-22').skip(5),
      ];
      return focusedQuestions;
    case 'Jesús y el Padre':
      focusedQuestions = [
        _curatedQuestion('En Juan 17:5, ¿qué gloria menciona Jesús junto al Padre?', ['La gloria que tenía con el Padre antes que el mundo fuese', 'Una gloria que recibió de los apóstoles', 'La gloria de los reinos terrenales', 'Una gloria que solo existirá después de la resurrección'], 0, 'Jesús habla de una gloria compartida con el Padre antes de la existencia del mundo, mostrando preexistencia y relación personal.', 'Juan 17:1-5'),
        _curatedQuestion('¿Qué expresa Jesús al decir «el Padre mayor es que yo» en Juan 14:28?', ['Una distinción relacional y el contexto de su misión encarnada', 'Que el Padre y el Hijo son la misma persona', 'Que el Hijo es un ángel creado', 'Que Jesús niega todo vínculo con el Padre'], 0, 'El dicho debe leerse en el contexto de la partida de Jesús y su misión; no debe aislarse de los pasajes que afirman la divinidad del Hijo.', 'Juan 14:25-31; Juan 1:1-3'),
        _curatedQuestion('En Juan 5:23, ¿qué exige Jesús respecto al honor del Hijo?', ['Que todos honren al Hijo como honran al Padre', 'Que se ignore al Hijo', 'Que el Hijo reciba menos honra que los ángeles', 'Que solo se honre a los profetas'], 0, 'El pasaje vincula la honra al Hijo con la honra al Padre que lo envió.', 'Juan 5:19-23'),
        _curatedQuestion('¿Qué muestra Juan 8:17-18 sobre el testimonio del Padre y del Hijo?', ['Jesús presenta su propio testimonio y el del Padre que lo envió', 'Jesús afirma que solo existe su propio testimonio', 'El Padre es presentado como un discípulo', 'El pasaje niega que Jesús haya sido enviado'], 0, 'Jesús apela a dos testigos: él mismo y el Padre. El argumento distingue a ambos en el contexto de la controversia.', 'Juan 8:12-20'),
        _curatedQuestion('¿Qué relación presenta Juan 10:30 cuando Jesús dice «yo y el Padre uno somos»?', ['Unidad que debe leerse junto con la distinción entre Padre e Hijo en el mismo Evangelio', 'Que Jesús nunca habla con el Padre', 'Que el Padre dejó de existir', 'Que hay dos dioses rivales'], 0, 'El contexto trata de la protección de las ovejas y la unidad del Padre y del Hijo; otros pasajes de Juan muestran su distinción personal.', 'Juan 10:27-38; Juan 17:20-23'),
        ..._generateEvaluationQuestions('Jesús y el Padre', 'Jesús habla con el Padre y recibe misión de él; no se identifica personalmente como el Padre.', 'Juan 5:19-23; Juan 17:1-5').skip(5),
      ];
      return focusedQuestions;
    default:
      break;
  }
  if (title != 'Unidad de Dios') return null;
  return [
    _curatedQuestion('¿Qué declara Deuteronomio 6:4 en su confesión central?', ['Que Israel debe adorar a muchos dioses', 'Que Jehová es uno', 'Que Moisés es divino', 'Que cada nación tiene su propio creador'], 1, 'El Shemá llama a Israel a reconocer la unicidad de Jehová. La doctrina trinitaria mantiene este monoteísmo y no propone tres dioses.', 'Deuteronomio 6:4; Marcos 12:29'),
    _curatedQuestion('¿Qué conclusión inmediata se desprende de Isaías 45:5-6?', ['Hay un solo Señor y no existe otro Dios', 'Los ídolos comparten la deidad', 'Dios fue formado por Israel', 'Los ángeles son dioses equivalentes'], 0, 'El contexto afirma la exclusividad de Jehová frente a los ídolos y las naciones.', 'Isaías 45:5-6; Isaías 44:6-8'),
    _curatedQuestion('En 1 Corintios 8:4-6, ¿qué contrasta Pablo?', ['La fe y las obras', 'Los ídolos llamados dioses y la confesión de un solo Dios y un solo Señor', 'El templo y la sinagoga', 'La ley de Moisés y los profetas'], 1, 'Pablo rechaza la realidad de los ídolos como dioses y formula la confesión cristiana alrededor del único Dios, el Padre, y un solo Señor, Jesucristo.', '1 Corintios 8:4-6'),
    _curatedQuestion('¿Por qué la Trinidad no equivale a creer en tres dioses?', ['Porque el Hijo y el Espíritu son criaturas', 'Porque Padre, Hijo y Espíritu son tres nombres de una sola persona', 'Porque confiesa una sola esencia divina y tres personas distintas', 'Porque solo el Padre es Dios'], 2, 'La distinción personal no divide la esencia divina. La doctrina afirma un solo Dios, no tres seres divinos independientes.', 'Deuteronomio 6:4; Mateo 28:19; 2 Corintios 13:14'),
    _curatedQuestion('¿Qué significa que Dios es único en la enseñanza bíblica?', ['Que no existe otro ser que sea Dios por naturaleza', 'Que Dios está compuesto por tres dioses', 'Que el Padre creó al Hijo como primer ángel', 'Que Dios se manifiesta sin relaciones personales'], 0, 'La unicidad divina excluye otros dioses verdaderos; no elimina las distinciones personales que aparecen en el testimonio bíblico.', 'Isaías 45:5-6; 1 Corintios 8:4-6'),
    _curatedQuestion('¿Cómo debe leerse Juan 1:1 junto con Deuteronomio 6:4?', ['Juan contradice el monoteísmo', 'Juan enseña que el Verbo era una criatura', 'Ambos textos deben conservarse: hay un solo Dios y el Verbo es Dios', 'Deuteronomio solo era válido antes de Jesús'], 2, 'Juan 1:1 atribuye deidad al Verbo y lo distingue relacionalmente de aquel con quien estaba. Esto debe armonizarse con el monoteísmo bíblico.', 'Deuteronomio 6:4; Juan 1:1-3'),
    _curatedQuestion('¿Qué error aparece cuando se afirma que Padre, Hijo y Espíritu son tres dioses?', ['Se confunde la distinción personal con una división de la esencia divina', 'Se reconoce la humanidad de Jesús', 'Se afirma la inspiración bíblica', 'Se distingue el Antiguo del Nuevo Testamento'], 0, 'La doctrina trinitaria distingue personas sin dividir la única esencia divina.', 'Deuteronomio 6:4; Mateo 28:19'),
    _curatedQuestion('¿Qué aporta Mateo 28:19 al estudio de la unidad divina?', ['Menciona tres nombres de tres dioses', 'Nombra al Padre, al Hijo y al Espíritu Santo bajo el singular nombre', 'Niega la divinidad de Cristo', 'Enseña que el Espíritu es un símbolo'], 1, 'El singular «nombre» y la mención coordinada de las tres personas son datos que deben estudiarse junto al monoteísmo bíblico.', 'Mateo 28:18-20'),
    _curatedQuestion('¿Qué relación existe entre 1 Corintios 8:6 y la confesión de Israel?', ['Pablo abandona la fe en un solo Dios', 'Pablo incorpora a Jesús a la confesión cristiana sin enseñar dos dioses', 'Pablo identifica a Jesús como un ídolo', 'Pablo elimina al Padre de la fe'], 1, 'Pablo mantiene el monoteísmo y menciona al Padre como un solo Dios y a Jesucristo como un solo Señor dentro de la confesión cristiana.', 'Deuteronomio 6:4; 1 Corintios 8:4-6'),
    _curatedQuestion('¿Qué debe evitarse al explicar la palabra «uno» en Deuteronomio 6:4?', ['Leer el versículo en su contexto', 'Compararlo con otros pasajes', 'Usarlo para negar textos que también llaman Dios al Hijo y presentan al Espíritu como divino', 'Reconocer su afirmación monoteísta'], 2, 'El texto afirma que Jehová es uno; no debe utilizarse para silenciar otros pasajes bíblicos, sino armonizarse con ellos.', 'Deuteronomio 6:4; Juan 1:1; Hechos 5:3-4'),
    _curatedQuestion('¿Qué enseña Isaías 44:6 sobre la identidad de Dios?', ['Jehová es el primero y el postrero; fuera de él no hay Dios', 'Existen muchos creadores', 'Los ídolos pueden salvar', 'Israel debe adorar a los astros'], 0, 'La declaración forma parte de la polémica profética contra la idolatría y afirma la exclusividad de Jehová.', 'Isaías 44:6-8'),
    _curatedQuestion('¿Cómo debe responderse a la objeción de que tres personas implican tres dioses?', ['Negando que el Padre sea distinto del Hijo', 'Explicando la diferencia entre persona y esencia sin convertirla en tres seres divinos', 'Afirmando que el Espíritu es solo una energía', 'Eliminando Mateo 28:19'], 1, 'La respuesta debe distinguir cuidadosamente las categorías: tres personas no significan tres esencias o tres dioses.', 'Mateo 28:19; 2 Corintios 13:14; Efesios 4:4-6'),
    _curatedQuestion('¿Qué muestra Marcos 12:29 cuando Jesús cita el Shemá?', ['Que Jesús rechaza el Antiguo Testamento', 'Que Jesús reafirma la confesión de que Dios es uno', 'Que hay varios dioses verdaderos', 'Que la fe depende de los ídolos'], 1, 'Jesús reafirma el mandamiento central de Israel. La enseñanza cristiana sobre la Trinidad no abandona esa confesión.', 'Marcos 12:28-30; Deuteronomio 6:4-5'),
    _curatedQuestion('¿Qué significa que el Padre, el Hijo y el Espíritu comparten la única naturaleza divina?', ['Que cada uno posee una tercera parte de Dios', 'Que son tres dioses coordinados', 'Que ninguno es una porción o criatura: cada persona es plenamente divina', 'Que solo actúan como símbolos'], 2, 'La esencia divina no se reparte en partes. La formulación trinitaria confiesa la plena deidad de cada persona sin multiplicar a Dios.', 'Juan 1:1; Hechos 5:3-4; Colosenses 2:9'),
    _curatedQuestion('¿Qué método es adecuado cuando dos pasajes parecen difíciles de armonizar?', ['Elegir uno y descartar el otro', 'Aislar una frase', 'Estudiar contexto, destinatarios, género y conjunto del testimonio bíblico', 'Decidir según la tradición sin revisar el texto'], 2, 'La interpretación responsable considera el contexto inmediato y el canon completo, sin forzar contradicciones ni ignorar evidencia.', 'Hechos 17:11; 2 Timoteo 2:15'),
    _curatedQuestion('¿Qué diferencia hay entre monoteísmo y modalismo?', ['Son exactamente la misma afirmación', 'El monoteísmo afirma un solo Dios; el modalismo sostiene que Padre, Hijo y Espíritu son modos de una sola persona', 'El monoteísmo enseña tres dioses', 'El modalismo afirma tres esencias'], 1, 'Confesar un solo Dios no resuelve por sí solo la cuestión de las personas. Los textos que muestran relaciones entre Padre, Hijo y Espíritu también deben considerarse.', 'Mateo 3:16-17; Juan 14:16-17; Deuteronomio 6:4'),
    _curatedQuestion('¿Qué aporta Efesios 4:4-6 al argumento de unidad?', ['Relaciona un Espíritu, un Señor y un Dios y Padre', 'Enseña que cada creyente tiene un dios', 'Niega la obra del Espíritu', 'Presenta tres salvadores independientes'], 0, 'Pablo reúne la unidad del cuerpo, del Espíritu, del Señor y de Dios y Padre dentro de una exhortación a guardar la unidad.', 'Efesios 4:1-6'),
    _curatedQuestion('¿Por qué no debe afirmarse que el Espíritu Santo es un segundo Dios separado?', ['Porque la Biblia nunca lo menciona', 'Porque el Espíritu es una criatura', 'Porque la Escritura enseña un solo Dios y presenta al Espíritu como divino, no como otro dios independiente', 'Porque el Espíritu es idéntico personalmente al Padre'], 2, 'Hechos 5:3-4 relaciona mentir al Espíritu Santo con mentir a Dios; esto debe leerse dentro del monoteísmo bíblico.', 'Hechos 5:3-4; Deuteronomio 6:4'),
    _curatedQuestion('¿Cuál es la conclusión más equilibrada al comparar Deuteronomio 6:4, Mateo 28:19 y 1 Corintios 8:4-6?', ['La Biblia enseña tres dioses', 'La Biblia enseña un solo Dios y distingue al Padre, al Hijo y al Espíritu en su revelación', 'El Nuevo Testamento abandona el monoteísmo', 'Las tres personas son únicamente títulos'], 1, 'La conclusión debe conservar simultáneamente la unicidad de Dios y las distinciones personales presentes en el Nuevo Testamento.', 'Deuteronomio 6:4; Mateo 28:19; 1 Corintios 8:4-6'),
    _curatedQuestion('¿Cuál afirmación representa mejor el propósito de estudiar la unidad de Dios?', ['Memorizar una frase sin examinar otros pasajes', 'Usar el monoteísmo para evitar estudiar a Cristo', 'Comprender la unicidad divina y relacionarla fielmente con toda la revelación bíblica', 'Sustituir la Biblia por definiciones humanas'], 2, 'La doctrina se construye reuniendo los datos bíblicos en su contexto. Ningún pasaje debe ser utilizado para anular otro texto inspirado.', 'Deuteronomio 6:4; Juan 1:1-18; Mateo 28:18-20'),
  ];
}

class _EvaluationBlueprint {
  final String title, description, truth, references;
  const _EvaluationBlueprint(this.title, this.description, this.truth, this.references);
}

const List<_EvaluationBlueprint> _newEvaluationBlueprints = [
  _EvaluationBlueprint("Unidad de Dios", "El monoteísmo como base de la fe trinitaria.", "Hay un solo Dios; la Trinidad no enseña tres dioses.", "Dt 6:4; Is 45:5-6; 1 Co 8:4-6"),
  _EvaluationBlueprint("El Padre", "Identidad y obras del Padre en relación con el Hijo y el Espíritu.", "El Padre es una persona divina y no otro nombre del Hijo.", "Mt 3:16-17; Jn 5:19-23; Ef 1:3-6"),
  _EvaluationBlueprint("Divinidad del Hijo", "La plena divinidad de Jesucristo.", "El Hijo es Dios y comparte la naturaleza divina, sin ser la persona del Padre.", "Jn 1:1-3; Jn 20:28; Heb 1:8"),
  _EvaluationBlueprint("Persona del Espíritu Santo", "Personalidad y divinidad del Espíritu Santo.", "El Espíritu habla, enseña, guía y puede ser entristecido; no es una fuerza impersonal.", "Jn 14:16-17,26; Hch 5:3-4; Ef 4:30"),
  _EvaluationBlueprint("Relaciones trinitarias", "Distinción personal y unidad divina.", "Padre, Hijo y Espíritu son distintos y están relacionados, compartiendo la única identidad divina.", "Mt 28:19; 2 Co 13:14; 1 P 1:2"),
  _EvaluationBlueprint("Bautismo de Jesús", "La manifestación simultánea de Padre, Hijo y Espíritu.", "El Hijo es bautizado, el Espíritu desciende y el Padre habla desde los cielos.", "Mt 3:13-17; Mr 1:9-11; Lc 3:21-22"),
  _EvaluationBlueprint("Nombre del Padre, Hijo y Espíritu", "La fórmula bautismal de Mateo.", "Jesús nombra conjuntamente a las tres personas bajo el singular «nombre».", "Mt 28:18-20"),
  _EvaluationBlueprint("Bendición apostólica", "La presencia trinitaria en la adoración de la Iglesia.", "Pablo distingue la gracia de Cristo, el amor de Dios y la comunión del Espíritu.", "2 Co 13:14"),
  _EvaluationBlueprint("El Verbo eterno", "El prólogo del Evangelio de Juan.", "El Verbo estaba con Dios y era Dios; el texto distingue al Verbo de aquel con quien estaba.", "Jn 1:1-18"),
  _EvaluationBlueprint("Jesús y el Padre", "La relación filial en el Evangelio de Juan.", "Jesús habla con el Padre y recibe misión de él; no se identifica personalmente como el Padre.", "Jn 5:19-23; 17:1-5"),
  _EvaluationBlueprint("Encarnación del Hijo", "El Verbo asume verdadera humanidad.", "El Verbo se hizo carne sin dejar de ser quien eternamente es.", "Jn 1:14; Fil 2:5-8; Heb 2:14-17"),
  _EvaluationBlueprint("Humanidad de Cristo", "La realidad de la naturaleza humana de Jesús.", "Jesús experimentó verdadera humanidad sin pecado y puede representarnos como sumo sacerdote.", "Lc 2:52; Heb 4:15"),
  _EvaluationBlueprint("Expiación", "La muerte de Jesús por los pecados.", "Cristo murió por nuestros pecados conforme a las Escrituras y su sacrificio es suficiente.", "Is 53:4-6; Ro 3:24-26; 1 P 2:24"),
  _EvaluationBlueprint("Resurrección de Cristo", "La resurrección corporal e histórica de Jesús.", "Dios resucitó a Jesús; la resurrección confirma su victoria y fundamenta la esperanza.", "Lc 24:36-43; 1 Co 15:3-20"),
  _EvaluationBlueprint("Ascensión de Cristo", "La exaltación del Hijo a la diestra del Padre.", "El Cristo resucitado ascendió y fue exaltado sin borrar la distinción con el Padre.", "Hch 1:9-11; 2:32-36; Ef 1:20-23"),
  _EvaluationBlueprint("Intercesión de Cristo", "El ministerio presente de Jesús por los creyentes.", "Jesús vive para interceder por quienes se acercan a Dios por medio de él.", "Ro 8:34; Heb 7:24-25; 1 Jn 2:1"),
  _EvaluationBlueprint("Regeneración", "La obra del Espíritu en el nuevo nacimiento.", "El nuevo nacimiento es obra del Espíritu y no resultado del mérito humano.", "Jn 3:3-8; Tit 3:5-6"),
  _EvaluationBlueprint("Santificación por el Espíritu", "La obra continua del Espíritu en la vida santa.", "El Espíritu produce fruto y capacita al creyente para andar conforme a la voluntad de Dios.", "Gá 5:16-25; 1 P 1:2"),
  _EvaluationBlueprint("Dones espirituales", "La diversidad de dones para edificar la Iglesia.", "El Espíritu distribuye dones como quiere para el bien común y la edificación.", "1 Co 12:4-11; Ro 12:4-8; 1 P 4:10-11"),
  _EvaluationBlueprint("Fruto del Espíritu", "El carácter que el Espíritu produce.", "El fruto del Espíritu se manifiesta en virtudes que contrastan con las obras de la carne.", "Gá 5:19-23"),
  _EvaluationBlueprint("Oración cristiana", "La oración al Padre por medio del Hijo en el Espíritu.", "La oración cristiana se acerca al Padre por medio de Cristo y con ayuda del Espíritu.", "Mt 6:9; Jn 16:23-24; Ef 2:18; Ro 8:26"),
  _EvaluationBlueprint("Adoración bíblica", "La adoración al único Dios revelado en la Trinidad.", "La adoración pertenece a Dios; el Hijo recibe honra y el Espíritu conduce a la verdad.", "Jn 4:23-24; 5:23; Fil 3:3"),
  _EvaluationBlueprint("Autoridad bíblica", "Inspiración y suficiencia de las Escrituras.", "Toda la Escritura es inspirada por Dios y equipa al creyente para toda buena obra.", "2 Ti 3:16-17; 2 P 1:20-21"),
  _EvaluationBlueprint("Hermenéutica", "Principios para interpretar los textos bíblicos.", "Cada texto debe leerse en su contexto literario, histórico y canónico.", "Neh 8:8; Lc 24:27; 2 P 3:16"),
  _EvaluationBlueprint("Géneros bíblicos", "Narrativa, poesía, profecía, evangelios y epístolas.", "El género literario ayuda a reconocer el propósito y el lenguaje del pasaje.", "Sal 1; Is 5:1-7; Lc 1:1-4"),
  _EvaluationBlueprint("Pactos bíblicos", "La unidad del plan redentor a través de los pactos.", "Los pactos desarrollan el propósito de Dios y encuentran cumplimiento en Cristo.", "Gn 12:1-3; Jer 31:31-34; Heb 8:6-13"),
  _EvaluationBlueprint("Promesa a Abraham", "La promesa divina y su cumplimiento en Cristo.", "La bendición prometida a Abraham alcanza a las naciones por Cristo y se recibe por la fe.", "Gn 12:1-3; Gá 3:6-18"),
  _EvaluationBlueprint("Ley y evangelio", "La función de la ley y la salvación por gracia.", "La ley revela el pecado, pero la justificación es por gracia mediante la fe.", "Ro 3:19-28; Gá 3:19-26; Ef 2:8-10"),
  _EvaluationBlueprint("Justificación", "La declaración de justicia por gracia mediante la fe.", "Dios justifica al pecador por la fe, no por obras como mérito salvador.", "Ro 4:1-8; 5:1; Gá 2:16"),
  _EvaluationBlueprint("Adopción", "La identidad de los creyentes como hijos de Dios.", "En Cristo recibimos adopción y el Espíritu da testimonio de esa relación filial.", "Ro 8:14-17; Gá 4:4-7; Ef 1:4-5"),
  _EvaluationBlueprint("Iglesia cuerpo de Cristo", "Unidad y diversidad del pueblo redimido.", "La Iglesia es un cuerpo con muchos miembros, unidos en Cristo y capacitados por el Espíritu.", "1 Co 12:12-27; Ef 1:22-23; 4:1-16"),
  _EvaluationBlueprint("Misión de la Iglesia", "El llamado a hacer discípulos y dar testimonio.", "La Iglesia anuncia el evangelio y hace discípulos en obediencia al mandato de Jesús.", "Mt 28:18-20; Hch 1:8; 2 Co 5:18-20"),
  _EvaluationBlueprint("Bautismo cristiano", "El significado del bautismo como identificación con Cristo.", "El bautismo expresa unión con Cristo en su muerte y resurrección y la respuesta de fe.", "Mt 28:19; Ro 6:3-4; Col 2:12"),
  _EvaluationBlueprint("Cena del Señor", "Memoria, proclamación y comunión en la mesa del Señor.", "La Cena anuncia la muerte del Señor y llama a participar con discernimiento y reverencia.", "Lc 22:14-20; 1 Co 10:16-17; 11:23-29"),
  _EvaluationBlueprint("Santidad cristiana", "La vida apartada para Dios como fruto de la gracia.", "La santidad responde al carácter santo de Dios y se vive en obediencia por gracia.", "Lv 19:2; 1 P 1:14-16; Heb 12:14"),
  _EvaluationBlueprint("Perseverancia", "La fidelidad continua de quienes confían en Cristo.", "El creyente es llamado a permanecer en Cristo y correr con perseverancia.", "Jn 15:4-10; Heb 10:23-25; 12:1-2"),
  _EvaluationBlueprint("Tentación y pecado", "La responsabilidad humana ante la tentación.", "Dios no tienta al mal y provee ayuda para resistir; el pecado debe reconocerse y abandonarse.", "Stg 1:13-15; 1 Co 10:13; 1 Jn 1:9"),
  _EvaluationBlueprint("Perdón y reconciliación", "El perdón recibido de Dios y practicado con el prójimo.", "Quienes reciben el perdón de Dios son llamados a perdonar como el Señor perdonó.", "Mt 6:12-15; Ef 4:32; Col 3:13"),
];

final List<QuizPack> quizPacks = <QuizPack>[
  ..._baseQuizPacks.map(_expandEvaluation),
  ..._newEvaluationBlueprints.map((item) => QuizPack(
    title: item.title,
    description: item.description,
    questions: (() {
      final complete = _curatedQuestionsFor(item.title);
      if (complete != null) return complete;
      final specific = _doctrinalQuestionsFor(item.title) ?? <QuizQuestion>[];
      final generated = _generateEvaluationQuestions(item.title, item.truth, item.references);
      return <QuizQuestion>[...specific, ...generated.take(20 - specific.length)];
    })(),
    difficulty: 'Intermedio',
    source: 'Estudios bíblicos y defensa doctrinal',
  )),
];
