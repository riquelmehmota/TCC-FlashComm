import 'package:flutter/material.dart';

class StreakModel extends StatelessWidget {
  const StreakModel({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          height: MediaQuery.of(context).size.height - 296,
          width: double.infinity,
          color: Color.fromARGB(255, 10, 186, 183),
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
      ),
    );
  }
}
