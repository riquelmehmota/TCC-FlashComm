import 'package:flutter/material.dart';
import 'package:tcc/static/Jogar.dart';
class Deck_Jogar_Screen extends StatelessWidget {
  final String nome;
  final int quantidade;
  final int index;
  const Deck_Jogar_Screen({super.key, required this.nome, required this.quantidade, required this.index});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 20, 21, 24),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: AppBar(
  leading: IconButton(
    icon: Icon(Icons.arrow_back),
    onPressed: () {
      Navigator.pop(context);
    },
  ),
  iconTheme: const IconThemeData(color: Colors.white),
  backgroundColor: Colors.transparent,
  elevation: 0,
  title: Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Spacer(), 
      const Text('Jogar', style: TextStyle(color: Colors.white)),
      Spacer(), 
    ],
  ),
  actions: [SizedBox(width: 48)], 
)

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
                          nome,
                          style: TextStyle(color: Colors.white, fontSize: 30),
                        ),
                        Text("$quantidade Cartas", style: TextStyle(color: Colors.white, fontSize: 20)),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(32.0, 16, 32, 16),
                    child: Container(
                      height: 50,
                      width: double.infinity,
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
                        
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    )
    );
  }
}
