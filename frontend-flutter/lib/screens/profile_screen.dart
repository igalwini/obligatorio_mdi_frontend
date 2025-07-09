import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/user_model.dart';
import '../widgets/custom_button.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel>(context).user;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Profile',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        Text('Name: ${user['name']}'),
        const SizedBox(height: 8),
        Text('Email: ${user['email']}'),
        const SizedBox(height: 16),
        CustomButton(
          text: 'Edit in Settings',
          onPressed: () {
            print('Botón presionado');
            Navigator.of(context).pushNamed('/settings', arguments: user);
          },
        ),
      ],
    );
  }
}