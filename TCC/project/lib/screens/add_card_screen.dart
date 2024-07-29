import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class AddCardScreen extends StatefulWidget {
  final String deckId;

  AddCardScreen({required this.deckId});

  @override
  _AddCardScreenState createState() => _AddCardScreenState();
}

class _AddCardScreenState extends State<AddCardScreen> {
  final TextEditingController _questionController = TextEditingController();
  final TextEditingController _answerController = TextEditingController();

  Future<void> addCard() async {
    final response = await http.post(
      Uri.parse('http://localhost:5000/decks/${widget.deckId}/cards'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'question': _questionController.text,
        'answer': _answerController.text,
      }),
    );
    if (response.statusCode == 200) {
      Navigator.of(context).pop();
    } else {
      throw Exception('Falha ao adicionar card');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adicionar Card'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _questionController,
              decoration: InputDecoration(labelText: 'Pergunta'),
            ),
            TextField(
              controller: _answerController,
              decoration: InputDecoration(labelText: 'Resposta'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: addCard,
              child: Text('Adicionar Card'),
            ),
          ],
        ),
      ),
    );
  }
}
