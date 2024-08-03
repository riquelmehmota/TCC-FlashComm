import 'package:flutter/material.dart';

class TurmaPage extends StatelessWidget {
  const TurmaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(itemCount: 3, itemBuilder: (context, index) {
        return Padding(
            padding: EdgeInsets.fromLTRB(8, 8, 8, 4),
            child: Card(
              clipBehavior: Clip.hardEdge,
              child: InkWell(
                splashColor: Colors.blue.withAlpha(30),
                onTap: () {},
                child: SizedBox(
                  width: double.infinity,
                  height: 100,
                  child: Text('A card that can be tapped'),
                ),
              ),
            ));

      }),
    );
  }
}
