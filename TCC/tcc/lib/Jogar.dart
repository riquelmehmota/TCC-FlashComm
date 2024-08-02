import 'package:flutter/material.dart';
import 'package:tcc/CardModel.dart';
import 'package:tcc/Deck_Dados.dart';
import 'package:tcc/Resultados.dart';




class Jogar extends StatefulWidget {
  final int index;

  const Jogar({super.key, required this.index});

  @override
  State<Jogar> createState() => _JogarState();
}
class _JogarState extends State<Jogar> {
  int currentCardIndex = 0;
  int facil = 0;
  int medio = 0;
  int dificil = 0;
  int nao_sei = 0;
  void incrementFacil() {
    setState(() {
      facil++;
    });
  }
  void incrementMedio() {
    setState(() {
      medio++;
    });
  }
  void incrementDificil() {
    setState(() {
      dificil++;
    });
  }
  void incrementNaoSei() {
    setState(() {
      nao_sei++;
    });
  }
  void nextCard() {
    setState(() {
      if (currentCardIndex < decks[widget.index]["cartas"].length - 1) {
        currentCardIndex++;
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return Resultados(
                facil: facil,
                medio: medio,
                dificil: dificil,
                nao_sei: nao_sei,
              );
            },
          ),
        );
      }
    });
  }
      
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.black, Colors.purple],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: CardModel(
            onFacilIncrement: incrementFacil,
            onMedioIncrement: incrementMedio,
            onDificilIncrement: incrementDificil,
            onNaoSeiIncrement: incrementNaoSei,
            pergunta: decks[widget.index]["cartas"][currentCardIndex]["pergunta"].toString(),
            resposta: decks[widget.index]["cartas"][currentCardIndex]["resposta"].toString(),
            nextCard: nextCard, // Passe a callback nextCard aqui
          ),
        ),
      ),
    );
  }
}
