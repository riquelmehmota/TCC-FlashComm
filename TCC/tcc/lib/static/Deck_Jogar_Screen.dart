import 'package:flutter/material.dart';
import 'package:tcc/static/Jogar.dart';
class Deck_Jogar_Screen extends StatelessWidget {
  final String nome;
  final int quantidade;
  final int index;
  const Deck_Jogar_Screen({super.key, required this.nome, required this.quantidade, required this.index});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: Colors.blue,
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: AppBar(
                iconTheme: const IconThemeData(color: Colors.white),
                title: Center(
                  child: const Text('Jogar', style: TextStyle(color: Colors.white)),
                ),
                backgroundColor: Colors.transparent,
                elevation: 0,
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 300,
                    height: 480,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "$nome",
                          style: TextStyle(color: Colors.white, fontSize: 30),
                        ),
                        Text("$quantidade Cartas", style: TextStyle(color: Colors.white, fontSize: 20)),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return Jogar(index: index);
                          },
                        ),
                      );
                      },
                      child: Text("Jogar", style: TextStyle(color: Colors.black, fontSize: 20)),
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.fromLTRB(150, 20, 150, 20),
                        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
