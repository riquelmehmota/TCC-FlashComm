import 'package:flutter/material.dart';
import 'dart:math';

class CardModel extends StatefulWidget {
  final String pergunta;
  final String resposta;
  final VoidCallback nextCard; // Adicione esta linha
  final VoidCallback onFacilIncrement; // Adicione esta linha
  final VoidCallback onMedioIncrement; // Adicione esta linha
  final VoidCallback onDificilIncrement; // Adicione esta linha
  final VoidCallback onNaoSeiIncrement; // Adicione esta linha
  const CardModel(
      {super.key,
      required this.pergunta,
      required this.resposta,
      required this.nextCard,
      required this.onFacilIncrement,
      required this.onMedioIncrement,
      required this.onDificilIncrement,
      required this.onNaoSeiIncrement});

  @override
  State<CardModel> createState() => _CardModelState();
}

class _CardModelState extends State<CardModel> {
  //declare the isback variable
  bool isBack = true;
  double angle = 0;

  void _flip() {
    setState(() {
      isBack = !isBack;
      angle = (angle + pi) % (2 * pi);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: _flip,
            child: TweenAnimationBuilder(
                tween: Tween<double>(begin: 0, end: angle),
                duration: Duration(milliseconds: 200),
                builder: (BuildContext context, val, __) {
                  return Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.identity()
                      ..setEntry(3, 2, 0.001)
                      ..rotateY(val),
                    child: Container(
                        width: 300,
                        height: 480,
                        child: isBack
                            ? Container(

                                decoration: BoxDecoration(
                                  
                                    color: Colors.grey,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.5),
                                        spreadRadius: 5,
                                        blurRadius: 7,
                                        offset: Offset(0, 3),
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(20)),
                                child: Center(
                                  child: Text(
                                    widget.pergunta,
                                    style: TextStyle(
                                        color:
                                            const Color.fromARGB(255, 0, 0, 0),
                                        fontSize: 30),
                                        textAlign: TextAlign.center,
                                  ),
                                ),
                              )
                            : Transform(
                                alignment: Alignment.center,
                                transform: Matrix4.identity()..rotateY(pi),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.grey[900],
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.5),
                                        spreadRadius: 5,
                                        blurRadius: 7,
                                        offset: Offset(0, 3),
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Column(
                                    children: [
                                      Expanded(
                                        child: Center(
                                          child: Text(
                                            widget.resposta,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 30),
                                          ),
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          IconButton(
                                            icon: Icon(Icons.circle,
                                                color: Color.fromARGB(
                                                    255, 88, 190, 117)),
                                            onPressed: () {
                                              setState(() {
                                                widget.onFacilIncrement();
                                              });

                                              _flip();
                                              widget.nextCard();
                                            },
                                          ),
                                          IconButton(
                                            icon: Icon(Icons.circle,
                                                color: Color.fromARGB(
                                                    255, 211, 216, 58)),
                                            onPressed: () {
                                              setState(() {
                                                widget.onMedioIncrement();
                                              });

                                              _flip();
                                              widget.nextCard();
                                            },
                                          ),
                                          IconButton(
                                            icon: Icon(Icons.circle,
                                                color: Color.fromARGB(
                                                    255, 213, 124, 7)),
                                            onPressed: () {
                                              setState(() {
                                                widget.onDificilIncrement();
                                              });
                                              _flip();
                                              widget.nextCard();
                                            },
                                          ),
                                          IconButton(
                                            icon: Icon(Icons.circle,
                                                color: const Color.fromARGB(
                                                    255, 255, 0, 0)),
                                            onPressed: () {
                                              setState(() {
                                                widget.onNaoSeiIncrement();
                                              });
                                              _flip();

                                              widget.nextCard();
                                            },
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              )),
                  );
                }),
          ),
        ],
      )),
    );
  }
}
