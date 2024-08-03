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

  void _FormsAdd(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Adicionar Turma'),
          content: Container(
            width: double.maxFinite,
            child: Column(
              children: <Widget>[
                TextField(
                  decoration: const InputDecoration(
                    labelText: 'Nome da Turma',
                  ),
                ),
                TextField(
                  decoration: const InputDecoration(
                    labelText: 'Código da Turma',
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Adicionar'),
            ),
          ],
        );
      },
    );
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Wrap(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.add),
              title: Text('Adicionar Turma'),
              onTap: () {
                
                Navigator.pop(context);
                _FormsAdd(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.group_add),
              title: Text('Entrar em uma Turma'),
              onTap: () {
                Navigator.pop(context);
                // Ação para entrar em uma turma
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: _selectedIndex == 1
          ? FloatingActionButton(
              onPressed: () {
                _showBottomSheet(context);
              },
              child: const Icon(Icons.add),
            )
          : null,
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
                    onTap: () {
                      Navigator.pop(context);
                      _onItemTapped(0);
                    }),
                ListTile(
                    leading: Icon(Icons.money),
                    title: Text('Minha Turma'),
                    onTap: () {
                      Navigator.pop(context);
                      _onItemTapped(1);
                    }),
                ListTile(
                    leading: Icon(Icons.contact_emergency),
                    title: Text('Explore'),
                    onTap: () {
                      Navigator.pop(context);
                      _onItemTapped(2);
                    }),
                ListTile(
                    leading: Icon(Icons.settings),
                    title: Text('Configurações'),
                    onTap: () {
                      Navigator.pop(context);
                      _onItemTapped(3);
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
