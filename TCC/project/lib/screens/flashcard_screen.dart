import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/deck.dart';
import '../providers/flashcard_provider.dart';

class FlashcardScreen extends StatelessWidget {
  final Deck deck;

  FlashcardScreen({required this.deck});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => FlashcardProvider(deck: deck),
      child: Scaffold(
        appBar: AppBar(
          title: Text(deck.name),
        ),
        body: Center(
          child: Consumer<FlashcardProvider>(
            builder: (context, flashcardProvider, child) => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                GestureDetector(
                  onTap: () => flashcardProvider.toggleCard(),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        flashcardProvider.showAnswer
                            ? flashcardProvider.flashcards[flashcardProvider.currentIndex].answer
                            : flashcardProvider.flashcards[flashcardProvider.currentIndex].question,
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.arrow_back),
                      onPressed: flashcardProvider.previousCard,
                    ),
                    IconButton(
                      icon: Icon(Icons.arrow_forward),
                      onPressed: flashcardProvider.nextCard,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
