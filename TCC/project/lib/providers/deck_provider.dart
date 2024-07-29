import 'package:flutter/material.dart';
import '../models/deck.dart';
import '../models/flashcard.dart';

class DeckProvider with ChangeNotifier {
  List<Deck> _decks = [
    Deck(name: 'Flutter Basics', flashcards: [
      Flashcard(question: 'O que é Flutter?', answer: 'Um framework de UI da Google.'),
      Flashcard(question: 'O que é Dart?', answer: 'Uma linguagem de programação.'),
    ]),
    // Adicione mais decks aqui
  ];

  List<Deck> get decks => _decks;

  void addDeck(String name) {
    _decks.add(Deck(name: name, flashcards: []));
    notifyListeners();
  }

  void importDeck(Deck deck) {
    _decks.add(deck);
    notifyListeners();
  }

  void addFlashcardToDeck(String deckName, Flashcard flashcard) {
    final deck = _decks.firstWhere((deck) => deck.name == deckName);
    deck.flashcards.add(flashcard);
    notifyListeners();
  }
}
