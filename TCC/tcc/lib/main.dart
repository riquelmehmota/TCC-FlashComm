
import 'package:flutter/material.dart';
import 'package:tcc/Providers/user_provider.dart';
import 'package:tcc/pages/login_screen.dart';
import 'package:tcc/pages/sign_in_screen.dart';
import 'package:tcc/static/HomePage.dart';
import 'package:provider/provider.dart';
void main() {
  runApp(MyApp());
}



class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context) => UserProvider(),
      child: MaterialApp(
        routes: {
          '/login': (context) => LoginScreen(),
          "/home": (context) => HomePage(),
          "/signup": (context) => SignUpScreen(),
        },

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
        home: Turma(),
      ));
  }
}

class Turma extends StatelessWidget {
  const Turma({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //bottom navigation
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "home"),
        BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Cartas'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Pessoas') 
      ],),
    );
  }
}
/*
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int opcaoSelecionada = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: IndexedStack(
          index: opcaoSelecionada,
          children: const <Widget>[
            HomePage(),
            Search(),
            Profile(),
          ],
        ), 


        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: opcaoSelecionada,
          onTap: (int index) {
            setState(() {
              opcaoSelecionada = index;
            });
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Cartas'),
            BottomNavigationBarItem(icon: Icon(Icons.people), label: 'Alunos'),
        ],)
      ),
    );
  }
}
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text("Turma"),
      ),
      body: Column(
        
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            
            child: Container(
              height: 160,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey[900],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("Nome da Turma", style: TextStyle(fontSize: 20, color: Colors.white),),
                    Text("Professor: Nome do Professor", style: TextStyle(fontSize: 15, color: Colors.white),),
                    Text("Quantidade de Alunos: 10", style: TextStyle(fontSize: 15, color: Colors.white),),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 3,
              itemBuilder: (context, index) => 
              
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.circle, size: 50, color: Colors.amber,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("Deck Verbo to Be", style: TextStyle(fontSize: 20)),
                            Text("Quantidade: ${index+1}", style: TextStyle(fontSize: 10)),
                            Text("10 de Outubro", style: TextStyle(fontSize: 10))
                          ],
                        
                        ),
                          ],
                          
                        ),
                        
                        Icon(Icons.drag_indicator_rounded)
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const <Widget>[
          Text('Pesquisa'),
        ],
      ),
    );
  }
}



class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          
        ],
      ),
    );
  }
}

*/