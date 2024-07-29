import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/deck_provider.dart';

class AddDeckScreen extends StatefulWidget {
  @override
  _AddDeckScreenState createState() => _AddDeckScreenState();
}

class _AddDeckScreenState extends State<AddDeckScreen> {
  final _formKey = GlobalKey<FormState>();
  String _deckName = '';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              decoration: InputDecoration(labelText: 'Nome do Deck'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, insira um nome para o deck';
                }
                return null;
              },
              onSaved: (value) {
                _deckName = value!;
              },
            ),
            ElevatedButton(
              child: Text('Adicionar Deck'),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  Provider.of<DeckProvider>(context, listen: false)
                      .addDeck(_deckName);
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
