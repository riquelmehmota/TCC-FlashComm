import 'package:flutter/material.dart';
import 'package:tcc/static/Card.dart';
import 'package:tcc/Deck_Dados.dart';
import 'package:tcc/static/Resultados.dart';
import 'dart:async';




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
  Timer? _timer;
  int _seconds = 0;

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _seconds++;
      });
    });
  }

  void _stopTimer() {
    _timer?.cancel();
  }
  void nextCard() {
    setState(() {
      if (currentCardIndex < decks[widget.index]["cartas"].length - 1) {
        currentCardIndex++;
      } else {
        _stopTimer();
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return Resultados(
                seconds: _seconds,
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
  void initState() {
  super.initState();
  _startTimer(); // Inicie o timer aqui
  }
  void dispose() {
    _timer?.cancel(); // Certifique-se de cancelar o timer ao descartar o widget
    super.dispose();
  }
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        
        backgroundColor: Colors.blue,
        body: Container(
          
          child: Column(
            
            children: [
              AppBar(
                title: Text(decks[widget.index]["nome_do_deck"].toString()),
                actions: [
                  Padding(
                    padding: const EdgeInsets.only(right: 40),
                    child: Text("$_seconds", style: TextStyle(fontSize: 20)),
                  ),
                ],
                backgroundColor: Colors.transparent,
              ),
              Expanded(
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
            ],
          ),
        ),
      ),
    );
  }
}
