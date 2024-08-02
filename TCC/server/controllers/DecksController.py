from server.models.DeckModel import Deck
from flask import jsonify

class DecksController:
    def create_deck(self, deck_data):
        # Implement logic to create a new deck
        new_deck = Deck(deck_data['name'], deck_data['description'], deck_data['cards'])
        new_deck.save()
        pass

    def get_deck(self, deck_id):
        deck = Deck.find_by_name(deck_id)
        return jsonify(deck)
        pass

    def get_all_decks(self):
        decks = Deck.find_all()
        return jsonify(decks)
        pass

    def update_deck(self, deck_id, updated_data):
        # Implement logic to update a specific
        new_deck = Deck(updated_data['name'], updated_data['description'], updated_data['cards'])
        Deck.update_by_name(deck_id, new_deck)
        pass

    def delete_deck(self, deck_id):
        Deck.delete_by_name(deck_id)
        pass

    def get_all_cards(self):
        cards = Deck.find_all_cards()
        return jsonify(cards)
        pass