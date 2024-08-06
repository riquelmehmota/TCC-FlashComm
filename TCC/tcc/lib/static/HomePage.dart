import 'package:flutter/material.dart';
import 'package:tcc/pages/Configura%C3%A7%C3%B5esPage.dart';
import 'package:tcc/pages/ExplorePage.dart';
import 'package:tcc/pages/InicioPage.dart';
import 'package:tcc/pages/TurmaPage.dart';
import 'package:tcc/User.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class HomePage extends StatefulWidget {
  
  final int id;
  
  const HomePage({super.key, required this.id});

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
                    labelText: 'Descrição (opcional)',
                  ),
                ),
                TextField(
                  decoration: const InputDecoration(
                    labelText: 'Matéria',
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
  User user = User('', '', '');
  Future<void> _getUser() async {
  try {
    final response = await http.get(
      Uri.parse('http://192.168.4.109:3000/users/${widget.id}'),
    );
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        user = User(data['id'].toString(), data['username'], data['email']);
      });
    } else {
      print('Failed to load user data');
    }
  } catch (e) {
    print('Error: $e');
  }
}
  @override
  Widget build(BuildContext context) {
    _getUser();
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
            title: _selectedIndex == 0 ? const Text('Início', style: TextStyle(color: Colors.white)) : _selectedIndex == 1 ? const Text('Minha Turma', style: TextStyle(color: Colors.white)) : _selectedIndex == 2 ? const Text('Explore', style: TextStyle(color: Colors.white)) : const Text('Configurações',
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
                  accountName: Text(user.username, style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold)),
                  accountEmail: Text(user.email, style: TextStyle(color: Colors.black, fontSize: 12, fontWeight: FontWeight.bold)),
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
