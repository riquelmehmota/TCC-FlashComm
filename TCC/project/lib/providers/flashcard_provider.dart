import 'package:flutter/material.dart';
import '../models/deck.dart';
import '../models/flashcard.dart';

class FlashcardProvider with ChangeNotifier {
  final Deck _deck;
  int _currentIndex = 0;
  bool _showAnswer = false;

  FlashcardProvider({required Deck deck}) : _deck = deck;

  List<Flashcard> get flashcards => _deck.flashcards;
  int get currentIndex => _currentIndex;
  bool get showAnswer => _showAnswer;

  void nextCard() {
    if (_currentIndex < _deck.flashcards.length - 1) {
      _currentIndex++;
      _showAnswer = false;
      notifyListeners();
    }
  }

  void previousCard() {
    if (_currentIndex > 0) {
      _currentIndex--;
      _showAnswer = false;
      notifyListeners();
    }
  }

  void toggleCard() {
    _showAnswer = !_showAnswer;
    notifyListeners();
  }
}
