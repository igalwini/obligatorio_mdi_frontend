import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../user_provider.dart';
import '../widgets/custom_button.dart';

class SettingsPage extends StatefulWidget {
  final Map<String, dynamic>? userData;

  const SettingsPage({Key? key, this.userData}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  late TextEditingController _nameController;
  late TextEditingController _emailController;

  @override
  void initState() {
    super.initState();
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    final userData = widget.userData ?? {
      'name': userProvider.user.name,
      'email': userProvider.user.email,
    };
    
    _nameController = TextEditingController(text: userData['name']);
    _emailController = TextEditingController(text: userData['email']);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  void _handleSubmit() {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    userProvider.setUser(User(
      name: _nameController.text,
      email: _emailController.text,
    ));
    print("Botón presionado");
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Settings',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 16),
        Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const SizedBox(
                    width: 80,
                    child: Text(
                      'Name: ',
                      style: TextStyle(fontSize: 16, color: Colors.black87),
                    ),
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: _nameController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  const SizedBox(
                    width: 80,
                    child: Text(
                      'Email: ',
                      style: TextStyle(fontSize: 16, color: Colors.black87),
                    ),
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: _emailController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              CustomButton(
                text: 'Save',
                type: ButtonType.submit,
                onPressed: _handleSubmit,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
