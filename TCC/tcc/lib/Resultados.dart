import 'package:flutter/material.dart';
import 'package:tcc/HomePage.dart';
import 'dart:math';
class Resultados extends StatelessWidget {
  final int facil;
  final int medio;
  final int dificil;
  final int nao_sei;

  const Resultados({super.key, required this.facil, required this.medio, required this.dificil, required this.nao_sei});
  
  @override
  Widget build(BuildContext context) {
    int total = facil + medio + dificil + nao_sei;
    int max1 = max(facil, medio);
    int max2 = max(dificil, nao_sei);
    int maxFinal = max(max1, max2); 
    return MaterialApp(
        home: Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.black, Colors.purple],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 32, 16, 16),
              child: Center(
                child: Text("Uau, você se saiu muito bem!",
                    style: TextStyle(color: Colors.white, fontSize: 30, fontFamily: 'Montserrat')),
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
                      height: facil*200/maxFinal == 0 ? 50 : facil*200/maxFinal,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(209, 52, 47, 46),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.local_fire_department,
                              color: Colors.white),
                          Text(facil.toString(),
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20)),
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
                      height: medio*200/maxFinal == 0 ? 50 : medio*200/maxFinal,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(209, 52, 47, 46),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.local_fire_department, color: Colors.white),
                          Text(medio.toString(),
                              style: TextStyle(color: Colors.white, fontSize: 20)),
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
                      height: dificil*200/maxFinal == 0 ? 50 : dificil*200/maxFinal,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(209, 52, 47, 46),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.local_fire_department, color: Colors.white),
                          Text(dificil.toString(),
                              style: TextStyle(color: Colors.white, fontSize: 20)),
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
                      height: nao_sei*200/maxFinal == 0 ? 50 : nao_sei*200/maxFinal,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(209, 52, 47, 46),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.local_fire_department, color: Colors.white),
                          Text(nao_sei.toString(),
                              style: TextStyle(color: Colors.white, fontSize: 20)),
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
                          Text("Cartas Vistas:",
                              style: TextStyle(color: Colors.white, fontSize: 16)),
                        ],),
                      ),
                      Text(total.toString(),
                          style: TextStyle(color: Colors.white, fontSize: 16)),
                    ],
                  ),
                )
              ),
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
                          Text("Tempo de Estudo:",
                              style: TextStyle(color: Colors.white, fontSize: 16)),
                        ],),
                      ),
                      Text("2min:30seg",
                          style: TextStyle(color: Colors.white, fontSize: 16)),
                    ],
                  ),
                  
                )
              ),
            ),
            ElevatedButton(onPressed: (){
              Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return HomePage();
                          },
                        ),
                      );
            }, child: Text("Voltar", style: TextStyle(color: Colors.black),)),
          ],
        ),
      ),
    ));
  }
}
