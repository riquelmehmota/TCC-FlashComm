import 'package:flutter/material.dart';
import 'package:tcc/pages/Configura%C3%A7%C3%B5esPage.dart';
import 'package:tcc/pages/ExplorePage.dart';
import 'package:tcc/pages/InicioPage.dart';
import 'package:tcc/pages/TurmaPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
final List<Widget> _pages = [
    InicioPage(),
    TurmaPage(),
    ExplorePage(),
    ConfiguracoesPage()
  ];
  @override

  // A list of pages that correspond to each drawer item
  
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Montserrat',
        textTheme: TextTheme(
          headlineLarge:
              TextStyle(fontFamily: 'Montserrat', fontWeight: FontWeight.bold),
          headlineMedium:
              TextStyle(fontFamily: 'Montserrat', fontWeight: FontWeight.bold),
          headlineSmall:
              TextStyle(fontFamily: 'Montserrat', fontWeight: FontWeight.bold),
          titleLarge:
              TextStyle(fontFamily: 'Montserrat', fontWeight: FontWeight.bold),
          titleMedium:
              TextStyle(fontFamily: 'Montserrat', fontWeight: FontWeight.bold),
          titleSmall:
              TextStyle(fontFamily: 'Montserrat', fontWeight: FontWeight.bold),
          bodyLarge:
              TextStyle(fontFamily: 'Montserrat', fontWeight: FontWeight.bold),
          bodyMedium:
              TextStyle(fontFamily: 'Montserrat', fontWeight: FontWeight.bold),
          bodySmall:
              TextStyle(fontFamily: 'Montserrat', fontWeight: FontWeight.bold),
          labelLarge:
              TextStyle(fontFamily: 'Montserrat', fontWeight: FontWeight.bold),
          labelSmall:
              TextStyle(fontFamily: 'Montserrat', fontWeight: FontWeight.bold),
        ),
      ),
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            color: Colors.blue[900],
          ),
          child: Column(children: [
            AppBar(
              iconTheme: const IconThemeData(color: Colors.white),
              title: const Text('FlashComm',
                  style: TextStyle(color: Colors.white)),
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            Expanded(
              child: _pages[_selectedIndex],
            ),
          ]),
        ),
        drawer: Builder(
          builder: (context) => Drawer(
            child: MediaQuery.removePadding(
              context: context,
              removeTop: true,
              child: ListView(
                children: <Widget>[
                  UserAccountsDrawerHeader(
                    currentAccountPicture: CircleAvatar(
                      backgroundImage:
                          NetworkImage('https://thispersondoesnotexist.com/'),
                    ),
                    accountName: Text("Riquelme"),
                    accountEmail: Text("accountEmail"),
                  ),
                  ListTile(
                    leading: Icon(Icons.home),
                    title: Text('Início'),
                    onTap: () => _onItemTapped(0),
                  ),
                  ListTile(
                    leading: Icon(Icons.money),
                    title: Text('Minha Turma'),
                    onTap: () => _onItemTapped(1),
                  ),
                  ListTile(
                    leading: Icon(Icons.contact_emergency),
                    title: Text('Explore'),
                    onTap: () => _onItemTapped(2),
                  ),
                  ListTile(
                    leading: Icon(Icons.settings),
                    title: Text('Configurações'),
                    onTap: () => _onItemTapped(3),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
