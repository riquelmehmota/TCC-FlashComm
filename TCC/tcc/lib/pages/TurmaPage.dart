import 'package:flutter/material.dart';

class TurmaPage extends StatelessWidget {
  const TurmaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          itemCount: 3,
          itemBuilder: (context, index) {
            return Padding(
                padding: EdgeInsets.fromLTRB(4, 2, 4, 2),
                child: Card(
                  color: Color.fromARGB(255, 66, 66, 66), 
                  clipBehavior: Clip.hardEdge,
                  child: InkWell(
                    splashColor: Colors.grey[900],
                    onTap: () {
                      Navigator.pushNamed(context, '/turma');
                    },
                    child: SizedBox(
                        width: double.infinity,
                        height: 130,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Nome Turma ${index+1}',
                                          style: TextStyle(fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),
                                        ),
                                        PopupMenuButton<String>(
                                          iconColor: Colors.white,
                                          color: Colors.grey[800],
                                          onSelected: (value) {
                                            print("Selecionado: $value");
                                          },
                                          itemBuilder: (BuildContext context) {
                                            return [
                                              PopupMenuItem(
                                                value: "Sair",
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Text("Sair",
                                                        style: TextStyle(color: Colors.red)),
                                                    Icon(Icons.exit_to_app, color: Colors.red),
                                                  ],
                                                ),
                                              ),
                                              
                                            ];
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                                    child: Text(
                                      'Descrição ${index+1}',
                                      style: TextStyle(fontSize: 14, color: Colors.white),
                                    ),
                                  ),
                                ],
                              )),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Align(
                                    
                                    alignment: Alignment.bottomLeft,
                                    child: Text(
                                      
                                      'Professor: Nome Professor ${index+1}',
                                      style: TextStyle(fontSize: 16, color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )),
                  ),
                ));
          }),
    );
  }
}
