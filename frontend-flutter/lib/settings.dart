import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'user_provider.dart';
import 'navbar.dart';
import 'custom_button.dart';

class SettingsView extends StatefulWidget {
  final User? userFromProfile;
  const SettingsView({super.key, this.userFromProfile});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  late TextEditingController _nameController;
  late TextEditingController _emailController;

  @override
  void initState() {
    super.initState();
    final user = widget.userFromProfile ?? context.read<UserProvider>().user;
    _nameController = TextEditingController(text: user.name);
    _emailController = TextEditingController(text: user.email);
  }

  @override
  Widget build(BuildContext context) {
    final setUser = context.read<UserProvider>().setUser;

    return Scaffold(
      appBar: PreferredSize(preferredSize: const Size.fromHeight(65), child: const NavBar()),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Settings", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Name:"),
                  TextField(controller: _nameController),
                  const SizedBox(height: 16),
                  const Text("Email:"),
                  TextField(controller: _emailController),
                  const SizedBox(height: 24),
                  CustomButton(
                    onPressed: () {
                      setUser(
                        User(
                          name: _nameController.text,
                          email: _emailController.text,
                        ),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Saved!")),
                      );
                    },
                    child: const Text("Save"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}