from flask import Flask, request, jsonify
from pymongo import MongoClient
from flask_cors import CORS
from server.models.db import db



app = Flask(__name__)
CORS(app)


@app.route('/findDeck', methods=['GET'])
def find_deck():
    deck = Deck.find_by_name(request.args.get('name'))
    return jsonify(deck)

@app.route('/findAllDecks', methods=['GET'])
def find_all_decks():
    decks = Deck.find_all()
    return jsonify(decks)


if __name__ == '__main__':
    db()
    app.run(debug=True, host='0.0.0.0')

