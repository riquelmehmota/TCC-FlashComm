import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:project/screens/deck_detail_screen.dart';
import 'add_card_screen.dart';

void main() {
  runApp(HomeScreen());
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Decks',
      home: DecksScreen(),
    );
  }
}

class DecksScreen extends StatefulWidget {
  @override
  _DecksScreenState createState() => _DecksScreenState();
}

class _DecksScreenState extends State<DecksScreen> {
  final String apiUrl = 'http://localhost:5000/decks';
  List decks = [];

  @override
  void initState() {
    super.initState();
    fetchDecks();
  }

  Future<void> fetchDecks() async {
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      setState(() {
        decks = json.decode(response.body);
      });
    } else {
      throw Exception('Falha ao carregar decks');
    }
  }

  Future<void> addDeck(String name) async {
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'name': name,
      }),
    );
    if (response.statusCode == 201) {
      fetchDecks();
    } else {
      throw Exception('Falha ao adicionar deck');
    }
  }

  Future<void> deleteDeck(String id) async {
    final response = await http.delete(Uri.parse('$apiUrl/$id'));
    if (response.statusCode == 200) {
      fetchDecks();
    } else {
      throw Exception('Falha ao deletar deck');
    }
  }

  void _showAddDeckDialog() {
    String deckName = '';
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Adicionar Deck'),
          content: TextField(
            onChanged: (value) {
              deckName = value;
            },
            decoration: InputDecoration(hintText: 'Nome do Deck'),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancelar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Adicionar'),
              onPressed: () {
                addDeck(deckName);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _navigateToDeckDetailScreen(String deckId) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => DeckDetailScreen(deckId: deckId),
      ),
    );
  }

  void _navigateToAddCardScreen(String deckId) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => AddCardScreen(deckId: deckId),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Decks'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: _showAddDeckDialog,
          ),
          IconButton(onPressed: _showAddDeckDialog, icon: Icon(Icons.download)),
        ],
      ),
      body: ListView.builder(
        itemCount: decks.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(decks[index]['name']),
            onTap: () => _navigateToDeckDetailScreen(decks[index]['_id']),
            trailing: Row(
            
  mainAxisSize: MainAxisSize.min, // This ensures the Row only takes as much space as needed
  children: <Widget>[
    IconButton(
      icon: Icon(Icons.add), // First icon
      onPressed: () => _navigateToAddCardScreen(decks[index]['_id']),
    ),
    IconButton(
      icon: Icon(Icons.delete), // Second icon
      onPressed: () => deleteDeck(decks[index]['_id']),
    ),
  ],
),
          );
        },
      ),
    );
  }
}