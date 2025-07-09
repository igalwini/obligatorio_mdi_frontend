import 'package:flutter/material.dart';

class User {
  String name;
  String email;
  User({required this.name, required this.email});

  User copyWith({String? name, String? email}) =>
    User(name: name ?? this.name, email: email ?? this.email);
}

class UserProvider extends ChangeNotifier {
  User _user = User(name: "Jane Doe", email: "jane.doe@example.com");

  User get user => _user;

  void setUser(User newUser) {
    _user = newUser;
    notifyListeners();
  }
}