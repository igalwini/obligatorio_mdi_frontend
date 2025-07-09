import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'user_model.dart';
import 'custom_button.dart';

class SettingsPage extends StatefulWidget {
  final User? userFromProfile;

  const SettingsPage({super.key, this.userFromProfile});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  late TextEditingController _nameController;
  late TextEditingController _emailController;

  @override
  void initState() {
    super.initState();
    final user = widget.userFromProfile ?? context.read<UserModel>().user;
    _nameController = TextEditingController(text: user.name);
    _emailController = TextEditingController(text: user.email);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Settings', style: TextStyle(fontSize: 24)),
        const SizedBox(height: 8),
        TextField(
          controller: _nameController,
          decoration: const InputDecoration(labelText: 'Name'),
        ),
        TextField(
          controller: _emailController,
          decoration: const InputDecoration(labelText: 'Email'),
        ),
        const SizedBox(height: 8),
        CustomButton(
          label: 'Save',
          onPressed: () {
            context.read<UserModel>().setUser(
              User(name: _nameController.text, email: _emailController.text),
            );
            debugPrint('Botón presionado');
          },
        ),
      ],
    );
  }
}
