
class User {
  int id;  // Adicionado campo ID
  final String username;
  final String email;
  final String password;
  final String  image;  // Adicionado campo image
  User({
    this.id = 0,  // Inicialmente definido como 0, será atualizado ao salvar
    required this.username,
    required this.email,
    required this.password,
    required this.image,  // Adicionado campo image
  });
  User copyWith({
    String? username,
    String? email,
    String? password,
    String? image,
  }) {
    return User(
      username: username ?? this.username,
      email: email ?? this.email,
      password: password ?? this.password,
      image: image ?? this.image,
    );
  }
  //adicionado método fromJson
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      username: json['username'],
      email: json['email'],
      password: json['password'],
      image: json['image'],  // Adicionado campo image
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'email': email,
      'password': password,
      'image': image,  // Adicionado campo image
    };
  }
}