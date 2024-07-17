from flask import Flask, request, jsonify
from pymongo import MongoClient
from flask_cors import CORS

app = Flask(__name__)
CORS(app)

# Conexão com o MongoDB
client = MongoClient('mongodb+srv://teste:1234@cluster0.gn1h0by.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0')
db = client['usuarios_db']
collection = db['usuarios']

@app.route('/cadastrar', methods=['POST'])
def cadastrar():
    data = request.json
    print(f"Recebido: {data}")  # Log de recebimento de dados
    pergunta = data['pergunta']
    resposta = int(data['resposta'])  # Converter idade para inteiro, se necessário

    # Inserir no MongoDB
    collection.insert_one({'pergunta': pergunta, 'resposta': resposta})
    return jsonify({"message": "Usuário cadastrado com sucesso!"}), 201

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0')
