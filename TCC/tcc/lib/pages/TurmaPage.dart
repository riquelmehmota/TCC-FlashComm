import 'package:flutter/material.dart';

class TurmaPage extends StatelessWidget {
  const TurmaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          itemCount: 3,
          itemBuilder: (context, index) {
            return Padding(
                padding: EdgeInsets.fromLTRB(8, 4, 8, 4),
                child: Card(
                  clipBehavior: Clip.hardEdge,
                  child: InkWell(
                    splashColor: Colors.blue.withAlpha(30),
                    onTap: () {},
                    child: SizedBox(
                        width: double.infinity,
                        height: 130,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  
                              children: [
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                                  child: Text(
                                    'Nome Turma $index',
                                    style: TextStyle(fontSize: 24),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                                  child: Text(
                                    'Descrição $index',
                                    style: TextStyle(fontSize: 14),
                                  ),
                                ),
                              ],
                            )),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Align(
                                  
                                  alignment: Alignment.bottomLeft,
                                  child: Text(
                                    
                                    'Professor: Nome Professor $index',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )),
                  ),
                ));
          }),
    );
  }
}
