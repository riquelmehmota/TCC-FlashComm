import 'package:flutter/material.dart';
import 'package:tcc/static/Deck_Jogar_Screen.dart';
import '../Deck_Dados.dart';

class InicioPage extends StatefulWidget {


  const InicioPage({super.key});

  @override
  State<InicioPage> createState() => _InicioPageState();
}

class _InicioPageState extends State<InicioPage> {
  //lista de imagens
  @override
  Widget build(BuildContext context) {
    return Column(
  children: [
    Container(
      height: 200,
      child: ListView.builder(
        itemCount: 6, // Incrementa o itemCount em 1 para o item adicional
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          if (index == 5 ) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 125,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.grey[800],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(
                      "Ver Todos Decks",
                      style: TextStyle(fontSize: 16, color: Colors.black),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            );
          } else {
            final deck = decks[index];
            return RowDeckModel(
              image: deck['imagem'],
              nome: deck['nome_do_deck'],
              quantidade: deck['quantidade_de_cartas'],
              index: index,
            );
          }
        },
      ),
    ),
    StreakModel(),
  ],
);

  }
}



class RowDeckModel extends StatelessWidget {
  final String image;
  final String nome;
  final int quantidade;
  final int index;

  const RowDeckModel({
    super.key,
    required this.image,
    required this.nome,
    required this.quantidade,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(image),
            fit: BoxFit.cover,
            opacity: 0.5,
          ),
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey[800],
        ),
        width: 125,
        height: 200,
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              nome,
              style: const TextStyle(fontSize: 20, color: Colors.white),
              textAlign: TextAlign.center,
            ),
            Column(
              children: [
                Text(
                  'Cartas: $quantidade',
                  style: const TextStyle(fontSize: 12, color: Colors.white),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return Deck_Jogar_Screen(
                            nome: nome,
                            quantidade: quantidade,
                            index: index,
                          );
                        },
                      ),
                    );
                  },
                  child: const Text(
                    "Acessar",
                    style: TextStyle(fontSize: 12, color: Colors.black),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}



class StreakModel extends StatelessWidget {
  const StreakModel({super.key});

  @override
  Widget build(BuildContext context) {
     return Expanded(child: 
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[800],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Sua Ofensiva",
                  style: TextStyle(fontSize: 32, color: Colors.white),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text("Seg",
                          style: TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255))),
                      Icon(Icons.local_fire_department,
                          color: Color.fromARGB(255, 214, 83, 13), size: 48),
                    ],
                  ),
                  Column(
                    children: [
                      Text("Ter", style: TextStyle(color: Colors.white)),
                      Icon(Icons.local_fire_department,
                          color: Color.fromARGB(255, 214, 83, 13), size: 48),
                    ],
                  ),
                  Column(
                    children: [
                      Text("Qua", style: TextStyle(color: Colors.white)),
                      Icon(Icons.local_fire_department,
                          color: Color.fromARGB(255, 214, 83, 13), size: 48),
                    ],
                  ),
                  Column(
                    children: [
                      Text("Qui", style: TextStyle(color: Colors.white)),
                      Icon(Icons.local_fire_department,
                          color: Color.fromARGB(255, 214, 83, 13), size: 48),
                    ],
                  ),
                  Column(
                    children: [
                      Text("Sex", style: TextStyle(color: Colors.white)),
                      Icon(Icons.local_fire_department,
                          color: Color.fromARGB(255, 214, 83, 13), size: 48),
                    ],
                  ),
                  Column(
                    children: [
                      Text("Sáb", style: TextStyle(color: Colors.white)),
                      Icon(Icons.local_fire_department, color: Colors.white, size: 48),
                    ],
                  ),
                  Column(
                    children: [
                      Text("Dom", style: TextStyle(color: Colors.white)),
                      Icon(Icons.local_fire_department, color: Colors.white, size: 48),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Dias em sequência: 5",
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Melhor Sequência: 7",
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
              ),
            ],
          ),
             ),
      )); 
    
  }
}