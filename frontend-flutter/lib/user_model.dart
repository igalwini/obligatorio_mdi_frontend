import 'package:flutter/material.dart';

class User {
  String name;
  String email;

  User({required this.name, required this.email});
}

class UserModel extends ChangeNotifier {
  User _user = User(name: 'Jane Doe', email: 'jane.doe@example.com');

  User get user => _user;

  void setUser(User newUser) {
    _user = newUser;
    notifyListeners();
  }
}
