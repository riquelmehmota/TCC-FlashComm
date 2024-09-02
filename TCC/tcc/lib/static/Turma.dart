import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Turma extends StatefulWidget {
  const Turma({super.key});

  @override
  State<Turma> createState() => _TurmaState();
}

class _TurmaState extends State<Turma> {
  int opcaoSelecionada = 0;

  // Aqui você define a lista de páginas que serão exibidas
  final List<Widget> _pages = [
    HomeTurma(),
    Search(),
    Profile(),
  ];
  @override
  Widget build(BuildContext context) {
    return
        Scaffold(
          backgroundColor: Color.fromARGB(255, 20, 21, 24),
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            backgroundColor: Color.fromARGB(20, 255, 255, 255),
            title: const Text('Turma', style: TextStyle(color: Colors.white)),
      ),
      body: _pages[
          opcaoSelecionada], // Exibe a página de acordo com a opção selecionada
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.white,
        backgroundColor: Color.fromARGB(255, 20, 21, 24),
        type: BottomNavigationBarType.fixed,
        currentIndex: opcaoSelecionada,
        onTap: (int index) {
          setState(() {
            opcaoSelecionada = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.book), label: 'Decks'),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: 'Alunos'),
        ],
      ),
    );
  }
}

class HomeTurma extends StatelessWidget {
  const HomeTurma({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
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
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text("Nome da Turma",
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                  Text("Professor: Nome do Professor",
                      style: TextStyle(fontSize: 15, color: Colors.white)),
                  Text("Quantidade de Alunos: 10",
                      style: TextStyle(fontSize: 15, color: Colors.white)),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("Decks este mês",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.grey)),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: 3,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 48, 48, 48),
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
                        const Icon(Icons.circle, size: 50, color: Colors.grey),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text("Nome do Deck",
                                  style: TextStyle(fontSize: 20, color: Colors.white)),
                              Text("Quantidade: ${index + 1}",
                                  style: TextStyle(fontSize: 10, color: Colors.white)),
                              const Text("01/01/2021",
                                  style: TextStyle(fontSize: 10, color: Colors.white)),
                            ],
                          ),
                        ),
                      ],
                    ),
                    PopupMenuButton<String>(
                      color: Colors.grey[900],
                      iconColor: Colors.grey,
                      onSelected: (value) {
                        // Ação a ser tomada ao selecionar uma opção
                        print("Selecionado: $value");
                      },
                      itemBuilder: (BuildContext context) {
                        return [
                          PopupMenuItem(
                            value: "Editar",
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Editar",
                                    style: TextStyle(color: Colors.blue)),
                                Icon(Icons.edit, color: Colors.blue),
                              ],
                            ),
                          ),
                          PopupMenuItem(
                            value: "Excluir",
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Excluir",
                                    style: TextStyle(color: Colors.red)),
                                Icon(Icons.delete, color: Colors.red),
                              ],
                            ),
                          ),
                        ];
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
          shrinkWrap: true,
          physics: PageScrollPhysics(),
          itemCount: 20,
          itemBuilder: (context, index) => 
            //add dividers from 3 to 3, to show differente dates
            Column(
              children: [
                if (index % 3 == 0)
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("0${(index/3+1).toInt()}/01/2021",
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.grey)),
                        
                        
                      ),
                      const Divider(color: Colors.grey, thickness: 1),
                    ],
                  ),
                  
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 48, 48, 48),
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
                              Icon(Icons.circle, size: 50, color: Colors.grey),
                              Padding(
                                padding:  EdgeInsets.only(left: 8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text("Nome do Deck",
                                        style: TextStyle(fontSize: 20, color: Colors.white)),
                                    Text("Quantidade: ${index + 1}",
                                        style: TextStyle(fontSize: 10, color: Colors.white)),
                                      Text("01/01/2021",
                                        style: TextStyle(fontSize: 10, color: Colors.white)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          PopupMenuButton<String>(
                            color: Colors.grey[900],
                            iconColor: Colors.grey,
                            onSelected: (value) {
                              // Ação a ser tomada ao selecionar uma opção
                              print("Selecionado: $value");
                            },
                            itemBuilder: (BuildContext context) {
                              return [
                                PopupMenuItem(
                                  value: "Editar",
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Editar",
                                          style: TextStyle(color: Colors.blue)),
                                      Icon(Icons.edit, color: Colors.blue),
                                    ],
                                  ),
                                ),
                                PopupMenuItem(
                                  value: "Excluir",
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Excluir",
                                          style: TextStyle(color: Colors.red)),
                                      Icon(Icons.delete, color: Colors.red),
                                    ],
                                  ),
                                ),
                              ];
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
        );
  }
}

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                "Professor",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Text(
                "Nome do Professor",
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            ),
            Divider(color: Colors.grey, thickness: 1),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                "Alunos",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: ListView.builder(
                shrinkWrap:
                    true, 
                physics:
                    NeverScrollableScrollPhysics(),
                itemCount: 30,
                itemBuilder: (context, index) => ListTile(
                  trailing: PopupMenuButton<String>(
                    color: Colors.grey[900],
                    iconColor: Colors.grey,
                    onSelected: (value) {
                      print("Selecionado: $value");
                    },
                    itemBuilder: (BuildContext context) {
                      return [
                        PopupMenuItem(
                          value: "Editar",
                          child: Row(
                            children: [
                              Text("Editar" , style: TextStyle(color: Colors.blue)),
                              Icon(Icons.edit, color: Colors.blue),
                            ],
                          ),
                        ),
                        PopupMenuItem(
                          value: "Excluir", 
                          child: Row(
                            children: [
                              Text("Excluir", style: TextStyle(color: Colors.red)),
                              Icon(Icons.delete, color: Colors.red),
                            ],
                          ),
                        ),
                      ];
                    },
                  ),
                  title: Row(
                    children: [
                      ClipOval(
                        child: Image.network("http://thispersondoesnotexist.com",
                            width: 50, height: 50),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Nome do Aluno " + (index + 1).toString(),
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
