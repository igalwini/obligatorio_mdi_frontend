import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'user_provider.dart';
import 'navbar.dart';
import 'custom_button.dart';
import 'package:go_router/go_router.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final user = context.watch<UserProvider>().user;

    return Scaffold(
      appBar: PreferredSize(preferredSize: const Size.fromHeight(65), child: const NavBar()),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Profile", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            Text("Name: ${user.name}", style: const TextStyle(fontSize: 18)),
            Text("Email: ${user.email}", style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 24),
            CustomButton(
              onPressed: () {
                // Pasa el user como extra a settings
                context.go('/settings', extra: user);
              },
              child: const Text("Edit in Settings"),
            ),
          ],
        ),
      ),
    );
  }
}