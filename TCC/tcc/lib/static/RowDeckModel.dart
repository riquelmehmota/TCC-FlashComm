import 'package:flutter/material.dart';
import 'package:tcc/static/Deck_Jogar_Screen.dart';

//este é o modelo de deck que será utilizado para exibir os decks
class RowDeckModel extends StatelessWidget {
  final String nome;
  final int quantidade;
  final int index;
  const RowDeckModel({super.key, required this.nome, required this.quantidade, required this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          color: Color.fromARGB(255, 10, 151, 186),
          width: 125,
          height: 200,
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                nome,
                style: TextStyle(fontSize: 20, color: Colors.white),
                textAlign: TextAlign.center,
              ),
              Column(
                children: [
                  Text(
                    'Cartas: $quantidade',
                    style: TextStyle(fontSize: 12, color: Colors.white),
                  ),
                  ElevatedButton(
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
                    child: Text("Acessar"),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
