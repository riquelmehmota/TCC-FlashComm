
import 'dart:convert';

import 'package:tcc/User.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthProvider extends ChangeNotifier {
  User? _currentUser;

  User? get currentUser => _currentUser;

  void setUser(User user) {
    _currentUser = user;
    notifyListeners();
  }

  Future<void> serializeUser() async {
    // Fetch user from API
    await http.get(Uri.parse('https://200.128.141.167:3000/users/data'))
      .then((response) {
        if (response.statusCode == 200) {
          final user = User(email: jsonDecode(response.body)['email'], username: jsonDecode(response.body)['username'], password: jsonDecode(response.body)['password']);
          setUser(user);
        }
    });
  }

   Future<void> singup(String email, String password) async {
    // Fetch user from API
      await http.post(Uri.parse('https://200.128.141.167:3000/users/singup'), body: {
        'email': email,
        'password': password,
      }).then((response) {
        if (response.statusCode == 200) {
          final user = User(email: jsonDecode(response.body)['email'], username: jsonDecode(response.body)['username'], password: jsonDecode(response.body)['password']);
          setUser(user);
        }
      });

    }


  Future<void> login(String email, String password) async {
    // Fetch user from API
    await http.post(Uri.parse('https://200.128.141.167:3000/users/singup'), body: {
      'email': email,
      'password': password,
    }).then((response) {
      if (response.statusCode == 200) {
        final user = User(email: jsonDecode(response.body)['email'], username: jsonDecode(response.body)['username'], password: jsonDecode(response.body)['password']);
        setUser(user);
      }
    });
  }
}