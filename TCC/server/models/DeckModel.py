from server.models.db import db
from server.models.CardModel import Card

# Define the Deck model

class Deck:
    def __init__(self, name, description, cards = []):
        self.name = name
        self.description = description
        self.cards = cards

    def save(self):
        # Save the deck to the database
        db.decks.insert_one({
            'name': self.name,
            'description': self.description,
            'num_cards': len(self.cards)
        })

    @staticmethod
    def find_by_name(name):
        # Find a deck by name
        return db.decks.find_one({'name': name})

    @staticmethod
    def find_all():
        # Find all decks
        return db.decks.find()

    @staticmethod
    def delete_by_name(name):
        # Delete a deck by name
        db.decks.delete_one({'name': name})

    @staticmethod
    def update_by_name(name, new_deck):
        # Update a deck by name
        db.decks.update_one({'name': name}, {'$set': new_deck})


    @staticmethod
    def find_all_cards():
        deck_collection = db['decks']
        decks = deck_collection.find()
        result = []
        for deck in decks:
            new_deck = Deck(deck['name'])
            for card_data in deck['cards']:
                card = Card(card_data['title'], card_data['content'], card_data['deck_id'])
                new_deck.add_card(card)
            result.append(new_deck)
        return result