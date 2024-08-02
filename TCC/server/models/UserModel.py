
from server.models.db import db

# Define the User model
class User:
    def __init__(self, username, email, password):
        self.username = username
        self.email = email
        self.password = password

    def save(self):
        # Save the user to the database
        db.users.insert_one({
            'username': self.username,
            'email': self.email,
            'password': self.password
        })

    @staticmethod
    def find_by_username(username):
        # Find a user by username
        return db.users.find_one({'username': username})
    
    @staticmethod
    def update_by_username(username, new_user):
        # Update a user by username
        db.users.update_one({'username': username}, {'$set': new_user})

    @staticmethod
    def delete_by_username(username):
        # Delete a user by username
        db.users.delete_one({'username': username})

    @staticmethod
    def find_by_email(email):
        # Find a user by email
        return db.users.find_one({'email': email})