from server.models.UserModel import User
from flask import jsonify

class UserController:
    def create_user(self, user_data):
        # Implement logic to create a new user
        new_user = User(user_data['username'], user_data['email'], user_data['password'])
        new_user.save()
        pass

    def get_user(self, username):
        user = User.find_by_username(username)
        return jsonify(user)
        pass

    def update_user(self, username, updated_data):
        # Implement logic to update a specific user
        new_user = User(updated_data['username'], updated_data['email'], updated_data['password'])
        User.update_by_username(username, new_user)
        pass

    def delete_user(self, username):
        User.delete_by_username(username)
        pass