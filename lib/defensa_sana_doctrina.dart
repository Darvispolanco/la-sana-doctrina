import 'package:flutter/material.dart';
import 'data/defensa_estudios_estructura.dart';

/// Catálogo de 100 temas y marco común de investigación apologética.
class DefensaSanaDoctrinaPage extends StatefulWidget {
  const DefensaSanaDoctrinaPage({super.key});
  @override
  State<DefensaSanaDoctrinaPage> createState() => _DefensaSanaDoctrinaPageState();
}

class _DefensaSanaDoctrinaPageState extends State<DefensaSanaDoctrinaPage> {
  final _search = TextEditingController();
  String _query = '';

  static const partes = <_Parte>[
    _Parte('I. Fundamentos bíblicos para discernir el error', [
      'Autoridad y suficiencia de las Escrituras','Cómo reconocer a falsos maestros',
      'Falsos profetas en el Antiguo Testamento','Advertencias de Jesús sobre falsos cristos',
      'Advertencias apostólicas sobre el error doctrinal','Simón el mago: apariencia religiosa y motivaciones',
      'Himeneo y Fileto: el error sobre la resurrección','Nicolaítas, Balaam y Jezabel en Apocalipsis',
      'Discernimiento espiritual y examen de las enseñanzas','Cómo estudiar correctamente un texto bíblico']),
    _Parte('II. Herejías y controversias de la Iglesia primitiva', [
      'Docetismo','Ebionismo','Gnosticismo: corrientes y características','Marcionismo',
      'Montanismo','Encratismo','Maniqueísmo','Novacianismo','Donatismo',
      'Movimientos y controversias de los primeros siglos']),
    _Parte('III. Controversias sobre la Trinidad', [
      'Monarquianismo','Modalismo','Sabelianismo','Arrianismo','Subordinacionismo',
      'Macedonianismo','Nicea y la controversia arriana',
      'Constantinopla y la formulación trinitaria','Defensores históricos de la Trinidad',
      'La doctrina trinitaria a la luz de toda la Biblia']),
    _Parte('IV. Controversias sobre Jesucristo', [
      'Apolinarismo','Nestorianismo: contexto y precisión histórica','Eutiquianismo',
      'Monofisismo y miafisismo: distinciones necesarias','Preexistencia eterna de Cristo',
      'La encarnación del Verbo','Humanidad y divinidad de Cristo',
      'Muerte, resurrección y exaltación de Jesucristo']),
    _Parte('V. Controversias medievales', [
      'Paulicianismo','Bogomilismo','Catarismo','Los valdenses: historia y controversias',
      'Los lolardos','Los husitas','Influencia de las controversias medievales']),
    _Parte('VI. Movimientos de los siglos XVI–XVIII', [
      'Socinianismo','Miguel Servet y las controversias antitrinitarias','Unitarismo histórico',
      'Universalismo cristiano','Reforma protestante y controversias doctrinales',
      'Autoridad bíblica frente a revelaciones adicionales']),
    _Parte('VII. Movimientos del siglo XIX', [
      'Santos de los Últimos Días: origen e historia','El Libro de Mormón y la autoridad bíblica',
      'Testigos de Jehová: origen y desarrollo','La identidad de Jesús según los Testigos de Jehová',
      'El Espíritu Santo según los Testigos de Jehová','Ciencia Cristiana','Cristadelfianos',
      'Adventismo: historia y evaluación doctrinal','Unitarismo moderno']),
    _Parte('VIII. Movimientos del siglo XX', [
      'Pentecostalismo unicitario: origen y desarrollo','Unicidad y Trinidad: comparación doctrinal',
      'El bautismo en el nombre de Jesús','Iglesia ni Cristo: historia y doctrina',
      'Evangelio de prosperidad','Movimiento de fe','Movimientos apostólicos y proféticos',
      'Autoridad de apóstoles y profetas modernos','Revelaciones modernas y autoridad de la Biblia',
      'Sincretismo religioso']),
    _Parte('IX. Enseñanzas y movimientos contemporáneos', [
      'Neognosticismo','Antitrinitarismo contemporáneo','Modalismo moderno',
      'Universalismo contemporáneo','Enseñanzas de prosperidad en la actualidad','Legalismo religioso',
      'Manipulación espiritual y falsos liderazgos','Salvación por méritos humanos',
      'Interpretaciones incorrectas de la gracia','Nuevas revelaciones frente a la suficiencia bíblica']),
    _Parte('X. Defensa bíblica de la Trinidad', [
      'Un solo Dios: unidad de la naturaleza divina','La identidad divina del Padre',
      'La divinidad eterna del Hijo','La personalidad del Espíritu Santo','La divinidad del Espíritu Santo',
      'Padre, Hijo y Espíritu en el bautismo de Jesús','Mateo 28:19 en su contexto',
      '2 Corintios 13:14 en su contexto','La distinción personal entre el Padre y el Hijo',
      'Unidad divina y tres personas','La Trinidad en el Antiguo Testamento',
      'La Trinidad en el Nuevo Testamento']),
    _Parte('XI. Defensa de doctrinas fundamentales', [
      'Naturaleza y atributos de Dios','Preexistencia y eternidad de Cristo',
      'Encarnación y dos naturalezas de Cristo','La obra redentora de Jesucristo',
      'Personalidad y obra del Espíritu Santo','Salvación por gracia mediante la fe',
      'Arrepentimiento y conversión','Resurrección y segunda venida de Cristo']),
  ];

