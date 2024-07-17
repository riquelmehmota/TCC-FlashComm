from flask import Flask, request, jsonify
from pymongo import MongoClient
from flask_cors import CORS
from bson.objectid import ObjectId

app = Flask(__name__)
CORS(app)

# Conexão com o MongoDB
client = MongoClient('mongodb+srv://teste:1234@cluster0.gn1h0by.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0')
db = client['decks_db']
collection = db['decks']

@app.route('/decks', methods=['POST'])
def create_deck():
    data = request.json
    name = data['name']
    flashcards = data.get('flashcards', [])
    deck_id = collection.insert_one({'name': name, 'flashcards': flashcards}).inserted_id
    return jsonify({"message": "Deck criado com sucesso!", "id": str(deck_id)}), 201

@app.route('/decks', methods=['GET'])
def get_decks():
    decks = list(collection.find())
    for deck in decks:
        deck['_id'] = str(deck['_id'])
    return jsonify(decks), 200

@app.route('/decks/<deck_id>', methods=['GET'])
def get_deck(deck_id):
    deck = collection.find_one({'_id': ObjectId(deck_id)})
    if deck:
        deck['_id'] = str(deck['_id'])
        return jsonify(deck), 200
    else:
        return jsonify({"message": "Deck não encontrado"}), 404

@app.route('/decks/<deck_id>/cards', methods=['POST'])
def add_card_to_deck(deck_id):
    data = request.json
    question = data['question']
    answer = data['answer']
    result = collection.update_one(
        {'_id': ObjectId(deck_id)},
        {"$push": {'flashcards': {'question': question, 'answer': answer}}}
    )
    if result.modified_count > 0:
        return jsonify({"message": "Card adicionado com sucesso!"}), 200
    else:
        return jsonify({"message": "Deck não encontrado"}), 404

@app.route('/decks/<deck_id>', methods=['PUT'])
def update_deck(deck_id):
    data = request.json
    name = data['name']
    flashcards = data.get('flashcards', [])
    result = collection.update_one({'_id': ObjectId(deck_id)}, {"$set": {'name': name, 'flashcards': flashcards}})
    if result.modified_count > 0:
        return jsonify({"message": "Deck atualizado com sucesso!"}), 200
    else:
        return jsonify({"message": "Deck não encontrado"}), 404

@app.route('/decks/<deck_id>', methods=['DELETE'])
def delete_deck(deck_id):
    result = collection.delete_one({'_id': ObjectId(deck_id)})
    if result.deleted_count > 0:
        return jsonify({"message": "Deck deletado com sucesso!"}), 200
    else:
        return jsonify({"message": "Deck não encontrado"}), 404

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0')
