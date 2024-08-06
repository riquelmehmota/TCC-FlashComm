
class Users {
  final List users;
  Users(this.users);
}

class User {
  final String id;
  final String username;
  final String email;

  User(this.id, this.username, this.email);

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      json['id'],
      json['username'],
      json['email'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'email': email,
    };
  }
}
