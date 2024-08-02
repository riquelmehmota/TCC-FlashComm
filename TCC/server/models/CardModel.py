from server.models.db import db

class Card:
    def __init__(self, question, answer, deck_id):
        self.question = question
        self.answer = answer
        self.deck_id = deck_id

    def save(self):
        # Save the card to the database
        db.cards.insert_one({
            'question': self.question,
            'answer': self.answer,
            'deck_id': self.deck_id
        })

    @staticmethod
    def create_card(title, content, deck_id):
        new_card = Card(title, content, deck_id)
        new_card.save()

    @staticmethod
    def delete_card(title):
        db.cards.delete_one({'title': title})
    
    @staticmethod
    def get_all_cards():
        return db.cards.find()
    
    
