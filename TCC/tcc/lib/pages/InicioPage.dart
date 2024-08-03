import 'package:flutter/material.dart';
import 'package:tcc/static/RowDeckModel.dart';
import 'package:tcc/static/StreakModel.dart';
import '../Deck_Dados.dart';

class InicioPage extends StatefulWidget {
  const InicioPage({super.key});

  @override
  State<InicioPage> createState() => _InicioPageState();
}

class _InicioPageState extends State<InicioPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          height: 200,
          child: Row(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: decks.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final deck = decks[index];
                    return RowDeckModel(
                      nome: deck['nome_do_deck'],
                      quantidade: deck['quantidade_de_cartas'],
                      index: index,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        StreakModel(),
      ],
    );
  }
}
