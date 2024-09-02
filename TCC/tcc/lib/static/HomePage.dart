import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tcc/pages/Configura%C3%A7%C3%B5esPage.dart';
import 'package:tcc/pages/ExplorePage.dart';
import 'package:tcc/pages/InicioPage.dart';
import 'package:tcc/pages/TurmaPage.dart';
import 'package:provider/provider.dart';
import 'package:tcc/provider/UserProvider.dart';
import 'package:tcc/User.dart';

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

  void _UserInfo(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Color.fromARGB(255, 48, 48, 48),
          title: const Text('Seu Perfil', style: TextStyle(color: Colors.white)),
          content: Container(
            height: MediaQuery.of(context).size.height * 0.3,
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    backgroundImage:
                        NetworkImage('http://thispersondoesnotexist.com'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Nome: usuario", style: TextStyle(color: Colors.white)),
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Username: usuario123", style: TextStyle(color: Colors.white))),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Email: usuario@gmail.com", style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Fechar', style: TextStyle(color: Colors.white)),
            ),
          ],
        );
      },
    );
  }

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

    User? user;

    @override
    void initState() {
      super.initState();

      // Carrega as informações do usuário ao iniciar a página
      user = Provider.of<AuthProvider>(context, listen: false).currentUser;
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
            color: Color.fromARGB(255, 20, 21, 24),
          ),
          child: Column(children: [
            AppBar(
              leading: Builder(
                builder: (context) => IconButton(
                  icon: const Icon(Icons.menu, color: Colors.white),
                  onPressed: () => Scaffold.of(context).openDrawer(),
                ),
              ),
              iconTheme: const IconThemeData(color: Colors.black),
              title: _selectedIndex == 0
                  ? const Text('Início', style: TextStyle(color: Colors.white))
                  : _selectedIndex == 1
                      ? const Text('Minha Turma',
                          style: TextStyle(color: Colors.white))
                      : _selectedIndex == 2
                          ? const Text('Explore',
                              style: TextStyle(color: Colors.white))
                          : const Text('Configurações',
                              style: TextStyle(color: Colors.white)),
              backgroundColor: const Color.fromARGB(47, 0, 0, 0),
              shadowColor: Colors.black,
              elevation: 0,
            ),
            Expanded(
              child: _pages[_selectedIndex],
            ),
          ]),
        ),
        drawer: Builder(
          builder: (context) => Drawer(
            backgroundColor: Color.fromARGB(255, 48, 48, 48),
            child: MediaQuery.removePadding(
              context: context,
              child: ListView(
                children: <Widget>[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(16, 16, 0, 0),
                      child: Text(
                        "FlashComm",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.w900),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Divider(
                    color: Colors.grey[600], // Color of the line
                    thickness: 2, // Thickness of the line
                  ),
                  UserAccountsDrawerHeader(
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                    ),
                    currentAccountPicture: GestureDetector(
                      onTap: () {
                        _UserInfo(context);
                      },
                      child: CircleAvatar(
                        backgroundImage:
                            Image.asset('assets/images/user/${user?.image}').image,
                      ),
                    ),
                    accountName: Text('${user?.username}',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold)),
                    accountEmail: Text('${user?.email}',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold)),
                  ),
                  ListTile(
                      leading: Icon(Icons.home, color: Colors.grey),
                      title: Text('Início', style: TextStyle(color: Colors.grey)),
                      onTap: () {
                        Navigator.pop(context);
                        _onItemTapped(0);
                      }),
                  ListTile(
                      leading: Icon(CupertinoIcons.group_solid, color: Colors.grey),
                      title: Text('Minha Turma', style: TextStyle(color: Colors.grey)),
                      onTap: () {
                        Navigator.pop(context);
                        _onItemTapped(1);
                      }),
                  ListTile(
                      leading: Icon(CupertinoIcons.compass_fill, color: Colors.grey),
                      title: Text('Explore', style: TextStyle(color: Colors.grey)),
                      onTap: () {
                        Navigator.pop(context);
                        _onItemTapped(2);
                      }),
                  ListTile(
                      leading: Icon(Icons.settings, color: Colors.grey),
                      title: Text('Configurações', style: TextStyle(color: Colors.grey)),
                      onTap: () {
                        Navigator.pop(context);
                        _onItemTapped(3);
                      }),
                ],
              ),
            ),
          ),
        ));
  }
}
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:visual/User.dart';
// import 'package:visual/provider/UserProvider.dart';

// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   User? user;

//   @override
//   void initState() {
//     super.initState();

//     // Carrega as informações do usuário ao iniciar a página
//     user = Provider.of<AuthProvider>(context, listen: false).currentUser;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Bem-vindo, ${user?.username ?? 'Usuário'}'),
//       ),
//       body: Center(
//         child: Text('Email: ${user?.email ?? ''}'),
//       ),
//     );
//   }
// }
