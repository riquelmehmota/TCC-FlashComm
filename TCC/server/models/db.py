from pymongo import MongoClient

# Connect to MongoDB
def __init__(self):
    try:
        self.client = MongoClient('mongodb+srv://teste:1234@cluster0.gn1h0by.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0')
        self.db = self.client['tcc']
        self.users = self.db['users']
        self.decks = self.db['decks']
        self.cards = self.db['cards']
        print('Connected to MongoDB')
    except Exception as e:
        print(e)
    return self


