import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';

import 'user_model.dart';
import 'custom_button.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final user = context.watch<UserModel>().user;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Profile', style: TextStyle(fontSize: 24)),
        const SizedBox(height: 8),
        Text('Name: ${user.name}'),
        Text('Email: ${user.email}'),
        const SizedBox(height: 8),
        CustomButton(
          label: 'Edit in Settings',
          onPressed: () {
            debugPrint('Botón presionado');
            context.push('/settings', extra: user);
          },
        ),
      ],
    );
  }
}
