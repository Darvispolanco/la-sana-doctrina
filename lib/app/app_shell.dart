part of '../main.dart';

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
SizedBox.shrink(),
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
title: Text(
titles[selectedIndex],
style: const TextStyle(fontWeight: FontWeight.w700),
),
),
body: SafeArea(
child: selectedIndex == 0
? InicioTab(onNavigate: (index) {
setState(() => selectedIndex = index);
})
: pages[selectedIndex],
),
bottomNavigationBar: NavigationBar(
selectedIndex: selectedIndex,
onDestinationSelected: (value) =>
setState(() => selectedIndex = value),
destinations: const [
NavigationDestination(
icon: Icon(Icons.home_outlined),
selectedIcon: Icon(Icons.home),
label: 'Inicio',
),
NavigationDestination(
icon: Icon(Icons.menu_book_outlined),
selectedIcon: Icon(Icons.menu_book),
label: 'Estudios',
),
NavigationDestination(
icon: Icon(Icons.auto_stories_outlined),
selectedIcon: Icon(Icons.auto_stories),
label: 'Diccionario',
),
NavigationDestination(
icon: Icon(Icons.quiz_outlined),
selectedIcon: Icon(Icons.quiz),
label: 'Pruebas',
),
NavigationDestination(
icon: Icon(Icons.bookmark_border),
selectedIcon: Icon(Icons.bookmark),
label: 'Guardados',
),
],
),
);
}
}