  int _numeroTema(String tituloParte, int indiceTema) {
    final indiceParte = partes.indexWhere((p) => p.titulo == tituloParte);
    var numero = indiceTema + 1;
    for (var i = 0; i < indiceParte; i++) {
      numero += partes[i].temas.length;
    }
    return numero;
  }

  int _numeroTemaPorTitulo(String titulo) {
    var numero = 0;
    for (final parte in partes) {
      for (final tema in parte.temas) {
        numero++;
        if (tema == titulo) return numero;
      }
    }
    return 0;
  }

  @override
  void dispose() { _search.dispose(); super.dispose(); }

  @override
  Widget build(BuildContext context) {
    final filtradas = partes.map((p) => _Parte(p.titulo, p.temas
      .where((t) => t.toLowerCase().contains(_query.toLowerCase())).toList()))
      .where((p) => p.temas.isNotEmpty).toList();
    return Scaffold(
      appBar: AppBar(title: const Text('Defensa de la Sana Doctrina')),
      body: ListView(padding: const EdgeInsets.all(16), children: [
        Container(padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(color: const Color(0xFF14243A),
            borderRadius: BorderRadius.circular(18)),
          child: const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Icon(Icons.shield_outlined, color: Color(0xFFD5B46A), size: 34),
            SizedBox(height: 12),
            Text('DEFENSA DE LA SANA DOCTRINA',
              style: TextStyle(color: Color(0xFFD5B46A), fontWeight: FontWeight.bold, letterSpacing: 1)),
            SizedBox(height: 8),
            Text('Historia, investigación y refutación bíblica de los errores doctrinales.',
              style: TextStyle(color: Colors.white, fontSize: 19, fontWeight: FontWeight.w600)),
            SizedBox(height: 10),
            Text('Ruta de 100 temas en 11 partes. Cada movimiento se documentará con fuentes históricas verificables y cada pasaje se estudiará en su contexto.',
              style: TextStyle(color: Colors.white70, height: 1.45)),
          ]),
        ),
        const SizedBox(height: 16),
        TextField(controller: _search,
          onChanged: (v) => setState(() => _query = v.trim()),
          decoration: InputDecoration(hintText: 'Buscar tema o movimiento',
            prefixIcon: const Icon(Icons.search),
            suffixIcon: _query.isEmpty ? null : IconButton(
              onPressed: () { _search.clear(); setState(() => _query = ''); },
              icon: const Icon(Icons.close)),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(14)))),
        const SizedBox(height: 10),
        for (final p in filtradas)
          Card(child: ExpansionTile(
            leading: CircleAvatar(backgroundColor: const Color(0xFF14243A),
              foregroundColor: const Color(0xFFD5B46A),
              child: Text((partes.indexWhere((original) => original.titulo == p.titulo) + 1).toString())),
            title: Text(p.titulo, style: const TextStyle(fontWeight: FontWeight.w700)),
            subtitle: Text(p.temas.length.toString() + ' temas'),
            children: [for (var i = 0; i < p.temas.length; i++)
              ListTile(dense: true, leading: const Icon(Icons.menu_book_outlined, size: 20),
                title: Text(p.temas[i]), trailing: const Icon(Icons.chevron_right),
                onTap: () => Navigator.push(context, MaterialPageRoute(
                  builder: (_) => DefensaTemaPage(
                  numero: _numeroTemaPorTitulo(p.temas[i]),
                  titulo: p.temas[i],
                  parte: p.titulo))))],
          )),
        const SizedBox(height: 18),
        const Text('CRITERIO DE INVESTIGACIÓN',
          style: TextStyle(color: Color(0xFF14243A), fontWeight: FontWeight.bold)),
        const SizedBox(height: 6),
        const Text('Se distinguirán hechos históricos documentados, declaraciones oficiales e interpretación bíblica. No se atribuirán doctrinas sin fuentes ni se etiquetarán diferencias secundarias como herejías.',
          style: TextStyle(height: 1.5)),
      ]),
    );
  }
}

