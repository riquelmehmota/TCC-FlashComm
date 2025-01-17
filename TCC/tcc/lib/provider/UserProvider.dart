
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:tcc/User.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tcc/static/HomePage.dart';

class AuthProvider extends ChangeNotifier {
  User? _currentUser;

  User? get currentUser => _currentUser;

  void setUser(User user) {
    _currentUser = user;
    notifyListeners();
  }

  Future<void> serializeUser() async {
    // Fetch user from API
    await http.get(Uri.parse('http://192.168.100.112:3000/users/data'))
      .then((response) {
        if (response.statusCode == 200) {
          final user = User(email: jsonDecode(response.body)['email'], username: jsonDecode(response.body)['username'], password: jsonDecode(response.body)['password']);
          setUser(user);
        }
    });
  }



Future<bool> signUp(String email, String password, String username, File file, BuildContext context) async {

  await http.post(
    Uri.parse('http://200.128.141.193:3000/users/singup'),
    body: {
      'username': username,
      'email': email,
      'password': password,
      'file': file 
    },
  ).then((response) {
    if (response.statusCode == 200) {
      print('User created');
    } else {
      print(response.statusCode);
    }
  }).catchError((error) {
    print(error);
  });

  return false; // Retorna false se a inscrição falhar
}



  Future<void> login(String email, String password, BuildContext context) async {
    // Fetch user from API
    await http.post(Uri.parse('http://192.168.100.112:3000/login'), body: {
      'email': email,
      'password': password,
    }).then((response) {
      if (response.statusCode == 200) {
        // final user = User(email: jsonDecode(response.body)['email'], username: jsonDecode(response.body)['username'], password: jsonDecode(response.body)['password']);
        //enter homepge withouth pushnamed
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => HomePage()),
        );
        // setUser(user);
        
      }
    });
  }

  Future<void> delete(int id) async {
    // Fetch user from API
    await http.delete(Uri.parse('https://192.168.100.112:3000/users/delete/${id}'))
      .then((response) {
        if (response.statusCode == 200) {
          print('User deleted');
        }
    });
  }

}