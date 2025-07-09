import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/user_model.dart';
import '../widgets/custom_button.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late Map<String, String> _formData;

  @override
  void initState() {
    super.initState();
    _formData = {};
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final userModel = Provider.of<UserModel>(context, listen: false);
    final extraData = ModalRoute.of(context)?.settings.arguments as Map<String, String>?;
    
    _formData = Map.from(extraData ?? userModel.user);
  }

  @override
  Widget build(BuildContext context) {
    final userModel = Provider.of<UserModel>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Settings',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Name'),
                initialValue: _formData['name'],
                onChanged: (value) {
                  setState(() {
                    _formData['name'] = value;
                  });
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Email'),
                initialValue: _formData['email'],
                onChanged: (value) {
                  setState(() {
                    _formData['email'] = value;
                  });
                },
              ),
              const SizedBox(height: 16),
              CustomButton(
                text: 'Save',
                onPressed: () {
                  userModel.updateUser(_formData);
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}