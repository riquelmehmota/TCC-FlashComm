import 'package:flutter/material.dart';
import 'package:tcc/static/HomePage.dart';
import 'dart:math';

class Resultados extends StatelessWidget {
  final int facil;
  final int medio;
  final int dificil;
  final int nao_lembro;
  final int seconds;
  const Resultados(
      {super.key,
      required this.facil,
      required this.medio,
      required this.dificil,
      required this.nao_lembro,
      required this.seconds});

  @override
  Widget build(BuildContext context) {
    int total = facil + medio + dificil + nao_lembro;
    int max1 = max(facil, medio);
    int max2 = max(dificil, nao_lembro);
    int maxFinal = max(max1, max2);
    return MaterialApp(
        home: Scaffold(
      backgroundColor: Color.fromARGB(255, 20, 21, 24),
      body: Expanded(
        child: Container(
          color: Colors.transparent,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 32, 16, 16),
                child: Center(
                  child: Text("Uau, você se saiu muito bem!",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold)),
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Container(
                        width: 80,
                        height: facil * 200 / maxFinal == 0
                            ? 30
                            : facil * 200 / maxFinal,
                        decoration: BoxDecoration(
                          color: facil == 0
                              ? Color.fromARGB(0, 0, 0, 0)
                              : Color.fromARGB(209, 52, 47, 46),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.circle,
                                color: Color.fromARGB(255, 88, 190, 117)),
                            Text(facil.toString(),
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20)),
                          ],
                        ),
                      ),
                      Text("Facil", style: TextStyle(color: Colors.white)),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        width: 80,
                        height: medio * 200 / maxFinal == 0
                            ? 30
                            : medio * 200 / maxFinal,
                        decoration: BoxDecoration(
                          color: medio == 0
                              ? Color.fromARGB(0, 0, 0, 0)
                              : Color.fromARGB(209, 52, 47, 46),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.circle,
                                color: Color.fromARGB(255, 211, 216, 58)),
                            Text(medio.toString(),
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20)),
                          ],
                        ),
                      ),
                      Text("Medio", style: TextStyle(color: Colors.white)),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        width: 80,
                        height: dificil * 200 / maxFinal == 0
                            ? 30
                            : dificil * 200 / maxFinal,
                        decoration: BoxDecoration(
                          color: dificil == 0
                              ? Color.fromARGB(0, 0, 0, 0)
                              : Color.fromARGB(209, 52, 47, 46),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.circle,
                                color: Color.fromARGB(255, 213, 124, 7)),
                            Text(dificil.toString(),
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20)),
                          ],
                        ),
                      ),
                      Text("Dificil", style: TextStyle(color: Colors.white)),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        width: 80,
                        height: nao_lembro * 200 / maxFinal == 0
                            ? 30
                            : nao_lembro * 200 / maxFinal,
                        decoration: BoxDecoration(
                          color: nao_lembro == 0
                              ? Color.fromARGB(0, 0, 0, 0)
                              : Color.fromARGB(209, 52, 47, 46),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.circle,
                                color: const Color.fromARGB(255, 255, 0, 0)),
                            Text(nao_lembro.toString(),
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20)),
                          ],
                        ),
                      ),
                      Text("Nao lembro", style: TextStyle(color: Colors.white)),
                    ],
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                    width: double.infinity,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(209, 52, 47, 46),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Row(
                              children: [
                                Icon(Icons.call_to_action, color: Colors.white),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Text("Cartas Vistas:",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16)),
                                ),
                              ],
                            ),
                          ),
                          Text(total.toString(),
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16)),
                        ],
                      ),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                    width: double.infinity,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(209, 52, 47, 46),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Row(
                              children: [
                                Icon(Icons.access_time, color: Colors.white),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Text("Tempo de Estudo:",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16)),
                                ),
                              ],
                            ),
                          ),
                          Text(seconds.toString() + "s",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16)),
                        ],
                      ),
                    )),
              ),

              Row(
                children: [
                  //icon compartile
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(209, 52, 47, 46),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Icon(Icons.share, color: Colors.white),
                    ),
                  ),
                  Text("Compartilhar",
                      style: TextStyle(color: Colors.white, fontSize: 16)),
                ],
              ),

              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return HomePage();
                        },
                      ),
                    );
                  },
                  child: Text(
                    "Voltar",
                    style: TextStyle(color: Colors.black),
                  )),
            ],
          ),
        ),
      ),
    ));
  }
}
