import 'package:flutter/material.dart';

class UserModel with ChangeNotifier {
  Map<String, String> _user = {
    'name': 'Jane Doe',
    'email': 'jane.doe@example.com',
  };

  Map<String, String> get user => _user;

  void setUser(Map<String, String> newUser) {
    _user = newUser;
    notifyListeners();
  }

  void updateUser(Map<String, String> updatedFields) {
    _user.addAll(updatedFields);
    notifyListeners();
  }
}