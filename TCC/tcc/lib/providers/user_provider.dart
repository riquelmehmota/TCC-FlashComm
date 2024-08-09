import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tcc/models/user_model.dart';

class UserProvider extends ChangeNotifier {
  User _user = User(0, '', '');
  ByteBuffer _image = Uint8List(0).buffer;

  User get user => _user;
  ByteBuffer get image => _image;

  Future<void> registerUser(String username, String email, String password) async {
    final response = await http.post(
      
      Uri.parse('http://192.168.100.6:3000/users/singup'),
      body: jsonEncode(<String, String>{
        'username': username,
        'email': email,
        'password': password,
      }),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      
    );
    print(response.statusCode);
    if (response.statusCode == 201 || response.statusCode == 200) {
      print('User registered successfully');
      final responseJson = json.decode(response.body);
      _user = User(responseJson['id'], responseJson['username'], email);
      notifyListeners();
    } else {
      print('Failed to register user');
    }
  }

  Future<void> loginUser(String email, String password) async {
    final response = await http.post(
      Uri.parse('http://localhost:3000/login'),
      body: jsonEncode(<String, String>{
        'email': email,
        'password': password,
      }),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    print(response.statusCode);
    if (response.statusCode == 200) {
      print('User logged in successfully');
      final responseJson = json.decode(response.body);
      _user = User(responseJson['id'], responseJson['username'], email);
      notifyListeners();
    } else {
      print('Failed to login user');
    }
  }

  Future<void> logoutUser() async {
    _user = User(0, '', '');
    notifyListeners();
  }

  Future<void> imageUser(int id) async {
    final response = await http.get(
      Uri.parse('http://192.168.100.6:3000/users/image/${id}'),
      
    );
    print(response.statusCode);
    if (response.statusCode == 200) {
      print('User image uploaded successfully');
      final responseJson = json.decode(response.body);
      _image = Uint8List.fromList(responseJson['image']).buffer;
      notifyListeners();
    } else {
      print('Failed to upload user image');
    }
  }
  
}