class _Parte {
  final String titulo;
  final List<String> temas;
  const _Parte(this.titulo, this.temas);
}

class DefensaTemaPage extends StatelessWidget {
  final int numero;
  final String titulo;
  final String parte;
  const DefensaTemaPage({super.key, required this.numero, required this.titulo, required this.parte});

  @override
  Widget build(BuildContext context) {
    final apartados = defensaEstructuras[numero] ?? const <String>[];
    return Scaffold(
      appBar: AppBar(title: const Text('Investigación doctrinal')),
      body: ListView(padding: const EdgeInsets.all(18), children: [
        Container(padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(color: const Color(0xFF14243A), borderRadius: BorderRadius.circular(16)),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('ESTUDIO $numero · RUTA DE INVESTIGACIÓN',
              style: const TextStyle(color: Color(0xFFD5B46A), fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text(titulo, style: const TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text(parte, style: const TextStyle(color: Colors.white70)),
          ])),
        const SizedBox(height: 16),
        const Text('ESTRUCTURA PARTICULAR DEL ESTUDIO',
          style: TextStyle(color: Color(0xFF14243A), fontWeight: FontWeight.bold)),
        const SizedBox(height: 6),
        const Text('Este esquema se adapta al tema específico. Los apartados indican el orden de investigación; el contenido se desarrollará y documentará progresivamente.',
          style: TextStyle(height: 1.5)),
        const SizedBox(height: 18),
        for (var i = 0; i < apartados.length; i++) ...[
          Text('${i + 1}. ${apartados[i]}',
            style: const TextStyle(color: Color(0xFF14243A), fontSize: 17, fontWeight: FontWeight.bold)),
          const SizedBox(height: 14),
        ],
        const Divider(),
        const Text('REGLA EXEGÉTICA OBLIGATORIA',
          style: TextStyle(color: Color(0xFF14243A), fontWeight: FontWeight.bold)),
        const SizedBox(height: 6),
        const Text('Cada pasaje bíblico se estudiará en su contexto inmediato, literario, histórico, gramatical y canónico; se comparará con otros textos del Antiguo y Nuevo Testamento. Se expondrán las interpretaciones alternativas, se examinarán las aparentes contradicciones y se concluirá qué enseña el pasaje y qué no permite afirmar. La Escritura interpretará la Escritura.',
          style: TextStyle(height: 1.5)),
        const SizedBox(height: 14),
        const Text('PREGUNTAS Y RESPUESTAS',
          style: TextStyle(color: Color(0xFF14243A), fontWeight: FontWeight.bold)),
        const SizedBox(height: 6),
        const Text('Al desarrollar el estudio se incorporarán preguntas trinitarias con respuestas bíblicas, objeciones reales del tema y preguntas difíciles para comprobar la coherencia de los argumentos.',
          style: TextStyle(height: 1.5)),
      ]),
    );
  }
}
