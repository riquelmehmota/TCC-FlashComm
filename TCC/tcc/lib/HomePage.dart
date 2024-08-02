import 'package:flutter/material.dart';
import 'package:tcc/StreakModel.dart';
import 'Deck_Dados.dart';
import 'RowDeckModel.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Montserrat',
        textTheme: TextTheme(
          headlineLarge: TextStyle(fontFamily: 'Montserrat', fontWeight: FontWeight.bold),
          headlineMedium: TextStyle(fontFamily: 'Montserrat', fontWeight: FontWeight.bold),
          headlineSmall: TextStyle(fontFamily: 'Montserrat', fontWeight: FontWeight.bold),
          titleLarge: TextStyle(fontFamily: 'Montserrat', fontWeight: FontWeight.bold),
          titleMedium: TextStyle(fontFamily: 'Montserrat', fontWeight: FontWeight.bold),
          titleSmall: TextStyle(fontFamily: 'Montserrat', fontWeight: FontWeight.bold),
          bodyLarge: TextStyle(fontFamily: 'Montserrat', fontWeight: FontWeight.bold),
          bodyMedium: TextStyle(fontFamily: 'Montserrat', fontWeight: FontWeight.bold),
          bodySmall: TextStyle(fontFamily: 'Montserrat', fontWeight: FontWeight.bold),
          labelLarge: TextStyle(fontFamily: 'Montserrat', fontWeight: FontWeight.bold),
          labelSmall: TextStyle(fontFamily: 'Montserrat', fontWeight: FontWeight.bold),
        ),
      ),
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.black, Colors.purple],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Column(
            children: [
              AppBar(
                iconTheme: const IconThemeData(color: Colors.white),
                title: const Text('FlashComm', style: TextStyle(color: Colors.white)),
                backgroundColor: Colors.transparent,
                elevation: 0,
              ),
              Expanded(
                child: ListView(
                  children: [
                    Container(
                      height: 200,
                      child: Row(
                        children: [
                          Expanded(
                            child: ListView.builder(
                              itemCount: decks.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                final deck = decks[index];
                                return RowDeckModel(
                                  nome: deck['nome_do_deck'],
                                  quantidade: deck['quantidade_de_cartas'],
                                  index: index,
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    StreakModel(),
                  ],
                ),
              ),
            ],
          ),
        ),
        drawer: Builder(
          builder: (context) => Drawer(
            child: ListView(
              children: <Widget>[
                UserAccountsDrawerHeader(
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: NetworkImage('https://thispersondoesnotexist.com/'),
                  ),
                  accountName: Text("Riquelme"),
                  accountEmail: Text("accountEmail"),
                ),
                ListTile(
                  leading: Icon(Icons.home),
                  title: Text('Início'),
                  onTap: () {},
                ),
                ListTile(
                  leading: Icon(Icons.money),
                  title: Text('Minha Turma'),
                  onTap: () {},
                ),
                ListTile(
                  leading: Icon(Icons.contact_emergency),
                  title: Text('Explore'),
                  onTap: () {},
                ),
                ListTile(
                  leading: Icon(Icons.settings),
                  title: Text('Configurações'),
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
