import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:tcc/User.dart';
import 'package:tcc/models/user_model.dart';
import 'package:provider/provider.dart';



class UserProvider extends ChangeNotifier {

  User? user;

  User? get getUser => user;

  void setuser () {
    
    user = Future<void> registerUser(BuildContext context, String username, String email, String password) async {
    final response = await http.post(
      Uri.parse('http://localhost:3000/users/signup'),
      body: jsonEncode(<String, String>{
        'username': username,
        'email': email,
        'password': password,
      }),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'accept': 'multipart/form-data',
      },
    );

    if (response.statusCode == 201 || response.statusCode == 200) {
      print('User registered successfully');
      final user = User(
        jsonDecode(response.body)['id'],
        jsonDecode(response.body)['username'],
        jsonDecode(response.body)['email'],
      );
      Provider.of<UserModel>(context, listen: false).setUser(user);
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      print('Failed to register user');
    }
  }
    notifyListeners();
  }

  
}
