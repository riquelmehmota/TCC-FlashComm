
class User {
  int id;
  final String username;
  final String email;
  final String password;
  

  User({
    required this.username,
    required this.email,
    required this.password,
    this.id = 0,
  });

  
}